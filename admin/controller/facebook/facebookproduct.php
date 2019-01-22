<?php
require_once('ControllerFacebookFacebookProductTrait.php');

class ControllerFacebookFacebookProduct extends Controller {
  use ControllerFacebookFacebookProductTrait;

  public function __construct($registry) {
    parent::__construct($registry);
    $this->loadLibrariesForFacebookCatalog();
  }

  // this is a backend controller for syncing facebook products,
  // so there is no frontend UI involved
  public function index() {
  }

  private function logProductSuccess(
    $product_id,
    $facebook_product_id,
    $operation) {
    $this->logSuccess(
      ' product ',
      $product_id,
      $facebook_product_id,
      $operation);
  }

  private function logProductFailure(
    $product_id,
    $facebook_product_id,
    $operation,
    $result) {
    $this->logFailure(
      ' product ',
      $product_id,
      $facebook_product_id,
      $operation,
      $result);
  }

  private function logProductGroupSuccess(
    $product_id,
    $facebook_product_group_id,
    $operation) {
    $this->logSuccess(
      ' product group ',
      $product_id,
      $facebook_product_group_id,
      $operation);
  }

  private function logProductGroupFailure(
    $product_id,
    $facebook_product_group_id,
    $operation,
    $result) {
    $this->logFailure(
      ' product group ',
      $product_id,
      $facebook_product_group_id,
      $operation,
      $result);
  }

  private function logSuccess(
    $type,
    $product_id,
    $facebook_id,
    $operation) {
    $this->faeLog->write(
      'Success '
        . $operation
        . $type
        . $product_id
        . ' / '
        . $facebook_id
        . ' on Facebook');
  }

  private function logFailure(
    $type,
    $product_id,
    $facebook_id,
    $operation,
    $result) {
    $error_message = '';
    if (isset($result['error'])) {
      $error_message = is_array($result['error'])
        ? json_encode($result['error'])
        : $result['error'];
    }

    $error_message =
      'Failure '
        . $operation
        . $type
        . $product_id
        . ' / '
        . $facebook_id
        . ' on Facebook '
        . $error_message;
    $error_data = array(
      'operation' => $operation,
      'product_id' => $product_id,
      'type' => $type,
      'facebook_id' => $facebook_id);
    $this->logError($error_message, $error_data);
  }

  public function getSampleProductFeed() {
    return $this->load->controller(
      'facebook/facebookproductfeed/getSampleProductFeed');
  }

  public function clearAllFacebookProducts() {
    $this->faeLog->write('Clear all Facebook products');
    $this->model_facebook_facebookproduct->deleteAllFacebookProducts();
    $json = array('success' => 'true');
    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
    $this->faeLog->write('Complete - Clear all Facebook products');
  }

  public function syncAllProducts() {
    $this->faeLog->write('Sync all products');
    $products = $this->model_facebook_facebookproduct->getProducts();
    $successfully_sync = $this->syncProducts($products);
    $this->faeLog->write('Complete - Sync all products');
    return array(
      'total_count' =>  sizeof($products),
      'success_count' => $successfully_sync,
    );
  }

  public function syncProductForProductId($product_id) {
    $this->faeLog->write('Sync for product ' . $product_id);

    $operation = ', sync product';
    $error_data = array('operation' => 'Sync product');
    $this->validateFAEAndProductSync($operation, $error_data);

    $product = $this->model_facebook_facebookproduct->getProduct($product_id);
    $successfully_sync = $this->syncProducts(array($product));
    $this->faeLog->write('Complete - Sync for product ' . $product_id);
    return array(
      'total_count' => 1,
      'success_count' => $successfully_sync,
    );
  }

  private function syncProducts($products) {
    $successfully_sync = 0;
    $facebook_catalog_id = $this->getFacebookCatalogId();
    $facebook_page_token = $this->getFacebookPageAccessToken();
    if ($facebook_catalog_id && $facebook_page_token) {
      foreach ($products as $product) {
        // deletes away the product if the status is disabled
        // as we do not want to keep the product in the catalog
        if (!$product['status']) {
          $this->deleteProductsForProductId(array($product['product_id']));
          $successfully_sync = $successfully_sync + 1;
        } else {
          $product = $this->populateFacebookIdsForProductsSyncFromFeed(
            $facebook_catalog_id,
            $facebook_page_token,
            $product);
          if (!$product['facebook_product_id']) {
            if ($this->createProductInFacebook(
              $facebook_catalog_id,
              $product,
              $facebook_page_token)) {
              $successfully_sync = $successfully_sync + 1;
            }
          } else {
            if ($this->updateProductInFacebook(
              $facebook_catalog_id,
              $product,
              $facebook_page_token)) {
              $successfully_sync = $successfully_sync + 1;
            }
          }
        }
      }
    } else {
      $this->faeLog->write('No Facebook catalog Id or page access token');
    }
    return $successfully_sync;
  }

private function populateFacebookIdsForProductsSyncFromFeed(
    $facebook_catalog_id,
    $facebook_page_token,
    $product) {
    // when we do a product sync, we check for presence of fbid in local db
    // if we cannot find the fbid, that can mean 2 things
    // a. the product is an entirely new product
    // b. the product was uploaded from feed, so the fbid is not local db
    // if the case is b., we will want to save the fbid in local db
    // so that the product will be treated as an edit of existing product
    if (!$product['facebook_product_id']) {
      // performs a check on FB
      // to verify if the product is created from feed
      list($facebook_product_id, $facebook_product_group_id) =
        $this->getFacebookProductId(
          $facebook_catalog_id,
          $product['product_id'],
          $facebook_page_token);
      if ($facebook_product_id && $facebook_product_group_id) {
        // found the products on FB, this means that
        // these products are uploaded via feed
        // will save the facebook_product_id and product_group_ids
        // into the database
        $product['facebook_product_id'] = $facebook_product_id;
        $product['facebook_product_group_id'] = $facebook_product_group_id;
        $this->model_facebook_facebookproduct->addFacebookProduct(
          $product['product_id'],
          $product['facebook_product_id'],
          $product['facebook_product_group_id']);
      }
    }
    return $product;
  }

