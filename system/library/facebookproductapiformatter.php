<?php
class FacebookProductAPIFormatter extends FacebookProductFormatter {
  public function getFormattedPrice($value) {
    // returns the price as cents
    $decimal_place = ($this->params->hasCents()) ? 2 : 0;
    return intval(round(floatval($value), $decimal_place) * 100);
  }

  protected function formatAdditionalImageUrls($product_image_urls) {
    // returns the additional image urls as a list in string format
   if ($product_image_urls) {
      return "['" . implode("','", $product_image_urls) . "']";
    } else {
      return "[]";
    }
  }

  protected function postFormatting($product_data) {
    // no further post formatting
    return $product_data;
  }
}
