<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<rapid:override name="css">
<link href="<%=request.getContextPath()%>/css/home/product.css"  rel="stylesheet" /> 
</rapid:override>
<rapid:override name="main-content">
    <div class="dashboard-box">
      
       <div class="widget">
                <div class="widget-header bordered-bottom bordered-palegreen">
                    <span class="widget-caption"><a href="<%=request.getHeader("Referer")%> ">返回</a></span>
                </div>
                <div class="widget-body">
                    <div>
                        <form class="form-horizontal form-bordered" role="form">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">店铺名称：</label>
                                <label class="col-sm-2 control-label no-padding-right">${shopDetail.name}</label>
                               
                            </div>
                            <div class="form-group">
                               <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">简介：</label>
                                <label class="col-sm-2 control-label no-padding-right">${shopDetail.introduction}</label>
                            </div>
                             <div class="form-group">
                               <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">评分：</label>
                                <label class="col-sm-2 control-label no-padding-right"><a href="shopDetail.do?id="></a></label>
                            </div>
                             <div class="form-group">
                               <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">联系方式：</label>
                                <label class="col-sm-2 control-label no-padding-right">${shopDetail.phone}</label>
                            </div>
                             <div class="form-group">
                               <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">地址：</label>
                                <label class="col-sm-2 control-label no-padding-right">${shopDetail.address}</label>
                            </div>
                            <div class="form-group">
                               <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">上架商品：</label>
                            </div>
                            <div class="form-group">
                                 <div class="widget-body">
                                 <c:forEach items="${productList}" var="c" varStatus="status">
                                       <c:if test="${status.index%3==0}">
		                                    <div class="row">
		                                 </c:if>
				                                 <div class="col-md-4">
							                             <div class="product-item">
							                                     <span id="line0">
							                                     <a href="prdetail.jsp">
							                                     <img class="img" width="100%" height="167" src="../img/yupian.jpg" style="opacity: 1;">
							                                     </a></span><span id="line1"><span class="price">￥2.0</span><span class="title">${c.productName}</span></span><span id="line2">
							                                     <span class="standard">规格：箱</span>
							                                     <span style="float:right;    margin-top: 6px;">
		                                                                <img dataname="${c.productName}" dataprice="${c.pice}" dataid="${c.id}" class="addcar" src="<%=request.getContextPath()%>/img/shopping_cart.png"></span>
							                                     <a id="more" class="more-off" href="prdetail.do?id=2">详情</a>
							                                     </span>
							                                     <div style="clear:both;"></div>
				                                         </div>
							                       </div>  
							              <c:if test="${status.index%3==2}">
		                                     </div>
		                                  </c:if>
		                            </c:forEach>
		                             <c:if test="${status.index%3!=2}">
		                                     </div>
		                                  </c:if>
		                           </div>      
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </div>
    <!-- 购物车begin -->
		<div class="car">
		  <div class="car-wap">
		  <div class="car-top">
		    <span>购物车</span>
		    <span id="car-clear">[清空]</span>
		  </div>
		  <div class="car-list">
		    <table class="table" id="table">
		      <tr class="th">
		        <td class="car-list-product">产品</td>
		        <td class="car-list-num">数量</td>
		        <td class="car-list-price th">单价</td>
		      </tr>
		    </table>
		  </div>
		  </div>
		  <div class="car-footer">
		    <div id="car-icon"><i id="end"></i>共<span id="money">0.00</span>元</div>
		    <a href="order.do" id="go"><div class="go">去结算</div></a>
		  </div>
		</div>
<!-- 购物车end -->
</rapid:override>
<rapid:override name="js">
 <script src="<%=request.getContextPath()%>/js/home/jquery.cookie.js"></script>
 <script>
   var car_path= '<%=request.getContextPath()%>/img';
 </script>
 <script src="<%=request.getContextPath()%>/js/home/jquery.car.js"></script>
 <script src="<%=request.getContextPath()%>/js/home/product.js"></script>
</rapid:override>
<%@ include file="/homeBase.jsp" %> 