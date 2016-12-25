<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<rapid:override name="css">
<link href="<%=request.getContextPath()%>/css/home/cart.css"
	rel="stylesheet" />
</rapid:override>
<rapid:override name="main-content">
  <div class="widget flat radius-bordered">
  <% request.setAttribute("prices", request.getAttribute("price"));%>
     <div class="row">
          <div class="widget">
                 <div class="widget-header bordered-bottom bordered-palegreen">
                     <span class="widget-caption">订单信息</span>
                 </div>
               <c:forEach items="${orderList}" var="c">
                 <div class="widget-body">
                     <div>
                         <form class="form-horizontal form-bordered" role="form">
                             <div class="form-group">
                                 <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">订单号：</label>
                                <label id="orderID" for="inputEmail3" class="col-sm-10 control-label no-padding-left" style="text-align: left;">${c.orderNum}</label>
                             </div>
                            <div class="form-group">
                                 <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">时间：</label>
                                <label for="inputEmail3" class="col-sm-10 control-label no-padding-left" style="text-align: left;">${time}</label>
                             </div>
                             <div class="form-group">
                               <label for="inputPassword3" class="col-sm-2 control-label no-padding-right">商品详情：</label>
                                <div class="col-sm-10">
                                   <table class="table table-hover">
                                    <thead class="bordered-green">
                                        <tr>
                                            <th>#</th>
                                            <th>商品名称</th>
                                            <th>单价(元)</th>
                                            <th>数量</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <c:set value="${c.products }" var="subItem"/>
                                      <c:forEach items="${subItem}" var="s" varStatus="status">
                                        <tr><td>${status.index+1}</td>
                                            <td>${s.productName}</td>
                                            <td>${s.pice}</td>
                                            <td>${s.num}</td>
                                        </tr>
                                      </c:forEach>
                                    </tbody> 
                                    </table>
                                </div>
                             </div>
                             <div class="form-group">
                                 <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">实付金额：</label>
                                <label for="inputEmail3" class="col-sm-10 control-label no-padding-left" style="text-align: left;">￥${c.money}</label>
                              </div>
                               <div class="form-group">
                                 <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">配送地址：</label>
                                <label for="inputEmail3" class="col-sm-10 control-label no-padding-left" style="text-align: left;">${address}</label>
                              </div>
                              <div class="form-group">
                                 <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">联系方式：</label>
                                <label for="inputEmail3" class="col-sm-10 control-label no-padding-left" style="text-align: left;">${phone}</label>
                              </div>
                               <div class="form-group">
                                 <div class="col-sm-offset-2 col-sm-10">
                                 </div>
                             </div>
                             
                         </form>
                         <div class="form-group">
                                 <div class="col-sm-offset-2 col-sm-10">
                                     <button class="payOrder" price="${c.money}"  number="${c.orderNum}" style="    margin-top: -25px;">支付</button>
                                 </div>
                             </div>
                     </div>
                 </div>
                 </c:forEach>
             </div>
     </div>
  </div>
   <%
Cookie cookies[] = request.getCookies();  
if (cookies != null)  
{  
    for (int i = 0; i < cookies.length; i++)  
    {  
        if (cookies[i].getName().equals("mini_car"))  
        {  
            Cookie cookie = new Cookie("mini_car","ww");//这边得用"",不能用null  
            cookie.setPath("/");//设置成跟写入cookies一样的  
           // cookie.setDomain(".wangwz.com");//设置成跟写入cookies一样的  
            cookie.setMaxAge(0);  
            response.addCookie(cookie);  
        }  
    }  
}  
%>
</rapid:override>
<rapid:override name="js">
 <script src="<%=request.getContextPath()%>/js/home/pay.js"></script>
 <script>
 $(function(){
	 $(".payOrder").click(function(data){
		 var price=$(this).attr("price");
			var btn=$(this);
			var orderID=$(this).attr("number");
			$.ajax({
				type:'post',
				url:'orderPay.do',
				data:{'orderID':orderID,'price':price},
				dataType:'json',
				success:function(obj){
					if(obj.code==0){
						/*  Notify(obj.msg, 'top-right', '3000', 'success', 'fa-check');
	                     setTimeout(function(){
								//location.reload();	
							},200); */
						/* window.location.href="index.do"; */
						alert(obj.msg);
						console.log(btn);
						btn.text("已支付");
					 	btn.attr("disabled",'disabled');
					}else{
						alert(obj.msg);
					}
				}
			 })
	 })
})
 
 </script>
</rapid:override>
<%@ include file="/homeBase.jsp" %> 