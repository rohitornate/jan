
<form class="filter-option pull-left">
    <label>Filter By:</label>
                 <?php foreach ($filter_groups as $filter_group) { ?>
    <div class="box">
        <span class="title"><?php echo $filter_group['name']; ?></span>
        <ul>
                         <?php foreach ($filter_group['filter'] as $filter) { ?>
            <li><label>
                <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                    <input type="checkbox" name="filter[]" id='filter_<?php echo $filter['filter_id']; ?>' value="<?php echo $filter['filter_id']; ?>" checked="checked" />
            <?php echo $filter['name']; ?>
            <?php } else { ?>
                    <input type="checkbox" name="filter[]" id='filter_<?php echo $filter['filter_id']; ?>' value="<?php echo $filter['filter_id']; ?>" />
            <?php echo $filter['name']; ?>
            <?php } ?>

                </label></li>
                 <?php } ?>
        </ul>
    </div>
 <?php } ?>

     <div class="filter-result">
      <?php foreach ($filter_groups as $filter_group) { ?>
    
                         <?php foreach ($filter_group['filter'] as $filter) { ?>
                        
                <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                     <span class="restext">
            <?php echo $filter['name']; ?>
                <span onclick="filter_show('<?php echo $filter['filter_id']; ?>');">X</span>
                </span>
            <?php } ?>

            
                 <?php } ?>
        
 <?php } ?>
     </div>

</form>

<!--<div class="panel panel-default">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
  <div class="list-group">
    <?php foreach ($filter_groups as $filter_group) { ?>
    <a class="list-group-item"><?php echo $filter_group['name']; ?></a>
    <div class="list-group-item">
      <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
        <?php foreach ($filter_group['filter'] as $filter) { ?>
        <div class="checkbox">
          <label>
            <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
            <?php echo $filter['name']; ?>
            <?php } else { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
            <?php echo $filter['name']; ?>
            <?php } ?>
          </label>
        </div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
  </div>
  <div class="panel-footer text-right">
    <button type="button" id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
  </div>
</div>-->
    <script type="text/javascript">
    //$('input[name^=\'filter\']:checked').on('click', function () {
    $('input[name^=\'filter\']').change(function(){
            filter = [];

            $('input[name^=\'filter\']:checked').each(function (element) {
                filter.push(this.value);
            });
            
            location = '<?php echo $action; ?>&filter=' + filter.join(',');
        });
        
        function filter_show(id){
            $('#filter_'+id).attr('checked', false);
             filter = [];
            $('input[name^=\'filter\']:checked').each(function (element) {
                filter.push(this.value);
            });
            
            location = '<?php echo $action; ?>&filter=' + filter.join(',');
        }
    </script>
