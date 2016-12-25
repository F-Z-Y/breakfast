function logIn(){
	var username=get_data($("#username"),false,true,'name-error');
	var password=get_data($("#password"),false,true,'password-error');
	if(username==""||password=="")return;
	$.ajax({
		type:'post',
		url:'login.do',
		data:{'username':username,'password':password,'type':3},
		dataType:'json',
		success: function(obj) {
			if(obj){
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
		}
	});
	
}
/**
 * 获取数据并验证
 * @param obj
 * @param check
 * @param must 是否必须
 * @param hint 提示信息
 * @returns {string|*}
 */
function get_data(obj,check,must,hint){
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
