<?php
class ModelTltSlideshowTltSlideshow extends Model {
	public function getSlides($slideshow_id) {
		$slides = $this->cache->get('tltslideshow.' . (int)$this->config->get('config_language_id') . '.' . (int)$slideshow_id);
		
		if (!$slides) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltslide ts LEFT JOIN " . DB_PREFIX . "tltslide_description tsd ON (ts.slide_id = tsd.slide_id) LEFT JOIN " . DB_PREFIX . "tltslideshow tss ON (tss.slideshow_id = ts.slideshow_id)  WHERE tss.slideshow_id = '" . (int)$slideshow_id . "' AND tss.status = 1 AND ((ts.date_start = '0000-00-00' OR ts.date_start < NOW()) AND (ts.date_end = '0000-00-00' OR ts.date_end > NOW())) and tsd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ts.sort_order");

			$slides = $query->rows;

			$this->cache->set('tltslideshow.' . (int)$this->config->get('config_language_id') . '.' . (int)$slideshow_id, $slides);
		}

		return $slides;
	}
}