  private function getFacebookProductId(
    $facebook_catalog_id,
    $product_id,
    $facebook_page_token) {
    $result = $this->facebookgraphapi->getFacebookProductId(
      $facebook_catalog_id,
      $product_id,
      $facebook_page_token);
    if (isset($result['id'])) {
      return array(
        $result['id'],
        $result['product_group']['id']);
    } else {
      return null;
    }
  }

  private function createProductInFacebook(
    $facebook_catalog_id,
    $product,
    $facebook_page_token) {
    $facebook_product_group_id = $this->createProductGroupInFacebook(
      $facebook_catalog_id,
      $product,
      $facebook_page_token);
    if ($facebook_product_group_id) {
      $product['facebook_product_group_id'] = $facebook_product_group_id;

      $data = $this->facebookproductapiformatter->getProductData($product);
      $result = $this->facebookgraphapi->createProductItem(
        $facebook_catalog_id,
        $data,
        $facebook_page_token);
      if (isset($result['id'])) {
        $this->logProductSuccess(
          $product['product_id'],
          $result['id'],
          'create');
        $this->model_facebook_facebookproduct->addFacebookProduct(
          $product['product_id'],
          $result['id'],
          $product['facebook_product_group_id']);
        return true;
      } else {
        $this->logProductFailure(
          $product['product_id'],
          '',
          'create',
          $result);
        return false;
      }
    }
  }

  private function createProductGroupInFacebook(
    $facebook_catalog_id,
    $product,
    $facebook_page_token) {
    $group_data = $this->getProductGroupDataAsFacebookFormat($product);
    $result = $this->facebookgraphapi->createProductGroup(
      $facebook_catalog_id,
      $group_data,
      $facebook_page_token);
    if (isset($result['id'])) {
      $facebook_product_group_id = $result['id'];
      $this->logProductGroupSuccess(
        $product['product_id'],
        $result['id'],
        'create');
      return $facebook_product_group_id;
    }

    // checks if there is already an existing
    // product_group of the retailer_id on FB
    // this is indicated by error code 10800 and response contains the fbid
    if (isset($result['error']['code'])
      && $result['error']['code'] === 10800
      && isset($result['error']['error_data']['product_group_id'])) {
      $facebook_product_group_id =
        $result['error']['error_data']['product_group_id'];
      $this->logProductGroupSuccess(
        $product['product_id'],
        $result['error']['error_data']['product_group_id'],
        'retrieval');
      return $facebook_product_group_id;
    }

    $this->logProductGroupFailure(
      $product['product_id'],
      '',
      'create',
      $result);
    return '';
  }

  private function updateProductInFacebook(
    $facebook_catalog_id,
    $product,
    $facebook_page_token) {
    // checks if there is an existing product group id
    // if not, creates a new product group id and assigns to product
    list($facebook_product_id, $facebook_product_group_id) =
      $this->model_facebook_facebookproduct->
        getFacebookProductIdAndProductGroupId($product['product_id']);

    if (!$facebook_product_group_id) {
      $facebook_product_group_id =
        $this->createProductGroupInFacebook(
          $facebook_catalog_id,
          $product,
          $facebook_page_token);
      if ($facebook_product_group_id) {
        $product['facebook_product_group_id'] = $facebook_product_group_id;
        $this->model_facebook_facebookproduct->updateFacebookProduct(
          $product['product_id'],
          $product['facebook_product_id'],
          $product['facebook_product_group_id']);
      }
    }

    if ($facebook_product_group_id) {
      $product['facebook_product_group_id'] = $facebook_product_group_id;
      $data = $this->facebookproductapiformatter->getProductData($product);
      $result = $this->facebookgraphapi->updateProductItem(
        $product['facebook_product_id'],
        $data,
        $facebook_page_token);
      if (isset($result['success']) && $result['success']) {
        $this->logProductSuccess(
          $product['product_id'],
          $product['facebook_product_id'],
          'update');
        return true;
      } else {
        $this->logProductFailure(
          $product['product_id'],
          $product['facebook_product_id'],
          'update',
          $result);
        return false;
      }
    }
  }

