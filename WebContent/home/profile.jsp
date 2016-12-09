<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<rapid:override name="main-content">
      <div class="row">
           <div class="col-md-12">
               <div class="profile-container">
                   <div class="profile-header row">
                       <div class="col-lg-2 col-md-4 col-sm-12 text-center">
                          
                       </div>
                       <div class="col-lg-5 col-md-8 col-sm-12 profile-info">
                           <div class="header-fullname">昵称：${userInfo.userName}</div>
                           <a href="profileAlter.do" class="btn btn-palegreen btn-sm  btn-follow">
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
                                      <button id="recharge">充值</button>                                                                                   
                               </div>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-12 col-sm-12 col-xs-12">
                            <div class="widget">
                                <div class="widget-header bordered-bottom bordered-themeprimary">
                                    <i class="widget-icon fa fa-tasks themeprimary"></i>
                                    <span class="widget-caption themeprimary">订单列表</span>
                                </div><!--Widget Header-->
                                <div class="widget-body">
                                    <div class="widget-main no-padding">
                                        <div class="task-container">
                                            <div class="task-search">
                                                <span class="input-icon">
                                                    <input type="text" class="form-control" placeholder="Search Tasks">
                                                    <i class="fa fa-search gray"></i>
                                                </span>
                                            </div>
                                            <ul class="tasks-list">
                                              <c:forEach items="${orderList}" var="c" >
                                                <li class="task-item">
                                                    <div class="task-check">
                                                        <label>
                                                            <input type="checkbox">
                                                            <span class="text"></span>
                                                        </label>
                                                    </div>
                                                    <div class="task-state">
                                                        <span class="label label-yellow">
                                                                                                                                                                                                              订单号
                                                        </span>
                                                         <span class="task">
                                                           ${c.orderNum}
                                                        </span>
                                                    </div>
                                                    <div class="task-time">${c.createtime}</div>
                                                    <div class="task-body">
                                                      <c:set value="${c.products }" var="subItem"/>  
                                                      <c:forEach items="${subItem}" var ="p">
                                                                                                                                                                                                       名称: ${p.productName} 单价：${p.pice}(元) 数量：${p.num}|
                                                      </c:forEach>
                                                    </div>
                                                    <div class="task-creator">实付金额：￥${c.money}</div>
                                                    <div class="task-assignedto">状态：${c.statusInfo}</div>
                                                </li>
                                               </c:forEach>
                                            </ul>
                                        </div>
                                    </div><!--Widget Main Container-->
                                </div><!--Widget Body-->
                            </div>

                        </div>
                   
                   
               </div>
           </div>
       </div>
       <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title">充值信息</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal form-bordered" role="form">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">账户名</label>
                        <div class="col-sm-10">
                            <input id="name" type="text" class="form-control" id="inputEmail3" value="${userInfo.account}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label no-padding-right">金额</label>
                        <div class="col-sm-10">
                            <input id="price" maxlength="3" type="number" class="form-control" id="inputPassword3" value="">
                        </div>
                    </div>
                   
                </form>
		      </div>
		      <div class="modal-footer">
		        <button id="close" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button id="submit" type="button" class="btn btn-primary">提交</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
</rapid:override>
<<rapid:override name="js">
<script src="<%=request.getContextPath()%>/assets/js/bootbox/bootbox.js"></script>
   <script src="<%=request.getContextPath()%>/js/home/profile.js"></script>
</rapid:override>
<%@ include file="/homeBase.jsp" %> 