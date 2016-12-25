<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>注册页面</title>
    <meta name="description" content="register page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--Beyond styles-->
    <link id="beyond-link" href="<%=request.getContextPath()%>/assets/css/beyond.min.css" rel="stylesheet" />
    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="<%=request.getContextPath()%>/assets/js/skins.min.js"></script>
    <style type="text/css">
		.error{color:#f45551;display: none;line-height: 34px;margin-bottom: 0px;}
    </style>
</head>
<!--Head Ends-->
<!--Body-->
<body>
    <div class="register-container animated fadeInDown">
        <div class="registerbox bg-white">
            <div class="registerbox-title">注册</div>
            <div class="registerbox-caption ">请填写你的信息</div>
            <form id="register-form">
            <div class="registerbox-textbox">
                <input id="account" name="account" type="text" class="form-control" placeholder="用户名 " />
                <label id="account-error" class="error" for="account" >用户名不能为空</label>
            </div>
            <div class="registerbox-textbox">
                <input id="password" name="password" type="password" class="form-control" placeholder="密码" />
                 <label id="password-error" class="error" for="password" >密码不能为空</label>
            </div>
            <div class="registerbox-textbox">
                <input  id="repassword" name="repassword" type="password" class="form-control" placeholder="确认密码" />
                 <label id="repassword-error" class="error" for="repassword" >确认密码不能为空</label>
            </div>
            <hr class="wide" />
            <div class="registerbox-textbox">
                <input name="username" type="text" class="form-control" placeholder="昵称" />
            </div>
            <div class="registerbox-textbox">
                <input name="name" type="text" class="form-control" placeholder="姓名" />
            </div>
            <div class="registerbox-textbox">
                <input name="phone" type="number" class="form-control" placeholder="手机号" />
            </div>
            <div class="registerbox-textbox">
                <input name="address" type="text" class="form-control" placeholder="地址" />
            </div>
           </form>
            <div class="registerbox-textbox">
               <input id="login" type="button" class="btn btn-primary pull-left" value="登录">
                <input id="register" type="button" class="btn btn-primary pull-right" value="注册">
            </div>
        </div>
        
    </div>

    <!--Basic Scripts-->
    <script src="<%=request.getContextPath() %>/assets/js/jquery-2.0.3.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/beyond.min.js"></script>
     <script src="<%=request.getContextPath()%>/assets/js/toastr/toastr.js"></script>
   <script src="<%=request.getContextPath() %>/js/home/register.js"></script>
    
</body>
<!--Body Ends-->
</html>
