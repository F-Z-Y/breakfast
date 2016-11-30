<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!-- Head -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard</title>
    <meta name="description" content="Dashboard" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon">

    <link href="<%=request.getContextPath()%>/css/home/home.css"   rel="stylesheet" />
    <!--Basic Styles-->
<link href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link id="bootstrap-rtl-link" href="" rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/assets/css/weather-icons.min.css"
	rel="stylesheet" />
<!--Beyond styles-->
<link href="<%=request.getContextPath()%>/assets/css/beyond.min.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/css/demo.min.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/css/typicons.min.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/css/animate.min.css"
	rel="stylesheet" />
<link id="skin-link" href="" rel="stylesheet" type="text/css" />

<!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
<script src="<%=request.getContextPath()%>/assets/js/skins.min.js"></script>
<link href="<%=request.getContextPath()%>/assets/css/skins/teal.min.css"
	 rel="stylesheet">
    <rapid:block name="css">  
    </rapid:block>  
</head>
<!-- /Head -->
<!-- Body -->

<body>
<% int userId=(Integer)(session.getAttribute("userId")); %>
    <!-- Loading Container -->
    <div class="loading-container">
        <div class="loading-progress">
            <div class="rotator">
                <div class="rotator">
                    <div class="rotator colored">
                        <div class="rotator">
                            <div class="rotator colored">
                                <div class="rotator colored"></div>
                                <div class="rotator"></div>
                            </div>
                            <div class="rotator colored"></div>
                        </div>
                        <div class="rotator"></div>
                    </div>
                    <div class="rotator"></div>
                </div>
                <div class="rotator"></div>
            </div>
            <div class="rotator"></div>
        </div>
    </div>
    <!--  /Loading Container -->
    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="navbar-container">
                <!-- Navbar Barnd -->
                <div class="navbar-header pull-left">
                    <a href="#" class="navbar-brand">
                        <small>
                            <img src="<%=request.getContextPath()%>/assets/img/logo.png" alt="" />
                        </small>
                    </a>
                   
                </div>
                <!-- /Navbar Barnd -->
                
                <div class="navbar-header pull-center">
                 <ul class="nav">
                    <li><a href="index.do">首页</a></li>
                    <li><a  href="product.jsp">商品</a></li>
                    <li><a href="shop.jsp">商家</a></li>
                    <li><a href="profile.do">个人中心</a></li>
                  </ul>
                </div>
                <!-- Account Area and Settings --->
                <div class="navbar-header pull-right">
                    <div class="navbar-account">
                        <ul class="account-area">
                            <li>
                            <% if(request.getSession().getAttribute("userId")==null){ %>
                              <h4><span class="profile"><a href="login.jsp">登录</a></span></h4>
                              <% }else{%>
                            	  <h4><span class="profile"><a href="profile.jsp"><%=session.getAttribute("account") %></a></span></h4>  
                              <%}%>
                            </li>
                            <!-- /Account Area -->
                            <li>
                                   <h3 class="head-line">|</h3>
                             </li>
                             <li>
                               <%if(request.getSession().getAttribute("userId")==null){ %>
                                <h4><span class="profile"><a href="login.jsp">注册</a></span></h4>
                              <%}else{ %>
                                <h4><span class="profile"><a href="login.jsp">注销</a></span></h4>
                              <%} %>
                            </li>
                        </ul>
                        
                        
                        <!-- Settings -->
                    </div>
                </div>
                <!-- /Account Area and Settings -->
            </div>
        </div>
    </div>
    <div class="main-content">
              <rapid:block name="main-content">  
	                 
	            </rapid:block>  
        	
    </div>
    
    <div class="footer-bottom">
                                   版权所有 ® 2016 范晓冰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：河南省新乡市&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <!--Basic Scripts-->
    <script src="<%=request.getContextPath()%>/assets/js/jquery-2.0.3.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>

    <!--Beyond Scripts-->
    <script src="<%=request.getContextPath()%>/assets/js/beyond.min.js"></script>


 


    <script type="text/javascript" src="<%=request.getContextPath()%>/js/home/vmc.slider.full.min.js"></script>
      <!--Google Analytics::Demo Only-->
    <script type="text/javascript">
		$(function() {
			$('#slider').vmcSlider({
				width: 1000,
				height: 300,
				gridCol: 10,
				gridRow: 5,
				gridVertical: 20,
				gridHorizontal: 10,
				autoPlay: true,
				ascending: true,
				effects: [
					'fade', 'fadeLeft', 'fadeRight', 'fadeTop', 'fadeBottom', 'fadeTopLeft', 'fadeBottomRight',
					'blindsLeft', 'blindsRight', 'blindsTop', 'blindsBottom', 'blindsTopLeft', 'blindsBottomRight',
					'curtainLeft', 'curtainRight', 'interlaceLeft', 'interlaceRight', 'mosaic', 'bomb', 'fumes'
				],
				ie6Tidy: false,
				random: false,
				duration: 2000,
				speed: 900
			});
		});
	</script>
</body>
<!--  /Body -->
</html>
