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
	
});