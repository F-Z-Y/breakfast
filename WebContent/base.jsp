<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
<!-- Head -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard</title>

<meta name="description" content="Dashboard" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="img/favicon.png" type="image/x-icon">


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
					<a href="#" class="navbar-brand"> <small> <img
							src="<%=request.getContextPath()%>/assets/img/logo.png" alt="" />
					</small>
					</a>
				</div>
				<!-- /Navbar Barnd -->

				<!-- Sidebar Collapse -->
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="collapse-icon fa fa-bars"></i>
				</div>
				<!-- /Sidebar Collapse -->
				<!-- Account Area and Settings --->
				<div class="navbar-header pull-right">
					<div class="navbar-account">
						<ul class="account-area">
							<li><a class="login-area dropdown-toggle"
								data-toggle="dropdown">
									<div class="avatar" title="View your public profile">
										<img
											src="<%=request.getContextPath()%>/assets/img/avatars/adam-jansen.jpg">
									</div>
									<section>
										<h2>
											<span class="profile"><span>管理员</span></span>
										</h2>
									</section>
							</a> <!--Login Area Dropdown-->
								<ul
									class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
									<li class="username"><a>David Stevenson</a></li>
									<li class="email"><a>David.Stevenson@live.com</a></li>
									<!--Avatar Area-->
									<li>
										<div class="avatar-area">
											<img
												src="<%=request.getContextPath()%>/assets/img/avatars/adam-jansen.jpg"
												class="avatar"> <span class="caption">Change
												Photo</span>
										</div>
									</li>
									<!--Avatar Area-->
									<li class="edit"><a href="profile.html" class="pull-left">Profile</a>
										<a href="#" class="pull-right">Setting</a></li>
									<!--Theme Selector Area-->
									<li class="theme-area">
										<ul class="colorpicker" id="skin-changer">
											<li><a class="colorpick-btn" href="#"
												style="background-color: #5DB2FF;"
												rel="<%=request.getContextPath()%>/assets/css/skins/blue.min.css"></a></li>
											<li><a class="colorpick-btn" href="#"
												style="background-color: #2dc3e8;"
												rel="<%=request.getContextPath()%>/assets/css/skins/azure.min.css"></a></li>
											<li><a class="colorpick-btn" href="#"
												style="background-color: #03B3B2;"
												rel="<%=request.getContextPath()%>/assets/css/skins/teal.min.css"></a></li>
											<li><a class="colorpick-btn" href="#"
												style="background-color: #53a93f;"
												rel="<%=request.getContextPath()%>/assets/css/skins/green.min.css"></a></li>
											<li><a class="colorpick-btn" href="#"
												style="background-color: #FF8F32;"
												rel="<%=request.getContextPath()%>/assets/css/skins/orange.min.css"></a></li>
											<li><a class="colorpick-btn" href="#"
												style="background-color: #cc324b;"
												rel="<%=request.getContextPath()%>/assets/css/skins/pink.min.css"></a></li>
											<li><a class="colorpick-btn" href="#"
												style="background-color: #AC193D;"
												rel="<%=request.getContextPath()%>/assets/css/skins/darkred.min.css"></a></li>
											<li><a class="colorpick-btn" href="#"
												style="background-color: #8C0095;"
												rel="<%=request.getContextPath()%>/assets/css/skins/purple.min.css"></a></li>
											<li><a class="colorpick-btn" href="#"
												style="background-color: #0072C6;"
												rel="<%=request.getContextPath()%>/assets/css/skins/darkblue.min.css"></a></li>
											<li><a class="colorpick-btn" href="#"
												style="background-color: #585858;"
												rel="<%=request.getContextPath()%>/assets/css/skins/gray.min.css"></a></li>
											<li><a class="colorpick-btn" href="#"
												style="background-color: #474544;"
												rel="<%=request.getContextPath()%>/assets/css/skins/black.min.css"></a></li>
											<li><a class="colorpick-btn" href="#"
												style="background-color: #001940;"
												rel="<%=request.getContextPath()%>/assets/css/skins/deepblue.min.css"></a></li>
										</ul>
									</li>
									<!--/Theme Selector Area-->
									<li class="dropdown-footer"><a href="login.html"> Sign
											out </a></li>
								</ul> <!--/Login Area Dropdown--></li>
							<!-- /Account Area -->
							<!--Note: notice that setting div must start right after account area list.
                            no space must be between these elements-->
							<!-- Settings -->
						</ul>
						<div class="setting">
							<a id="btn-setting" title="Setting" href="#"> <i
								class="icon glyphicon glyphicon-cog"></i>
							</a>
						</div>
						<div class="setting-container">
							<label> <input type="checkbox" id="checkbox_fixednavbar">
								<span class="text">Fixed Navbar</span>
							</label> <label> <input type="checkbox"
								id="checkbox_fixedsidebar"> <span class="text">Fixed
									SideBar</span>
							</label> <label> <input type="checkbox"
								id="checkbox_fixedbreadcrumbs"> <span class="text">Fixed
									BreadCrumbs</span>
							</label> <label> <input type="checkbox" id="checkbox_fixedheader">
								<span class="text">Fixed Header</span>
							</label>
						</div>
						<!-- Settings -->
					</div>
				</div>
				<!-- /Account Area and Settings -->
			</div>
		</div>
	</div>
	<!-- /Navbar -->
	<!-- Main Container -->
	<div class="main-container container-fluid">
		<!-- Page Container -->
		<div class="page-container">
			<!-- Page Sidebar -->
			<div class="page-sidebar" id="sidebar">
				<!-- Page Sidebar Header-->
				<div class="sidebar-header-wrapper">
					<input type="text" class="searchinput" /> <i
						class="searchicon fa fa-search"></i>
					<div class="searchhelper">Search Reports, Charts, Emails or
						Notifications</div>
				</div>
				<!-- /Page Sidebar Header -->
				<!-- Sidebar Menu -->
				<ul class="nav sidebar-menu">
					<!--Dashboard-->
					<li class="active"><a
						href="<%=request.getContextPath()%>/index.jsp"> <i
							class="menu-icon glyphicon glyphicon-home"></i> <span
							class="menu-text"> 首页 </span>
					</a></li>
					<!--UI Elements-->
					<li><a href="#" class="menu-dropdown"> <i
							class="menu-icon fa fa-desktop"></i> <span class="menu-text">
								商品 </span> <i class="menu-expand"></i>
					</a>

						<ul class="submenu">
							<li><a href="<%=request.getContextPath()%>/admin/product.do">
									<span class="menu-text">商品管理</span>
							</a></li>
							<li><a
								href="<%=request.getContextPath()%>/admin/recovery.do"> <span
									class="menu-text">商品恢复</span>
							</a></li>
						</ul></li>
					<li><a href="#" class="menu-dropdown"> <i
							class="menu-icon fa fa-desktop"></i> <span class="menu-text">
								商户 </span> <i class="menu-expand"></i>
					</a>

						<ul class="submenu">
							<li><a
								href="<%=request.getContextPath()%>/admin/addseller.do"> <span
									class="menu-text">添加商户</span>
							</a></li>
							<li><a href="<%=request.getContextPath()%>/admin/seller.do">
									<span class="menu-text">商户管理</span>
							</a></li>
							<li><a
								href="<%=request.getContextPath()%>/admin/recoveryseller.do">
									<span class="menu-text">商户恢复</span>
							</a></li>
						</ul></li>

					<li><a href="#" class="menu-dropdown"> <i
							class="menu-icon fa fa-desktop"></i> <span class="menu-text">
								用户 </span> <i class="menu-expand"></i></a>
						<ul class="submenu">
							<li><a href="<%=request.getContextPath()%>/admin/adduser.do">
									<span class="menu-text">添加用户</span>
							</a></li>
							<li><a href="<%=request.getContextPath()%>/admin/user.do">
									<span class="menu-text">用户管理</span>
							</a></li>
							<li><a
								href="<%=request.getContextPath()%>/admin/recoveryuser.do">
									<span class="menu-text">用户恢复</span>
							</a></li>
						</ul></li>
					<li><a href="#" class="menu-dropdown"> <i
							class="menu-icon fa fa-desktop"></i> <span class="menu-text">
								充值/退款 </span> <i class="menu-expand"></i></a>
						<ul class="submenu">
							<li><a
								href="<%=request.getContextPath()%>/admin/patrimonyset.do">
									<span class="menu-text">资产管理</span>
							</a></li>
							<li><a
								href="<%=request.getContextPath()%>/admin/userrechange.do">
									<span class="menu-text">用户充值</span>
							</a></li>
							<li><a
								href="<%=request.getContextPath()%>/admin/userrefunds.do"> <span
									class="menu-text">用户退款</span>
							</a></li>
						</ul></li>
					<li><a href="#" class="menu-dropdown"> <i
							class="menu-icon fa fa-desktop"></i> <span class="menu-text">
								订单 </span> <i class="menu-expand"></i></a>
						<ul class="submenu">
							<li><a
								href="<%=request.getContextPath()%>/admin/order.do">
									<span class="menu-text">订单列表</span>
							</a></li>
						</ul></li>
				</ul>
				<!-- /Sidebar Menu -->
			</div>
			<!-- /Page Sidebar -->
			<!-- Page Content -->
			<div class="page-content">
				<!-- Page Breadcrumb -->
				<div class="page-breadcrumbs">
					<ul class="breadcrumb">
						<rapid:block name="page-title">

						</rapid:block>

					</ul>
				</div>
				<!-- /Page Breadcrumb -->
				<!-- Page Header -->
				<div class="page-header position-relative">
					<div class="header-title">

						<h1>
							<rapid:block name="header-title">
							</rapid:block>
						</h1>
					</div>
					<!--Header Buttons-->
					<div class="header-buttons">
						<a class="sidebar-toggler" href="#"> <i class="fa fa-arrows-h"></i>
						</a> <a class="refresh" id="refresh-toggler" href=""> <i
							class="glyphicon glyphicon-refresh"></i>
						</a> <a class="fullscreen" id="fullscreen-toggler" href="#"> <i
							class="glyphicon glyphicon-fullscreen"></i>
						</a>
					</div>
					<!--Header Buttons End-->
				</div>
				<!-- /Page Header -->
				<!-- Page Body -->
				<div class="page-body">

					<rapid:block name="content">
					</rapid:block>
				</div>
				<!-- /Page Body -->
			</div>
			<!-- /Page Content -->
		</div>
		<!-- /Page Container -->
		<!-- Main Container -->

	</div>

	<!--Basic Scripts-->
	<script
		src="<%=request.getContextPath()%>/assets/js/jquery-2.0.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>

	<!--Beyond Scripts-->
	<script src="<%=request.getContextPath()%>/assets/js/beyond.min.js"></script>


	<!--Page Related Scripts-->
	<!--Sparkline Charts Needed Scripts-->
	<script
		src="<%=request.getContextPath()%>/assets/js/charts/sparkline/jquery.sparkline.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/charts/sparkline/sparkline-init.js"></script>

	<!--Easy Pie Charts Needed Scripts-->
	<script
		src="<%=request.getContextPath()%>/assets/js/charts/easypiechart/jquery.easypiechart.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/charts/easypiechart/easypiechart-init.js"></script>
	<rapid:block name="js">
	</rapid:block>


	<script>
		// If you want to draw your charts with Theme colors you must run initiating charts after that current skin is loaded
		$(window)
				.bind(
						"load",
						function() {

							/*Sets Themed Colors Based on Themes*/
							themeprimary = getThemeColorFromCss('themeprimary');
							themesecondary = getThemeColorFromCss('themesecondary');
							themethirdcolor = getThemeColorFromCss('themethirdcolor');
							themefourthcolor = getThemeColorFromCss('themefourthcolor');
							themefifthcolor = getThemeColorFromCss('themefifthcolor');

							//Sets The Hidden Chart Width
							$('#dashboard-bandwidth-chart').data('width',
									$('.box-tabbs').width() - 20);

							//-------------------------Visitor Sources Pie Chart----------------------------------------//
							var data = [ {
								data : [ [ 1, 21 ] ],
								color : '#fb6e52'
							}, {
								data : [ [ 1, 12 ] ],
								color : '#e75b8d'
							}, {
								data : [ [ 1, 11 ] ],
								color : '#a0d468'
							}, {
								data : [ [ 1, 10 ] ],
								color : '#ffce55'
							}, {
								data : [ [ 1, 46 ] ],
								color : '#5db2ff'
							} ];
							var placeholder = $("#dashboard-pie-chart-sources");
							placeholder.unbind();

							//------------------------------Visit Chart------------------------------------------------//
							var data2 = [
									{
										color : themesecondary,
										label : "Direct Visits",
										data : [ [ 3, 2 ], [ 4, 5 ], [ 5, 4 ],
												[ 6, 11 ], [ 7, 12 ],
												[ 8, 11 ], [ 9, 8 ],
												[ 10, 14 ], [ 11, 12 ],
												[ 12, 16 ], [ 13, 9 ],
												[ 14, 10 ], [ 15, 14 ],
												[ 16, 15 ], [ 17, 9 ] ],

										lines : {
											show : true,
											fill : true,
											lineWidth : .1,
											fillColor : {
												colors : [ {
													opacity : 0
												}, {
													opacity : 0.4
												} ]
											}
										},
										points : {
											show : false
										},
										shadowSize : 0
									},
									{
										color : themeprimary,
										label : "Referral Visits",
										data : [ [ 3, 10 ], [ 4, 13 ],
												[ 5, 12 ], [ 6, 16 ],
												[ 7, 19 ], [ 8, 19 ],
												[ 9, 24 ], [ 10, 19 ],
												[ 11, 18 ], [ 12, 21 ],
												[ 13, 17 ], [ 14, 14 ],
												[ 15, 12 ], [ 16, 14 ],
												[ 17, 15 ] ],
										bars : {
											order : 1,
											show : true,
											borderWidth : 0,
											barWidth : 0.4,
											lineWidth : .5,
											fillColor : {
												colors : [ {
													opacity : 0.4
												}, {
													opacity : 1
												} ]
											}
										}
									},
									{
										color : themethirdcolor,
										label : "Search Engines",
										data : [ [ 3, 14 ], [ 4, 11 ],
												[ 5, 10 ], [ 6, 9 ], [ 7, 5 ],
												[ 8, 8 ], [ 9, 5 ], [ 10, 6 ],
												[ 11, 4 ], [ 12, 7 ],
												[ 13, 4 ], [ 14, 3 ],
												[ 15, 4 ], [ 16, 6 ], [ 17, 4 ] ],
										lines : {
											show : true,
											fill : false,
											fillColor : {
												colors : [ {
													opacity : 0.3
												}, {
													opacity : 0
												} ]
											}
										},
										points : {
											show : true
										}
									} ];
							var options = {
								legend : {
									show : false
								},
								xaxis : {
									tickDecimals : 0,
									color : '#f3f3f3'
								},
								yaxis : {
									min : 0,
									color : '#f3f3f3',
									tickFormatter : function(val, axis) {
										return "";
									},
								},
								grid : {
									hoverable : true,
									clickable : false,
									borderWidth : 0,
									aboveData : false,
									color : '#fbfbfb'

								},
								tooltip : true,
								tooltipOpts : {
									defaultTheme : false,
									content : " <b>%x May</b> , <b>%s</b> : <span>%y</span>",
								}
							};
							var placeholder = $("#dashboard-chart-visits");

							//------------------------------Real-Time Chart-------------------------------------------//
							var data = [], totalPoints = 300;

							function getRandomData() {

								if (data.length > 0)
									data = data.slice(1);

								// Do a random walk

								while (data.length < totalPoints) {

									var prev = data.length > 0 ? data[data.length - 1]
											: 50, y = prev + Math.random() * 10
											- 5;

									if (y < 0) {
										y = 0;
									} else if (y > 100) {
										y = 100;
									}

									data.push(y);
								}

								// Zip the generated y values with the x values

								var res = [];
								for (var i = 0; i < data.length; ++i) {
									res.push([ i, data[i] ]);
								}

								return res;
							}
							// Set up the control widget
							var updateInterval = 100;

							//-------------------------Initiates Easy Pie Chart instances in page--------------------//
							InitiateEasyPieChart.init();

							//-------------------------Initiates Sparkline Chart instances in page------------------//
							InitiateSparklineCharts.init();
						});
	</script>
	<!--Google Analytics::Demo Only-->



</body>
<!--  /Body -->
</html>