  public function deleteProductsForProductId($product_ids) {
    $this->faeLog->write('Delete for products - ' .
      implode(',', $product_ids));

    $operation = ', sync product';
    $error_data = array('operation' => 'Sync product');
    $this->validateFAEAndProductSync($operation, $error_data);

    $successfully_deleted = 0;
    $facebook_catalog_id = $this->getFacebookCatalogId();
    $facebook_page_token = $this->getFacebookPageAccessToken();
    foreach ($product_ids as $product_id) {
      // performs a check on internal db to see if we can detect the
      // facebook product id and product group id
      list($facebook_product_id, $facebook_product_group_id) =
        $this->model_facebook_facebookproduct->
          getFacebookProductIdAndProductGroupId($product_id);

      // if we cant find the facebook product id and product group id
      // performs a check on FB
      // to verify if the product is created from feed
      if (!$facebook_product_id) {
        list($facebook_product_id, $facebook_product_group_id) =
          $this->getFacebookProductId(
            $facebook_catalog_id,
            $product_id,
            $facebook_page_token);
      }

      if ($facebook_product_id) {
        $this->model_facebook_facebookproduct->deleteFacebookProduct(
          $product_id);
        if ($this->deleteProductInFacebook(
          $product_id,
          $facebook_product_id,
          $facebook_product_group_id,
          $facebook_page_token)) {
          $successfully_deleted = $successfully_deleted + 1;
        }
      } else {
        $error = array('error' => 'Unable to retrieve facebook_product_id');
        $this->logProductFailure(
          $product_id,
          '',
          'delete',
          $error);
      }
    }

    $this->faeLog->write('Complete - Delete for products - ' .
      implode(',', $product_ids));
    return array(
      'total_count' => sizeof($product_ids),
      'success_count' => $successfully_deleted,
    );
  }

  private function deleteProductInFacebook(
    $product_id,
    $facebook_product_id,
    $facebook_product_group_id,
    $facebook_page_token) {
    $result = $this->facebookgraphapi->deleteProductItem(
      $facebook_product_id,
      $facebook_page_token);
    if (isset($result['success']) && $result['success']) {
      $this->logProductSuccess(
        $product_id,
        $facebook_product_id,
        'delete');
      $result = $this->facebookgraphapi->deleteProductGroup(
        $facebook_product_group_id,
        $facebook_page_token);
      if (isset($result['success']) && $result['success']) {
        $this->logProductGroupSuccess(
          $product_id,
          $facebook_product_group_id,
          'delete');
        return true;
      } else {
        $this->logProductGroupFailure(
          $product_id,
          $facebook_product_group_id,
          'delete',
          $result);
        return false;
      }
    } else {
      $this->logProductFailure(
        $product_id,
        $facebook_product_id,
        'delete',
        $result);
      return false;
    }
  }

  public function updateProductsForAvailabilityChange($product_ids) {
    $this->faeLog->write('Update products for availability change - ' .
      implode(',', $product_ids));
    $successfully_updated = 0;
    $facebook_catalog_id = $this->getFacebookCatalogId();
    $facebook_page_token = $this->getFacebookPageAccessToken();
    if ($facebook_page_token && $facebook_catalog_id) {
      $product_availabilities =
        $this->model_facebook_facebookproduct
          ->getFacebookProductAvailabiltyStatus($product_ids);
      foreach ($product_availabilities as $product_availability) {
        if ($this->updateProductForAvailabilityChangeInFacebook(
          $facebook_catalog_id,
          $product_availability,
          $facebook_page_token)) {
          $successfully_updated = $successfully_updated + 1;
        }
      }
    } else {
      $this->faeLog->write('No page access token');
    }
    $this->faeLog->write('Complete - ' .
      'Update products for availability change - ' .
      implode(',', $product_ids));
    return array(
      'total_count' => sizeof($product_ids),
      'success_count' => $successfully_updated,
    );
  }

  private function updateProductForAvailabilityChangeInFacebook(
    $facebook_catalog_id,
    $product_availability,
    $facebook_page_token) {
    $data = $this->getProductAvailabilityAsFacebookFormat(
      $product_availability);
    $result = $this->facebookgraphapi->updateProductItemUsingBase64ProductId(
      $facebook_catalog_id,
      $product_availability['product_id'],
      $data,
      $facebook_page_token);
    if (isset($result['success']) && $result['success']) {
      $this->logProductSuccess(
        $product_availability['product_id'],
        $product_availability['facebook_product_id'],
        'update availability');
      return true;
    } else {
      $this->logProductFailure(
        $product_availability['product_id'],
        $product_availability['facebook_product_id'],
        'update availability',
        $result);
      return false;
    }
  }

  private function getProductAvailabilityAsFacebookFormat(
    $product_availability) {
    return array(
      'availability' => $this->facebookproductapiformatter->getAvailability(
        $product_availability));
  }

  private function getProductGroupDataAsFacebookFormat($product) {
    $product_group_data = array(
      'retailer_id' => $product['product_id']
    );
    return $product_group_data;
  }
}
