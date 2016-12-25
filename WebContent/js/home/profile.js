$(function(){
	$("#recharge").click(function(){
		$('#myModal').modal('show');
	});
	$('#close').click(function(){
		$('#myModal').modal('hide');
	});
	$("#submit").click(function(){
		var name=$.trim($('#name').val());
        var price=$.trim($('#price').val());
        if(price!=0){
        	$.ajax({
    			type:'post',
    			url:'recharge.do',
    			data:{'name':name,'price':price},
    			dataType:'json',
    			success:function(obj){
    				if(obj.code==0){
    					 Notify(obj.msg, 'top-right', '3000', 'success', 'fa-check');
                         setTimeout(function(){
    							//location.reload();	
    						},200);
                     	$('#myModal').modal('hide');
    				}else{
    					 Notify(obj.msg, 'top-right', '3000', 'danger', 'fa-check');
                         setTimeout(function(){
    						},200);
    				}
    			}
    		});
        }
	});
	  $(".pay").click(function(){
		  var num= $(this).attr("num");
		  var price= $(this).attr("price");
		  $.ajax({
  			type:'post',
  			url:'orderPay.do',
  			data:{'orderID':num,'price':price},
  			dataType:'json',
  			success:function(obj){
  				if(obj.code==0){
  					 Notify(obj.msg, 'top-right', '3000', 'success', 'fa-check');
                       setTimeout(function(){
  							//location.reload();	
  						},200);
                       window.location.href="profile.do";
  				}else{
  					 Notify(obj.msg, 'top-right', '3000', 'danger', 'fa-check');
                       setTimeout(function(){
  						},200);
  				}
  			}
  		 });
	     });
	  
	  
	  $(".drawback").click(function(){
		  var num= $(this).attr("num");
		  var price=$(this).attr("price");
		   $.ajax({
	  			type:'post',
	  			url:'drawbackInfo.do',
	  			data:{'orderID':num,'price':price},
	  			dataType:'json',
	  			success:function(obj){
	  				if(obj.code==0){
	  					 Notify(obj.msg, 'top-right', '3000', 'success', 'fa-check');
	                       setTimeout(function(){
	  							//location.reload();	
	  						},200);
	                       window.location.href="profile.do";
	  				}else{
	  					 Notify(obj.msg, 'top-right', '3000', 'danger', 'fa-check');
	                       setTimeout(function(){
	  						},200);
	  				}
	  			}
	  		 });
	     });
	  $(".drawbackOK").click(function(){
		  var num= $(this).attr("num");
		  var price=$(this).attr("price");
		  var type=1;
		   $.ajax({
	  			type:'post',
	  			url:'drawbackInfo.do',
	  			data:{'orderID':num,'price':price,'type':type},
	  			dataType:'json',
	  			success:function(obj){
	  				if(obj.code==0){
	  					 Notify(obj.msg, 'top-right', '3000', 'success', 'fa-check');
	                       setTimeout(function(){
	  							//location.reload();	
	  						},200);
	                       window.location.href="profile.do";
	  				}else{
	  					 Notify(obj.msg, 'top-right', '3000', 'danger', 'fa-check');
	                       setTimeout(function(){
	  						},200);
	  				}
	  			}
	  		 });
	     });
	  $(".ok").click(function(){
		  var num= $(this).attr("num");
		  var type=2;
		   $.ajax({
	  			type:'post',
	  			url:'drawbackInfo.do',
	  			data:{'orderID':num,'type':type},
	  			dataType:'json',
	  			success:function(obj){
	  				if(obj.code==0){
	  					 Notify(obj.msg, 'top-right', '3000', 'success', 'fa-check');
	                       setTimeout(function(){
	  							//location.reload();	
	  						},200);
	                       window.location.href="profile.do";
	  				}else{
	  					 Notify(obj.msg, 'top-right', '3000', 'danger', 'fa-check');
	                       setTimeout(function(){
	  						},200);
	  				}
	  			}
	  		 });
	     });
});