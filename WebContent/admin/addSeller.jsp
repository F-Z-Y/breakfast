<%@page import="com.fxb.breakfast.model.SellerInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="css">
	<style>
		.error{color:#f45551;display: none;line-height: 34px;margin-bottom: 0px;}
		textarea{resize:none;}
	</style>
</rapid:override>
<rapid:override name="page-title">
	<li><i class="fa fa-home"></i> <a href="#">商铺</a></li>
	<li class="active">商铺添加</li>
</rapid:override>

<rapid:override name="header-title">
 商铺添加
</rapid:override>

<rapid:override name="content">
	<div class="col-xs-12 col-md-12">
		<div class="well with-header">
			<div class="header bg-blue">商铺添加</div>
			<div class="btn-group">
                <a href="<%=request.getContextPath()%>/admin/seller.do" class="btn btn-default btn-add">
                    <i class="fa fa-chevron-left"></i> 返回
                </a>
            </div>

			<%
				SellerInfo info = (SellerInfo) request.getAttribute("sellerInfo");
			%>

			<form id="population_info" class="form-horizontal" style="padding:20px;">
                <!--第1行-->
                <div class="row">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">商铺名称:<span style="color:#f00">*</span></label>
                        <div class="col-sm-7">
                            <input maxlength="50" value='<%=info.getName()!=null?info.getName():""%>' type="text" placeholder="请输入商铺名称" name="name" class="form-control" id="name"/>
                        </div>
                        <label id="name-error" class="error" for="name">商铺名称不能为空</label>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">商铺地址:<span style="color:#f00">*</span></label>
                        <div class="col-sm-7">
                            <input maxlength="50" value='<%=info.getAddress()!=null?info.getAddress():""%>' type="text" placeholder="请输入商铺地址" name="address" class="form-control" id="address"/>
                        </div>
                        <label id="address-error" class="error" for="address">商铺地址不能为空</label>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">联系方式:<span style="color:#f00">*</span></label>
                        <div class="col-sm-7">
                            <input maxlength="20"value='<%=info.getPhone()!=null?info.getPhone():""%>' type="text" placeholder="请输入联系方式" name="phone" class="form-control" id="phone"/>
                        </div>
                        <label id="phone-error" class="error" for="phone">联系方式不能为空</label>
                    </div>
                    <div class="form-group">
                        <label for="introduction" class="col-sm-2 control-label">商铺简介:<span style="color:#f00">*</span></label>
                        <div class="col-sm-7">
                        	<textarea class="form-control" id="introduction" name="introduction" placeholder="请输入商铺简介(150字以内)" maxlength="150"><%=info.getIntroduction()!=null?info.getIntroduction():""%></textarea>
                        </div>
                        <label id="introduction-error" class="error" for="introduction">商铺简介不能为空</label>
                    </div>
                </div>
                <div class="row" style="margin-top:50px;">
                    <div class="col-md-1 col-md-offset-5">
                        <button class="btn btn-primary btn-lg" obj_id="<%=info.getId()!=0?info.getId():0%>" id="seller_set" type="button">
                            <i class="fa fa-save"></i>保存
                        </button>
                    </div>
                </div>
            </form>
		</div>
	</div>
</rapid:override>
<rapid:override name="js">
<script src="<%=request.getContextPath()%>/assets/js/toastr/toastr.js"></script>
	<script>
		$(function(){
			var post = false;
			var obj_id =  $("#seller_set").attr("obj_id");
			var url = "<%=request.getContextPath()%>/add_seller";
			$("#seller_set").click(function(){
	                post = true;
	                var name = get_data($("#name"),false,true,'name-error');
	                var address = get_data($("#address"),false,true,'address-error');
	                var phone = get_data($("#phone"),false,true,'phone-error');
	                var introduction = get_data($("#introduction"),false,true,'introduction-error');
	                var seller_data = {name:name,address:address,phone:phone,introduction:introduction,};
	                if(!post){
	                    return;
	                }else{
	                	if(obj_id!=0){
	        				url = "<%=request.getContextPath()%>/save_seller";
	        				seller_data.obj_id = obj_id;
	        			}
	                }
	                $(this).attr('disabled',true);
	                $.ajax({
	                    type: "post",
	                    url: url,
	                    data: seller_data,
	                    success: function (data) {
	                    	data = eval("("+data+")");
	                        if (data.code==0) {
	                            Notify("ok", 'top-right', '3000', 'success', 'fa-check');
	                            setTimeout(function(){
	                            	var url = "<%=request.getContextPath()%>/admin/sellerinfo.do?seller_info="+data.msg;
	                                window.location.href=url;
	                            },1000)
	                        }else{
	                            Notify("flase", 'top-right', '3000', "danger", 'fa-edit');
	                            $("#seller_set").attr('disabled',false);
	                        }
	                    },
	                    error:function(data){
	                    	Notify("系统错误，请重试！", 'top-right', '3000', "danger", 'fa-edit');
                            $("#seller_set").attr('disabled',false);
	                    }
	                });
	            })
			/**
             * 获取数据并验证
             * @param obj
             * @param check
             * @param must 是否必须
             * @param hint 提示信息
             * @returns {string|*}
             */
            function get_data(obj,check,must,hint){
                var get_data = $.trim(obj.val());
                if(must){
                    if(get_data!=''){
                        $("#"+hint).hide();
                    }else{
                        post = false;
                        $("#"+hint).show();
                    }
                }
                if(get_data!=''&&check){
                    var condition = new RegExp(check);
                    if(!condition.test(get_data)){
                        post = false;
                        $("#"+hint).show();
                    }else{
                        $("#"+hint).hide();
                    }
                }
                return get_data;
            }
		})
	</script>
</rapid:override>
<%@ include file="/base.jsp"%>