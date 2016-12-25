$(function(){
	$('#login').click(function(){
		window.location.href="login.jsp";
	});
    $('#register').click(function(){
    	
    	var account=get_data($("#account"),false,true,'account-error');
    	var password=get_data($("#password"),false,true,'password-error');
    	var repassword=get_data($("#repassword"),false,true,'repassword-error');
    	if(account==""||password==""||repassword=="")return;
    	$.ajax({
    		type:'post',
    		url:'register.do',
    		data:$('#register-form').serialize(),
    		dataType:'json',
    		success:function(obj){
    			if(obj){
    				if(obj.code==0){
    					 Notify(obj.msg, 'top-right', '1000', 'success', 'fa-check');
                         setTimeout(function(){
    							//location.reload();	
    						},200);
    				}else{
    					 Notify(obj.msg, 'top-right', '1000', 'danger', 'fa-check');
                         setTimeout(function(){
    							//location.reload();	
    						},200);
    				}
    			}
    		}
    	});
    });
  
});
function get_data(obj,check,must,hint){
	console.log("====="+obj.val());
    var get_data = $.trim(obj.val());
    if(must){
        if(get_data!=''){
            $("#"+hint).hide();
        }else{
            post = false;
            $("#"+hint).show();
        }
    }
    if(get_data!=''&&check){
        var condition = new RegExp(check);
        if(!condition.test(get_data)){
            post = false;
            $("#"+hint).show();
        }else{
            $("#"+hint).hide();
        }
    }
    return get_data;
};
