
$(document).ready(function(){
		var pinnotfound="";var cookie=0;var show=0;var inst;
		$('.popupfixed .search-postcode').on('click',function(){
			$(".popupfixed .pmessage").html("");
			var pincode = $('input[name=\'pincode\']').val();
			if(pincode!=""){
				$('.pincode .error').html("");
				temp={'pincode':pincode};sendfdata(temp);
			}else{
				$('.pincode .error').html("Please enter postcode");
			}
		});

		$('.popuppostcode  .search-postcode').on('click',function(){
			$(".popuppostcode .pmessage").html("");
			devpmcookie("postcodepopup");
			var pincode=$('.popuppostcode input[name=\'pincode\']').val();
			if(pincode!=""){
				$('.popuppostcode .pincode .error').html("");
				temp={'pincode':pincode};sendfdatapopup(temp);
			}else{
				$('.popuppostcode .pincode .error').html("Please enter postcode");
			}
		});

		$('input[name=\'pincode\']').bind('keydown', function(e) {
		console.log(e);
		if (e.keyCode == 13) {
			$(".popupfixed .pmessage").html("");
			var pincode=$('input[name=\'pincode\']').val();
			if(pincode!=""){
				$('.pincode .error').html("");
				temp={'pincode':pincode};sendfdata(temp);
			}else{
				$('.pincode .error').html("Please enter postcode");
			}
		}
		});

		function sendfdata(content){
			var location="";
			$.ajax({
			url:'index.php?route=common/postcodepro/checkpin',
			type:'POST',
			dataType:'json',
			data:content,
			success:function(data){
						$(".popupfixed .pmessage").html(data.html).fadeIn();
						$("span.codcheck").html(data.codhtml);
				}
			});
		};

	
		$('.popupfixed input[name=\'pincode\']').on("keyup",function() {
		        $(".popupfixed .pmessage").html("").fadeOut();
		});

		$('.popuppostcode input[name=\'pincode\']').on("keyup",function() {
		        $(".popuppostcode .pmessage").html("").fadeOut();
		});

		

	
});
