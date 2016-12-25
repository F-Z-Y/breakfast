<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<rapid:override name="css">
<link href="<%=request.getContextPath()%>/css/home/cart.css"
	rel="stylesheet" />
<style type="text/css">
  .cart-go-pay {
    display: block;
    width: 149px;
    height: 39px;
    background: url(../img/go_pay1.png) no-repeat;
    float: right;
    margin-top: 25px;
    border: none;
}
</style>
</rapid:override>
<rapid:override name="main-content">
    <div class="widget flat radius-bordered">
    <form action="pay.do" method="post">
            <table class="table">
                <tbody><tr>
            		<td width="35%">商品名称</td>
            		<td style="text-align:center;">数量</td>
            		<td>单价（元）</td>
            		<td>小计</td>
            		<td>操作</td>
            	</tr>
            
            	<c:forEach items="${orderList}" var="c" varStatus="index">
                  <tr>
            		<td>
                      <span class="cgi-title">${c[1]}</span>     
                    </td>
            		<td>
                    	<span class="cart-goods-num">
                        	<div class="goods-tools">
                            	<span class="jian"></span>
                                <div class="text">
                                    <input id="buy-num" type="text" value="${c[3]}">
                                    <input name="cart[]" class="cart-info" id="goods_id_2" type="hidden" value="
                                    ,2,20.00,5">
                                </div>
                                <span class="jia"></span>
                            </div>
                        </span>
                    </td>
            		<td>
                    	<span class="cart-goods-price">￥${c[2]}</span>
                    </td>
            		<td>
                    	<span class="cart-goods-sum goods-money-2">￥${c[4]}元</span>
                    </td>
            		<td>
                        <span class="cart-goods-status"><a href="#" class="delete" id="2">删除</a></span>
                    </td>
            	</tr>
                 </c:forEach>          
                 <tr>
            		<td colspan="2">
                    	配送地址：${userInfo.address}
                    </td>
            		<td>联系方式：${userInfo.phone}</td>
            		<td colspan="3" style="font-weight:bold; text-align:right; font-size:16px">
                    	<p>购物金额小计 <span class="cart-money" style="color:#ff0024">￥${price}元</span></p>
                        <p><a href="pay.do"><button class="cart-go-pay"></button></a></p>
                    </td>
           		</tr>
            </tbody></table>
        </form>
  </div>
 
</rapid:override>

<%@ include file="/homeBase.jsp" %> 