<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<rapid:override name="main-content">
      <div class="row">
           <div class="col-md-12">
               <div class="profile-container">
                   <div class="profile-header row">
                       <div class="col-lg-2 col-md-4 col-sm-12 text-center">
                           <img src="${userInfo.headImg}" alt="" class="header-avatar">
                       </div>
                       <div class="col-lg-5 col-md-8 col-sm-12 profile-info">
                           <div class="header-fullname">昵称：${userInfo.userName}</div>
                           <a href="#" class="btn btn-palegreen btn-sm  btn-follow">
                               <i class="fa fa-check"></i>
                                                                                                                        完善信息
                           </a>
                           <div class="header-information">
                                                                                                              配送地址：${userInfo.address}
                           </div>
                       </div>
                       <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12 profile-stats">
                           <div class="row">
                               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 stats-col">
                                   <div class="stats-value pink">姓名</div>
                                   <div class="stats-title">${userInfo.name}</div>
                               </div>
                               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 stats-col">
                                   <div class="stats-value pink">电话</div>
                                   <div class="stats-title">${userInfo.phone}</div>
                               </div>
                               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 stats-col">
                                   <div class="stats-value pink">1207</div>
                                   <div class="stats-title">POSTS</div>
                               </div>
                           </div>
                           <div class="row">
                               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 inlinestats-col">
                                                                                                                       账户: ${userInfo.account}
                               </div>
                               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 inlinestats-col">
                                                                                                                                余额 : <strong>￥${userInfo.money}</strong>
                               </div>
                               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 inlinestats-col">
                                                                                                                                 数量: <strong>24</strong>
                               </div>
                           </div>
                       </div>
                   </div>
                   <div class="profile-body">
                       <div class="col-lg-12">
                           <div class="tabbable">
                               <ul class="nav nav-tabs tabs-flat  nav-justified" id="myTab11">
                                   <li class="active">
                                       <a data-toggle="tab" href="#overview">
                                                                                                                                                       全部订单
                                       </a>
                                   </li>
                                   <li class="tab-red">
                                       <a data-toggle="tab" href="#timeline">
                                                                                                                                                         待收货
                                       </a>
                                   </li>
                                   <li class="tab-palegreen">
                                       <a data-toggle="tab" id="contacttab" href="#contacts">
                                                                                                                                                  未支付
                                       </a>
                                   </li>
                                   <li class="tab-yellow">
                                       <a data-toggle="tab" href="#settings">
                                                                                                                                                          已完成
                                       </a>
                                   </li>
                               </ul>
                               <div class="tab-content tabs-flat">
                                   <div id="overview" class="tab-pane active">
                                   
                                   </div>
                                   <div id="timeline" class="tab-pane">
                                       <ul class="timeline animated fadeInDown">
                                           <li>
                                               <div class="timeline-datetime">
                                                   <span class="timeline-time">
                                                       8:19
                                                   </span><span class="timeline-date">Today</span>
                                               </div>
                                               <div class="timeline-badge blue">
                                                   <i class="fa fa-tag"></i>
                                               </div>
                                               <div class="timeline-panel">
                                                   <div class="timeline-header bordered-bottom bordered-blue">
                                                       <span class="timeline-title">
                                                           New Items Arrived
                                                       </span>
                                                       <p class="timeline-datetime">
                                                           <small class="text-muted">
                                                               <i class="glyphicon glyphicon-time">
                                                               </i>
                                                               <span class="timeline-date">Today</span>
                                                               -
                                                               <span class="timeline-time">8:19</span>
                                                           </small>
                                                       </p>
                                                   </div>
                                                   <div class="timeline-body">
                                                       <p>Purchased new stationary items for head office</p>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="timeline-inverted">
                                               <div class="timeline-datetime">
                                                   <span class="timeline-time">
                                                       3:10
                                                   </span><span class="timeline-date">Today</span>
                                               </div>
                                               <div class="timeline-badge darkorange">
                                                   <i class="fa fa-map-marker font-120"></i>
                                               </div>
                                               <div class="timeline-panel bordered-right-3 bordered-orange">
                                                   <div class="timeline-header bordered-bottom bordered-blue">
                                                       <span class="timeline-title">
                                                           Visit Appointment
                                                       </span>
                                                       <p class="timeline-datetime">
                                                           <small class="text-muted">
                                                               <i class="glyphicon glyphicon-time">
                                                               </i>
                                                               <span class="timeline-date">Today</span>
                                                               -
                                                               <span class="timeline-time">3:10</span>
                                                           </small>
                                                       </p>
                                                   </div>
                                                   <div class="timeline-body">
                                                       <p>Outdoor visit at California State Route 85 with John Boltana &amp; Harry Piterson regarding to setup a new show room.</p>
                                                       <p>
                                                           <i class="orange fa fa-exclamation"></i> New task added for <span><a href="#" class="info">James Dean</a></span>
                                                       </p>
                                                   </div>
                                               </div>
                                           </li>

                                           <li>
                                               <div class="timeline-datetime">
                                                   <span class="timeline-time">
                                                       8:19
                                                   </span><span class="timeline-date">Yesterday</span>
                                               </div>
                                               <div class="timeline-badge sky">
                                                   <i class="fa fa-bar-chart-o"></i>
                                               </div>
                                               <div class="timeline-panel bordered-top-3 bordered-azure">
                                                   <div class="timeline-header bordered-bottom bordered-blue">
                                                       <span class="timeline-title">
                                                           Bank Report
                                                       </span>
                                                       <p class="timeline-datetime">
                                                           <small class="text-muted">
                                                               <i class="glyphicon glyphicon-time">
                                                               </i>
                                                               <span class="timeline-date">Yesterday</span>
                                                               -
                                                               <span class="timeline-time">8:19</span>
                                                           </small>
                                                       </p>
                                                   </div>
                                                   <div class="timeline-body">
                                                       <p>
                                                           Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sem neque sed ipsum.
                                                       </p>
                                                       Tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="timeline-inverted">
                                               <div class="timeline-datetime">
                                                   <span class="timeline-time">
                                                       6:08
                                                   </span><span class="timeline-date">Yesterday</span>
                                               </div>
                                               <div class="timeline-badge sky">
                                                   <img src="assets/img/avatars/Sergey-Azovskiy.jpg" class="badge-picture">
                                               </div>
                                               <div class="timeline-panel">
                                                   <div class="timeline-header bordered-bottom bordered-blue">
                                                       <span class="timeline-title">
                                                           <a href="">Sergey Azovskiy</a> has commented on your <a href="">status</a>
                                                       </span>
                                                       <p class="timeline-datetime">
                                                           <small class="text-muted">
                                                               <i class="glyphicon glyphicon-time">
                                                               </i>
                                                               <span class="timeline-date">Yesterday</span>
                                                               -
                                                               <span class="timeline-time">6:08</span>
                                                           </small>
                                                       </p>
                                                   </div>
                                                   <div class="timeline-body">
                                                       <p>
                                                           <i class="orange fa fa-quote-left"></i> Happy Birthday Lydia.
                                                       </p>
                                                   </div>
                                               </div>
                                           </li>
                                           <li>
                                               <div class="timeline-datetime">
                                                   <span class="timeline-time">
                                                       7:00
                                                   </span><span class="timeline-date">Yesterday</span>
                                               </div>
                                               <div class="timeline-badge danger">
                                                   <i class="fa fa-exclamation font-120"></i>
                                               </div>
                                               <div class="timeline-panel">
                                                   <div class="timeline-header bordered-bottom bordered-blue">
                                                       <span class="timeline-title danger">
                                                           Deadline Added
                                                       </span>
                                                       <p class="timeline-datetime">
                                                           <small class="text-muted">
                                                               <i class="glyphicon glyphicon-time">
                                                               </i>
                                                               <span class="timeline-date">Yesterday</span>
                                                               -
                                                               <span class="timeline-time">7:00</span>
                                                           </small>
                                                       </p>
                                                   </div>
                                                   <div class="timeline-body">
                                                       <p>Dyvia Phillips added new milestone <span><a class="danger" href="#">UI</a></span> Lorem ipsum dolor sit amet consiquest dio</p>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="timeline-inverted">
                                               <div class="timeline-datetime">
                                                   <span class="timeline-time">
                                                       3:09
                                                   </span><span class="timeline-date">Yesterday</span>
                                               </div>
                                               <div class="timeline-badge">
                                                   <i class="fa fa-picture-o darkpink"></i>
                                               </div>
                                               <div class="timeline-panel">
                                                   <div class="timeline-header bordered-bottom bordered-blue">
                                                       <p class="timeline-datetime">
                                                           <small class="text-muted">
                                                               <i class="glyphicon glyphicon-time">
                                                               </i>
                                                               <span class="timeline-date">Yesterday</span>
                                                               -
                                                               <span class="timeline-time">3:09</span>
                                                           </small>
                                                       </p>
                                                   </div>
                                                   <div class="timeline-body">
                                                       <a href="#">John Travolta</a> shared an image on <a href="#">Dribble</a>
                                                       <div class="tl-wide text-center" style="padding: 5px; margin-top:10px; margin-bottom: 10px;">
                                                           <img src="assets/img/temp1.png" alt="" style="max-height: 158px;max-width: 100%;">
                                                       </div>
                                                       <i class="text-muted text-sm">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="timeline-node">
                                               <a class="btn btn-yellow">LOAD MORE</a>
                                           </li>
                                       </ul>
                                   </div>
                                   <div id="contacts" class="tab-pane">
                                   </div>
                                   <div id="settings" class="tab-pane">  
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
</rapid:override>
<%@ include file="/homeBase.jsp" %> 