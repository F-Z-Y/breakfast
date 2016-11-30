function logIn(){
	var username=$('#username').val();
	var password=$('#password').val();
	$.ajax({
		type:'post',
		url:'login.do',
		data:{'username':username,'password':password,'type':3},
		dataType:'json',
		success: function(obj) {
			if(obj){
				console.log(obj)
				if(obj.code==0){
					alert(obj.msg);
					window.location.href="index.do";
				}else{
					alert(obj.msg);
					window.location.href="index.do";
				}
			}
		}
	});
	
}
