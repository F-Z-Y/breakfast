<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<rapid:override name="main-content">
<div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="widget">
                <div class="widget-header bordered-bottom bordered-palegreen">
                    <span class="widget-caption">修改个人信息</span>
                </div>
                <div class="widget-body">
                    <div>
                        <form id="form_alter" class="form-horizontal form-bordered" role="form">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">昵称：</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="username" value="${userInfo.userName}" placeholder="昵称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label no-padding-right">姓名：</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="name" value="${userInfo.name}" placeholder="姓名">
                                </div>
                            </div>
                              <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label no-padding-right">联系方式：</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="phone" value="${userInfo.phone}" placeholder="联系方式">
                                </div>
                             </div>
                               <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label no-padding-right">地址：</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address" value="${userInfo.address}" placeholder="地址">
                                </div>
                             </div>
                           <div class="form-group">
                             </div>
                        </form>
                      
                     
                      <button type="submit" id="alter"  class="btn btn-palegreen" style="margin-left: 133px;">提交</button>
                 
                    </div>
                </div>
            </div>
        </div>
</rapid:override>
<rapid:override name="js">
<script type="text/javascript">
		$(function() {
			$('#alter').click(function(){
				$.ajax({
					type:'post',
					url:'alter.do',
					data:$("#form_alter").serialize(),
					dataType:'json',
					success:function(obj){
						if(obj){
							if(obj.code==0){
								 Notify(obj.msg, 'top-right', '1000', 'success', 'fa-check');
		                         setTimeout(function(){
		    						},200);
							}else{
								Notify(obj.msg, 'top-right', '1000', 'danger', 'fa-check');
		                         setTimeout(function(){
		    						},200);
							}
						}
					}
				});
			});
		});
		
</script>
</rapid:override>
<%@ include file="/homeBase.jsp" %> 
