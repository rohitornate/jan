<div id="archiveWrapper<?php echo $store['store_id']; ?>"> </div>
<?php $token = "";
		if(!empty ($_SESSION['token'])){
			$token = $_SESSION['token'];
		}
		
		if(!empty ($_GET['token'])){
			$token = $_GET['token'];
		}
		
?>
<script>
$(document).ready(function(){
	$.ajax({
		url: "index.php?route=extension/module/notifywhenavailable/getarchive&store_id=<?php echo $store['store_id']; ?>&token=<?php echo $token; ?>&page=1",
		type: 'get',
		dataType: 'html',
		success: function(data) {		
			$("#archiveWrapper<?php echo $store['store_id']; ?>").html(data);
		}
	});
});
</script>
