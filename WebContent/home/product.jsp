<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<rapid:override name="css">
<link href="<%=request.getContextPath()%>/css/home/product.css"  rel="stylesheet" /> 
</rapid:override>
<% Cookie co=new Cookie("name","fanxiaobing"); 
    response.addCookie(co);
%>
<rapid:override name="main-content">
            <div class="widget flat radius-bordered">
              <div class="widget-header bg-themeprimary">
                  <span class="widget-caption">全部商品</span>
              </div>

              <div class="widget-body">
                  <div class="widget-main ">
                      <div class="tabbable">
                          <ul class="nav nav-tabs tabs-flat" id="myTab11">
                              <li class="active">
                                  <a data-toggle="tab" href="#home11">
                                                                                                                                                                                                      零食
                                  </a>
                              </li>
                              <li class="">
                                  <a data-toggle="tab" href="#profile11">
                                                                                                                                                                                                 饮料
                                  </a>
                              </li>
                          </ul>
                          <div class="tab-content tabs-flat">
                              <div id="home11" class="tab-pane active">
                              <c:forEach items="${productList}" var="c" varStatus="status">
                                <c:if test="${status.index%3==0}">
                                  <div class="row">
                                  </c:if>
                                  <div class="col-md-4">
			                             <div class="product-item">
			                                     <span id="line0">
			                                     <a href="prdetail.jsp">
			                                     <img class="img" width="100%" height="167" src="../img/yupian.jpg" style="opacity: 1;">
			                                     </a></span><span id="line1"><span class="price">￥${c.pice}</span><span class="title">${c.productName}</span></span><span id="line2">
			                                     <span class="standard">规格：箱</span>
			                                     <a id="more" class="more-off" href="prdetail.do?id=${c.id}">详情</a>
			                                     </span>
			                                     <span style="margin-left: 10px;
                                                          margin-bottom: 10px;">
                                                          <img dataname="${c.productName}" dataprice="${c.pice}" dataid="${c.id}" class="addcar" src="<%=request.getContextPath() %>/img/shopping_cart.png"></span>
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

                              <div id="profile11" class="tab-pane">
                                  <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
                              </div>
                          </div>
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
<<rapid:override name="js">
 <script src="<%=request.getContextPath()%>/js/home/jquery.cookie.js"></script>
 <script>
   var car_path= '<%=request.getContextPath()%>/img';
 </script>
 <script src="<%=request.getContextPath()%>/js/home/jquery.car.js"></script>
 <script src="<%=request.getContextPath()%>/js/home/product.js"></script>
</rapid:override>
<%@ include file="/homeBase.jsp" %> 