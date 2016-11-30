<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<rapid:override name="main-content">
			<div class="widget flat radius-bordered">
             
              <div class="widget-body">
                   <div class="row">
                            <div class="col-md-4">
                               <div class="product-item">
                                     <span id="line0">
                                     <a href="/mini/index.php/index/goods/detail.html?id=3">
                                     <img class="img" width="100%" height="167" src="../img/yupian.jpg" style="opacity: 1;">
                                     </a></span>
                                     <span id="line1">
                                          <span class="price">评分：
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star-o"></span>
                                            <span class="fa fa-star-o"></span>
                                            <span class="fa fa-star-o"></span>
                                            <span class="fa fa-star-o"></span>
                                          </span>
                                          <span class="title">永和豆浆（宝龙店）</span>
                                       </span>
                                       <span id="line2">
                                        <span class="standard">状态：营业中</span>
                                     <a id="more" class="more-off" href="/mini/index.php/index/goods/detail.html?id=3">进入</a>
                                     </span>
                                     <div style="clear:both;"></div></div></div>           
                               </div>
              </div>
           </div><!-- widget flat radius-bordered -->
         
         
</rapid:override>
<%@ include file="/homeBase.jsp" %> 