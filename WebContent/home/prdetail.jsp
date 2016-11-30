<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %> 
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
                                    <button type="submit" class="btn btn-palegreen">立即购买</button>
                                     <button type="submit" class="btn btn-palegreen">加入购物车</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </div>
</rapid:override>
<%@ include file="/homeBase.jsp" %> 