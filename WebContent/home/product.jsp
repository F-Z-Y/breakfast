<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<rapid:override name="main-content">
			<!-- widget flat radius-bordered -->
			<div class="widget flat radius-bordered">
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
                                  <div class="row">
                            <div class="col-md-4">
                               <div class="product-item">
                                     <span id="line0">
                                     <a href="/mini/index.php/index/goods/detail.html?id=3">
                                     <img class="img" width="100%" height="167" src="../img/yupian.jpg" style="opacity: 1;">
                                     </a></span><span id="line1"><span class="price">￥5.00</span><span class="title">鸭梨</span></span><span id="line2">
                                     <span class="standard">规格：箱</span>
                                     <a id="more" class="more-off" href="/mini/index.php/index/goods/detail.html?id=3">详情</a>
                                     </span>
                                     <div style="clear:both;"></div></div></div>           
                                    </div>
                              </div>

                              <div id="profile11" class="tab-pane">
                                  <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
         
         
</rapid:override>
<%@ include file="/homeBase.jsp" %> 