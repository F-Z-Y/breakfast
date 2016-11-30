<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<rapid:override name="main-content">
    <div class="content" style="width:1000px;height:300px;margin:30px auto;overflow:hidden;">
				<div id="slider">
					<a href="#"><img src="../img/demo1.jpg"/></a>
					<a href="#"><img src="../img/demo2.jpg"/></a>
					<a href="#"><img src="../img/demo3.jpg"/></a>
					<a href="#"><img src="../img/demo4.jpg"/></a>
					<a href="#"><img src="../img/demo5.jpg"/></a>
					<a href="#"><img src="../img/demo6.jpg"/></a>
				</div>
			</div>
			<!-- widget flat radius-bordered -->
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
			                                     <a id="more" href="prdetail.do?id=${c.id}">详情</a>
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

                              <div id="profile11" class="tab-pane">
                                  <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- widget flat radius-bordered -->
          <div class="widget flat radius-bordered">
              <div class="widget-header bg-themeprimary">
                  <span class="widget-caption">全部商家</span>
              </div>
              <div class="widget-body">
              <c:forEach items="${shopList}" var="c" varStatus="status">
                <c:if test="${status.index%3==0}">
                   <div class="row">
                 </c:if>
                            <div class="col-md-4">
                               <div class="product-item">
                                     <span id="line0">
                                     <a href="/mini/index.php/index/goods/detail.html?id=3">
                                     <img class="img" width="100%" height="167" src="../img/yupian.jpg" style="opacity: 1;">
                                     </a></span><span id="line1"><span class="price">评分：<span class="fa fa-star"></span><span class="fa fa-star-o"></span></span><span class="title">${c.name}</span></span><span id="line2">
                                     <span class="standard">状态：营业中</span>
                                     <a id="more" class="more-off" href="shopDetail.do?id=${c.id}">进入</a>
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
           </div><!-- widget flat radius-bordered -->
</rapid:override>
<%@ include file="/homeBase.jsp" %>