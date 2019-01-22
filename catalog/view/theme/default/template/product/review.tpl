<?php if ($reviews) { ?>
<div class="clearfix">
                            <div class="review">
                                <div class="review-result">
                                    <span><?php echo $reviews[0]['rating']; ?></span>
                                    Out Of 5

                                </div>
                                <div class="progress">
                                    <div class="in">
                                        <span>1 <i class="fa fa-star" aria-hidden="true"></i></span>
                                        <div class="bar"> <div class="bar-yellow"></div></div>
                                    </div>
                                    <div class="in">
                                        <span>2 <i class="fa fa-star" aria-hidden="true"></i></span>
                                        <div class="bar"> <div class="bar-yellow two"></div></div>
                                    </div>
                                    <div class="in">
                                        <span>3 <i class="fa fa-star" aria-hidden="true"></i></span>
                                        <div class="bar"> <div class="bar-yellow three"></div></div>
                                    </div>
                                    <div class="in">
                                        <span>4 <i class="fa fa-star" aria-hidden="true"></i></span>
                                        <div class="bar"> <div class="bar-yellow four"></div></div>
                                    </div>
                                    <div class="in">
                                        <span>5 <i class="fa fa-star" aria-hidden="true"></i></span>
                                        <div class="bar"> <div class="bar-yellow five"></div></div>
                                    </div>

                                </div>
                            </div>
                            <div class="review-write">
                                Have you purchased this item?
                                <a href="#inline_content" class="inline">WRITE A REVIEW</a>
                            </div>
                        </div>
						
						
					<!--	<div hidden="" class="review" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
        <meta itemprop="ratingValue" content="<?php echo $rating; ?>" />
        <meta itemprop="reviewCount" content="<?php echo preg_replace('/\D/', '', $reviews);?>" />
        <meta itemprop="bestRating" content="5" />
        <meta itemprop="worstRating" content="1" />
		
	
		 </div> -->
    
     
						
						
<?php foreach ($reviews as $review) { ?>
        <div class="comment">
            <span class="title"><?php echo $review['author']; ?></span>
            <p><?php echo $review['text']; ?></p>
            <span class="date-tag"> <i class="fa fa-check-circle" aria-hidden="true"></i> Certified Buyer <?php echo $review['date_added']; ?></span>
        </div>
<?php } ?>

<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="clearfix">
                            <div class="review">
                                <div class="review-result">
                                    <span>0</span>
                                    Out Of 5

                                </div>
                                <div class="progress">
                                    <div class="in">
                                        <span>1 <i class="fa fa-star" aria-hidden="true"></i></span>
                                        <div class="bar"> <div class=""></div></div>
                                    </div>
                                    <div class="in">
                                        <span>2 <i class="fa fa-star" aria-hidden="true"></i></span>
                                        <div class="bar"> <div class=" "></div></div>
                                    </div>
                                    <div class="in">
                                        <span>3 <i class="fa fa-star" aria-hidden="true"></i></span>
                                        <div class="bar"> <div class=" "></div></div>
                                    </div>
                                    <div class="in">
                                        <span>4 <i class="fa fa-star" aria-hidden="true"></i></span>
                                        <div class="bar"> <div class=" "></div></div>
                                    </div>
                                    <div class="in">
                                        <span>5 <i class="fa fa-star" aria-hidden="true"></i></span>
                                        <div class="bar"> <div class=" "></div></div>
                                    </div>

                                </div>
                            </div>
                            <div class="review-write">
                                Have you purchased this item?
                                <a href="#inline_content" class="inline">WRITE A REVIEW</a>
                            </div>
                        </div>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
