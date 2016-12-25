<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<!--Head-->
<head>
    <meta charset="utf-8" />
    <title>登录</title>

    <meta name="description" content="login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" rel="stylesheet" />
   
    <!--Beyond styles-->
    <link id="beyond-link" href="<%=request.getContextPath()%>/assets/css/beyond.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/assets/css/animate.min.css" rel="stylesheet" />
    <style type="text/css">
		.error{color:#f45551;display: none;line-height: 34px;margin-bottom: 0px;}
		body{    background: url(<%=request.getContextPath()%>/img/wallpaper.jpg);
		  }
    </style>
</head>
<!--Head Ends-->
<!--Body-->
<body>
    <div class="login-container animated fadeInDown">
        <div class="loginbox bg-white">
            <div class="loginbox-title"> 早餐订购系统</div>
            <div class="loginbox-textbox">
            </div>
            <div class="loginbox-textbox">
                <input id="username" type="text" class="form-control" placeholder="用户名" />
                 <label id="name-error" class="error" for="name" >用户名不能为空</label>
            </div>
           
            <div class="loginbox-textbox">
                <input id="password" type="password" class="form-control" placeholder="密码" />
                  <label id="password-error" class="error" for="password" >密码不能为空</label>
            </div>
            <div class="loginbox-forgot">
                <a href="">忘记密码?</a>
            </div>
            <div class="loginbox-submit">
                <input type="button" class="btn btn-primary btn-block" name="submit" value="登录" onclick="logIn()">
            </div>
            <div class="loginbox-signup">
                <a href="register.jsp">注册</a>
            </div>
        </div>
       
    </div>
    
    <!--Basic Scripts-->
    <script src="<%=request.getContextPath()%>/assets/js/jquery-2.0.3.min.js"></script>
    <!--Basic Scripts-->
	<script
		src="<%=request.getContextPath()%>/assets/js/jquery-2.0.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>

	<!--Beyond Scripts-->
	<script src="<%=request.getContextPath()%>/assets/js/beyond.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/toastr/toastr.js"></script>

	
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/home/login.js"></script>
</body>
<!--Body Ends-->
</html>
