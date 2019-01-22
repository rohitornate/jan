<style>

.pb-disclaimer
{
	margin-top:21px;
}

.ribbon-box{margin-top:56;}

#xcart .media {
    padding: 23px 0 19px;
    margin: 0;
}



.media-body, .media-left, .media-right {
    display: table-cell;
    vertical-align: top;
}

.media-body p
{	
	color:#5d5d5d;
	font-size: 15px;
    line-height:42px;

}



.media-left img
{
display: block;
    margin-left: auto;
    margin-right: auto 
}

</style>



<div class="panel panel-green1 totalspanel">              
<!--<div class="panel-heading"><i class="fa fa-money" aria-hidden="true"></i>&nbsp;<?php echo $text_totals;?> - <?php echo $final_price; ?></div>-->
<div id="xtotals-content">        
<table class="table" style="border-bottom: 1px solid #e2dfdf;">
<tbody>
<?php foreach ($totals as $total) { ?>
<tr><td><?php echo $total['title']; ?>:</td><td class="text-right"><?php echo $total['text']; ?></td></tr>
<?php } ?>            
</tbody>            
</table>
</div>
</div>


<!--<div class="pb-disclaimer">
    <div class="ribbon-box style="ribbon-box: margin-top:56;">
        <div class="col-sm-6 col-xs-6" style="">
            <div class="pb-block-compress">
                <div class="media-left">
                    <a href="#">
                        <img src="images/secure_shop.png" alt="" class="center-block">
                    </a>
                </div>
				<div class="media-body">
					<p> Secure Shopping </p>
				</div>
            </div>
		</div>
    <div class="col-sm-6 col-xs-6" style="">
        <div class="pb-block-compress">
            <div class="media-left">
                <a href="#">
                    <img src="images/easy_return.png" alt="" class="center-block">
                </a>
            </div>
          <div class="media-body">
                <p> Easy Returns</p>
            </div>
        </div>
    </div>
 </div>-->
 
 <div class="pb-disclaimer">
    <div class="ribbon-box">
        <div class="col-sm-12 col-xs-12">
            <div class="pb-block-compress">
                <div class="media-left">
                    <a href="#">
                        <img src="images/securepament.png" alt="" class="center-block">
                    </a>
                </div>
				<div class="media-body">
					<p> Secure Shopping </p>
				</div>
            </div>
		</div>
        <div class="col-sm-12 col-xs-12">
            <div class="pb-block-compress">
                <div class="media-left">
                    <a href="#">
                        <img src="images/easyreturn.png" alt="" class="center-block">
                    </a>
                </div>
				<div class="media-body">
					<p> Easy Returns</p>
				</div>
            </div>
        </div>
    </div>
 </div>

