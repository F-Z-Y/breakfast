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
                                <label class="col-sm-2 control-label no-padding-right">10个</label>
                            </div>
                            <div class="form-group">
                         
		                                    <div class="row">
			                                  <div class="col-md-4">
						                             <div class="product-item">
						                                     <span id="line0">
						                                     <a href="prdetail.jsp">
						                                     <img class="img" width="100%" height="167" src="../img/yupian.jpg" style="opacity: 1;">
						                                     </a></span><span id="line1"><span class="price">￥10.0</span><span class="title">牛奶</span></span><span id="line2">
						                                     <span class="standard">规格：箱</span>
						                                     <a id="more" class="more-off" href="prdetail.do?id=1">详情</a>
						                                     </span>
						                                     <div style="clear:both;"></div>
			                                           </div>
						                        </div>  
				                                 <div class="col-md-4">
							                             <div class="product-item">
							                                     <span id="line0">
							                                     <a href="prdetail.jsp">
							                                     <img class="img" width="100%" height="167" src="../img/yupian.jpg" style="opacity: 1;">
							                                     </a></span><span id="line1"><span class="price">￥2.0</span><span class="title">酱香饼</span></span><span id="line2">
							                                     <span class="standard">规格：箱</span>
							                                     <a id="more" class="more-off" href="prdetail.do?id=2">详情</a>
							                                     </span>
							                                     <div style="clear:both;"></div>
				                                         </div>
							                       </div>  
		                                     </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </div>
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