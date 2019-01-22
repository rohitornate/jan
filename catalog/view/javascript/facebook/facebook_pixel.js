; (function(facebookAdsExtension, window, document, undefined) {  
  var facebookPixel =
    facebookAdsExtension.facebookPixel =
    facebookAdsExtension.facebookPixel || (function () {
    var init = function(facebook_pixel_id, pii, params) {
      fbq('init', facebook_pixel_id, pii, params);
      fbq('track', 'PageView');
    };

    var firePixel = function(facebook_pixel_event_params) {
      event_name = facebook_pixel_event_params.event_name;
      delete facebook_pixel_event_params.event_name;
      track_param =
        facebook_pixel_event_params.is_custom_event ? 'trackCustom' : 'track';
      delete facebook_pixel_event_params.is_custom_event;
      fbq(track_param, event_name, facebook_pixel_event_params);
    };

    return {
      init: init,
      firePixel: firePixel
    };    
  }());
}(window._facebookAdsExtension = window._facebookAdsExtension || {}, window, document));

