	<!-- COURIER STATUS REPORT-->
			<div class="col-md-8" style="width: 334px;">

              <!-- Widget -->
              <div class="widget">
                <!-- Widget head -->
                <div class="widget-head">
                  <div class="pull-left">Status</div> 
                  <div class="clearfix"></div>
                </div>              

                <!-- Widget content -->
                <div class="widget-content">
                  <div class="padd">

                    <!-- Curve chart (Blue color). jQuery Flot plugin used. -->
                    <!-- <div id="curve-chart"></div> -->
                    <div id="result-data">
<?php 
              if(isset($courier_status)) {

                 foreach($courier_status as $key=>$value) {
                     $courier_scan_status[$value->current_status] = $value->total;
                 }
             }

?>
                          <a href="<?php echo site_url('courierstatus/courierstatus/status/all'); ?>" id="status" value="all"> 
                            <i class="icon-list-alt statusfont "></i>
                             <strong> All </strong> : 
                             <strong>
                               <?php echo array_sum($courier_scan_status); ?>
                                  </a>
                            </strong>
                          </a>

                          <br><hr />
						  <a href="<?php echo site_url('courierstatus/courierstatus/status/intransit'); ?>" id="status" value="intransit"> 
                            <i class="icon-truck statusfont "></i>
                             <strong> In Transit </strong> : 
                             <strong>
                               <?php if(isset($courier_scan_status) && isset($courier_scan_status['INT'])) { 
                                         echo $courier_scan_status['INT'];
                                    }else { 
                                         echo '0';
                                    }?>
                                  </a>
                            </strong>
                          </a>

                          <br><hr />

                        <a href="<?php echo site_url('courierstatus/courierstatus/status/delivered'); ?>" id="status" value="delivered">
                          <i class="icon-check statusfont "></i>
                          <strong> Delivered</strong> : 
                          <strong>
                              <?php if(isset($courier_scan_status) && isset($courier_scan_status['DEL'])){ 
                                          echo $courier_scan_status['DEL'];
                                    }else { 
                                        echo '0';
                                    }?>
                         </strong>
                        </a>

                          <br><hr />

                        <a href="<?php echo site_url('courierstatus/courierstatus/status/onhold'); ?>" id="status" value="onhold">
                          <i class="icon-pause statusfont "></i>
                          <strong> On Hold</strong> : 
                          <strong>
                                <?php if(isset($courier_scan_status) && isset($courier_scan_status['ONH'])){ 
                                           echo $courier_scan_status['ONH'];
                                      }else { 
                                           echo '0';
                                      }?>
                          </strong>
                        </a>

                          <br><hr />

                        <a href="<?php echo site_url('courierstatus/courierstatus/status/outofdelivery'); ?>" id="status" value="outofdelivery">  
                               <i class="icon-signout statusfont "></i>
                               <strong> Out For Delivery</strong> : 
                               <strong>
                               <?php if(isset($courier_scan_status) && isset($courier_scan_status['OOD'])){
                                         echo $courier_scan_status['OOD'];
                                     }else { 
                                         echo '0';
                                     }?>
                              </strong>
                        </a>

                          <br><hr />

                           <a href="<?php echo site_url('courierstatus/courierstatus/status/networkissue'); ?>" id="status" value="networkissue">  
                               <i class="icon-signal statusfont "></i>
                               <strong> Network Issue</strong> : 
                               <strong>
                                   <?php if(isset($courier_scan_status) && isset($courier_scan_status['NWI'])){ 
                                             echo $courier_scan_status['NWI'];
                                         }else { 
                                             echo '0';
                                         }?>
                               </strong>
                           </a>
                    
                          <br><hr />
                         
                           <a href="<?php echo site_url('courierstatus/courierstatus/status/rto'); ?>" id="status" value="rto">  
                              <i class="icon-retweet statusfont "></i>
                              <strong> RTO</strong> : 
                              <strong>
                                 <?php if(isset($courier_scan_status) && isset($courier_scan_status['RTO'])){ 
                                          echo $courier_scan_status['RTO'];
                                       }else { 
                                             echo '0';
                                       }?>
                             </strong>
                          </a>
                                      
                          <br><hr />

                         <a href="<?php echo site_url('courierstatus/courierstatus/status/rtd'); ?>" id="status" value="rtd">  
                              <i class="icon-check statusfont "></i>
                             <strong> RTO Delivered</strong> : 
                             <strong>
                                     <?php if(isset($courier_scan_status) && isset($courier_scan_status['RTD'])){ 
                                             echo $courier_scan_status['RTD'];
                                           }else { 
                                             echo '0';
                                           }?>
                            </strong>
                         </a>

                          <br><hr />


                          <a href="<?php echo site_url('courierstatus/courierstatus/status/manifested'); ?>" id="status" value="manifested">
                            <i class="icon-cogs statusfont "></i>
                            <strong>Manifested</strong> : 
                            <strong>
                                    <?php if(isset($courier_scan_status) && isset($courier_scan_status['SCH'])){ 
                                            echo $courier_scan_status['SCH'];
                                          }else { 
                                            echo '0';
                                          }?>
                           </strong>
                         </a>

                          <br><hr />
                       
                          <a href="<?php echo site_url('courierstatus/courierstatus/status/undelivered'); ?>" id="status" value="undelivered">
                            <i class="icon-stop statusfont "></i>
                            <strong> Undelivered</strong> : 
                            <strong>
                                 <?php if(isset($courier_scan_status) && isset($courier_scan_status['UND'])){ 
                                             echo $courier_scan_status['UND'];
                                       }else { 
                                             echo '0';
                                       }?>
                             </strong>
                          </a>

                          <br><hr />

                          <a href="<?php echo site_url('courierstatus/courierstatus/status/pickuped'); ?>" id="status" value="pickuped">
                            <i class="icon-suitcase statusfont "></i> 
                            <strong> Picked up</strong> : 
                            <strong>
                                <?php if(isset($courier_scan_status) && isset($courier_scan_status['PKP'])){ 
                                        echo $courier_scan_status['PKP'];
                                      }else { 
                                       echo '0';
                                      }?>
                           </strong>
                          </a>
							<br><hr />
							
							<a href="<?php echo site_url('courierstatus/courierstatus/status/not_found'); ?>" id="status" value="not_found">
                            <i class="icon-warning-sign statusfont "></i> 
                            <strong> Not Found</strong> : 
                            <strong>
                                <?php if(isset($courier_scan_status) && isset($courier_scan_status['NFI'])){ 
                                        echo $courier_scan_status['NFI'];
                                      }else { 
                                       echo '0';
                                      }?>
                           </strong>
                          </a>

                    </div>
          
                    <!-- Hover location -->
                             

                    <!-- Skil this line. <div class="uni"><input id="enableTooltip" type="checkbox">Enable tooltip</div> -->

                  </div>
                </div>
                <!-- Widget ends -->

              </div>
            </div>
			<!-- COURIER STATUS REPORT-->