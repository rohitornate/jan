<div style="overflow:hidden;">
    <?php if (count($products)>0) { ?>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages:["corechart"]});
            function drawChart() {
                var data = google.visualization.arrayToDataTable([['Product', 'Waiting List', 'Archive', { role: 'annotation' } ],
                <?php   foreach($products as $pid => $notified) {
                            $productInfo = $product_info->getProduct($pid);  
                            if(!empty($productInfo)) { 
                                echo "['".htmlspecialchars_decode($productInfo['name'], ENT_QUOTES)."', ".(isset($notified[0]) ? $notified[0] : '0').", ".(isset($notified[1]) ? $notified[1] : '0').", ''],"; 
                            } 
                        } 
                ?>]);
                var options = { title: 'Products Performance', isStacked: true, legend: { position: 'top', maxLines: 3 }, height: 400 };
                var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>        
        <div id='chart_div'></div>
        <?php if(!empty($most_wanted_products_ofs)) { ?>
        <h3><?php echo $text_most_wanted_ofs ?></h3>
        <table class="table table-bordered table-hover" width="100%">
            <thead>
                <tr class="table-header">
                    <th>#</th>
                    <th><?php echo $text_product; ?></th>
                    <td><?php echo $text_count; ?></td>
                </tr>
            </thead>
            <tbody>
                <?php $i = 1 ?>
                <?php foreach($most_wanted_products_ofs as $product) { ?> 
                <tr>
                    <td><?php echo $i ?></td>
                    <td><?php echo $product['name'] ?></td>
                    <td><?php echo $product['cust_count'] ?></td>
                </tr>
                <?php $i++ ?>
                <?php } ?>
            </tbody>
        </table>
        <?php } ?>

        <?php if(!empty($most_wanted_products_all_time)) { ?>
        <h3><?php echo $text_most_wanted_all_time ?></h3>
        <table class="table table-bordered table-hover" width="100%">
            <thead>
                <tr class="table-header">
                    <th>#</th>
                    <th><?php echo $text_product; ?></th>
                    <td><?php echo $text_count; ?></td>
                </tr>
            </thead>
            <tbody>
                <?php $i = 1 ?>
                <?php foreach($most_wanted_products_all_time as $product) { ?> 
                <tr>
                    <td><?php echo $i ?></td>
                    <td><?php echo $product['name'] ?></td>
                    <td><?php echo $product['cust_count'] ?></td>
                </tr>
                <?php $i++ ?>
                <?php } ?>
            </tbody>
        </table>
        <?php } ?>
    <?php } else { echo "<center>There is no data yet for a chart.</center>"; } ?>
</div> 