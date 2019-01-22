<?php
class ModelToolImage extends Model {
	public function resize($filename, $width, $height) {

               if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
                    $server = HTTPS_SERVER;
                } else {
                    $server = HTTP_SERVER;
                }

                if ($filename) {
                    $image_info = @getimagesize(DIR_IMAGE . $filename);
                    if (!$image_info) {
                        return $server . 'image/' . $filename;
                    }
                } else {
                    $filename = "no_image.png";
                }
                
		if (!is_file(DIR_IMAGE . $filename) || substr(str_replace('\\', '/', realpath(DIR_IMAGE . $filename)), 0, strlen(DIR_IMAGE)) != DIR_IMAGE) {
			return;
		}

		$extension = pathinfo($filename, PATHINFO_EXTENSION);
//$extension='webp';
		$image_old = $filename;
		$image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . (int)$width . 'x' . (int)$height . '.' . $extension;

		if (!is_file(DIR_IMAGE . $image_new) || (filectime(DIR_IMAGE . $image_old) > filectime(DIR_IMAGE . $image_new))) {
			list($width_orig, $height_orig, $image_type) = getimagesize(DIR_IMAGE . $image_old);
				 
			if (!in_array($image_type, array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF))) { 
				return DIR_IMAGE . $image_old;
			}
						
			$path = '';

			$directories = explode('/', dirname($image_new));

			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;

				if (!is_dir(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}
			}

			if ($width_orig != $width || $height_orig != $height) {
				$image = new Image(DIR_IMAGE . $image_old);
				$image->resize($width, $height);
				$image->save(DIR_IMAGE . $image_new);
			} else {
				copy(DIR_IMAGE . $image_old, DIR_IMAGE . $image_new);
			}
		}
		
		$image_new = str_replace(' ', '%20', $image_new);  // fix bug when attach image on email (gmail.com). it is automatic changing space " " to +
		
		/*if ($this->request->server['HTTPS']) {
			return $this->config->get('config_ssl') . 'image/' . $image_new;
			//return $this->config->get('config_ssl') . 'image/' . $new_image;
			//return HTTPS_IMAGE . $new_image;
			//return HTTPS_IMAGE . $new_image . '" width="' . $width . '" height="' . $height;
		} else {
			return $this->config->get('config_url') . 'image/' . $image_new;
			//return HTTP_IMAGE . $new_image . '" width="' . $width . '" height="' . $height;
		}*/
	if (isset($this->request->get['route'])) {	
		if($this->request->get['route']=='extension/feed/sitemap_pro'){
			
			if ($this->request->server['HTTPS']) {
				return $this->config->get('config_ssl') . 'image/' . $image_new;
				//return $this->config->get('config_ssl') . 'image/' . $new_image;
				//return HTTPS_IMAGE . $new_image;
				//return HTTPS_IMAGE . $new_image . '" width="' . $width . '" height="' . $height;
			} else {
				return $this->config->get('config_url') . 'image/' . $image_new;
				//return HTTP_IMAGE . $new_image . '" width="' . $width . '" height="' . $height;
			}	
			
			
		}else{	
			
		
		
		if(CDN_HTTPS_SERVER !=""){
				return CDN_HTTPS_SERVER . 'image/' . $image_new;
					}else{
				if ($this->request->server['HTTPS']) {
					return $this->config->get('config_ssl') . 'image/' . $image_new;
					} else {
					return $this->config->get('config_url') . 'image/' . $image_new;
				}
			}

		}
		
	}else{
		
		if(CDN_HTTPS_SERVER !=""){
				return CDN_HTTPS_SERVER . 'image/' . $image_new;
					}else{
				if ($this->request->server['HTTPS']) {
					return $this->config->get('config_ssl') . 'image/' . $image_new;
					} else {
					return $this->config->get('config_url') . 'image/' . $image_new;
				}
			}

		}
		
	}
}
