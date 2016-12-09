<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %> 
<rapid:override name="css">
<link href="<%=request.getContextPath()%>/css/home/product.css"  rel="stylesheet" /> 
</rapid:override>
<rapid:override name="main-content">
    <div class="dashboard-box">
       <div class="widget">
                <div class="widget-header bordered-bottom bordered-palegreen">
                    <span class="widget-caption"><a>返回</a></span>
                </div>
                <div class="widget-body">
                    <div>
                        <form class="form-horizontal form-bordered" role="form">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">商品名称：</label>
                                <label class="col-sm-2 control-label no-padding-right">${GoodInfo.name}</label>
                               
                            </div>
                            <div class="form-group">
                               <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">类型：</label>
                                <label class="col-sm-2 control-label no-padding-right">鸭梨</label>
                            </div>
                             <div class="form-group">
                               <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">所属店铺：</label>
                                <label class="col-sm-2 control-label no-padding-right"><a href="shopDetail.do?id=${GoodInfo.seller_id}">${GoodInfo.seller_name}</a></label>
                            </div>
                             <div class="form-group">
                               <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">图片：</label>
                                <label class="col-sm-2 control-label no-padding-right">鸭梨</label>
                            </div>
                             <div class="form-group">
                               <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">价格：</label>
                                <label class="col-sm-2 control-label no-padding-right">￥${GoodInfo.price}</label>
                            </div>
                            <div class="form-group">
                               <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">规格：</label>
                                <label class="col-sm-2 control-label no-padding-right">10个</label>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="c-but">
					                    <span class="pointer" id="buy-now" dataname="${GoodInfo.name}" dataprice="${GoodInfo.price}" dataid="${GoodInfo.id}">立即购买</span>
					                    <span class="pointer addcar" dataname="${GoodInfo.name}" dataprice="${GoodInfo.price}" dataid="${GoodInfo.id}">加入购物车</span>
					                </div>
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
		    <a href="{:url('cart/index?type=step1')}" id="go"><div class="go">去结算</div></a>
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