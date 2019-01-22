<script src="view/javascript/facebook/dia.js" type="text/javascript"></script>
<link href="view/stylesheet/facebook/dia.css" type="text/css" rel="stylesheet" />
<script>
  var fb_url = 'www.facebook.com';
  var debug = <?= ($debug_url) ? 1 : 0 ?>;
  if (debug) {
    fb_url = '<?= ($debug_url) ?>'
  }

  window.facebookAdsToolboxConfig = {
    hasGzipSupport: '<?= extension_loaded('zlib') ? 'true' : 'false' ?>',
    popupOrigin: 'https://' + fb_url,
    feedWasDisabled: 'true',
    platform: 'OpenCart',
    pixel: {
      pixelId: '<?= $facebook_pixel_id; ?>',
      advanced_matching_supported: true
    },
    diaSettingId: '<?= $facebook_dia_setting_id; ?>',
    store: {
      baseUrl: window.location.protocol + '//' + window.location.host,
      baseCurrency: '<?= $base_currency; ?>',
      canSetupShop: true,
      timezoneId: '<?= date('Z'); ?>',
      storeName: '<?= $store_name; ?>',
      version: '<?= $opencart_version; ?>',
      php_version: '<?= phpversion(); ?>',
      plugin_version: '<?= $plugin_version; ?>'
    },
    feed: {
      totalVisibleProducts: <?= $total_visible_products; ?>
    },
    feedPrepared: {
      feedUrl: '',
      feedPingUrl: '',
      samples: <?= $sample_feed; ?>
    },
  };

  window.initial_product_sync = <?= $initial_product_sync; ?>;

  var token = '<?= $token; ?>';
</script>

<?= $header; ?><?= $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?= $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?= $breadcrumb['href']; ?>"><?= $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <?php if ($download_log_file_error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?= $download_log_file_error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
  <?php } ?>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-body">
        <div id="facebook-header">
          <table><tbody>
            <tr><td><i class='logo'></i></td>
            <td><span class='title'><?= $heading_title; ?></span></td></tr>
          </tbody></table>
        </div>
        <div class="dia-flow-container">
          <h1><?= $sub_heading_title; ?></h1>
          <h2><?= $body_text; ?></h2>
          <h2 id="h2DiaSettingId">
          </h2>
          <div>
            <button
              type="button"
              class="blue"
              onClick="_facebookAdsExtension.dia.launchDiaWizard()"
              id="btnLaunchDiaWizard">
            </button>
          </div>
          <div id="divProductSyncStatus" class="product-sync-status">
            <div class="product-sync-status">
              <img
                src="view/images/facebook/loadingicon.gif"
                width="20"
                height="20"/>
            </div>
            <div
              id="divProductSyncStatusText"
              class="product-sync-status-dotted-underline">
            </div>
            <div class="product-sync-status-tooltiptext">
              The product sync status check will be performed every 30 secs.
            </div>
          </div>
          <div
            class="error-text"
            id="divErrorText">
          </div>
          <div>
            <button
              type="button"
              class="blue"
              onClick="_facebookAdsExtension.dia.resyncAllProducts(
                '<?= $resync_confirm_text; ?>')"
              id="btnResyncProducts">
              <?= $resync_text ?>
            </button>
          </div>
          <div class="download">
            <a class="download" href="<?= $download_log_link ?>">
              <?= $download_log_file_text ?>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  $(function () {
    _facebookAdsExtension.dia.refreshUIForDiaSettings();
  });
</script>
<?= $footer; ?>