	$(function(){
	 $("#payOrder").click(function(data){
		var price=$(this).attr("price");
		console.log(price);
		var orderID=$('#orderID').html();
		$.ajax({
			type:'post',
			url:'orderPay.do',
			data:{'orderID':orderID,'price':price},
			dataType:'json',
			success:function(obj){
				if(obj.code==0){
					 Notify(obj.msg, 'top-right', '3000', 'success', 'fa-check');
                     setTimeout(function(){
							//location.reload();	
						},200);
					window.location.href="index.do";
				}else{
					 Notify(obj.msg, 'top-right', '3000', 'danger', 'fa-check');
                     setTimeout(function(){
						},200);
				}
			}
		});
		 
	 });
   
	});
	