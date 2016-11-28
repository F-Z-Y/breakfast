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
	<li><i class="fa fa-home"></i> <a href="#">用户</a></li>
	<li class="active">用户添加</li>
</rapid:override>

<rapid:override name="header-title">
 用户添加
</rapid:override>

<rapid:override name="content">
	<div class="col-xs-12 col-md-12">
		<div class="well with-header">
			<div class="header bg-blue">用户添加</div>
			<div class="btn-group">
                <a href="<%=request.getContextPath()%>/admin/user.do" class="btn btn-default btn-add">
                    <i class="fa fa-chevron-left"></i> 返回
                </a>
            </div>

            <form id="population_info" class="form-horizontal" style="padding:20px;">
                <!--第1行-->
                <div class="row">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">用户名称:<span style="color:#f00">*</span></label>
                        <div class="col-sm-7">
                            <input maxlength="50" type="text" placeholder="请输入用户名称" name="name" class="form-control" id="name"/>
                        </div>
                        <label id="name-error" class="error" for="name">用户名称不能为空</label>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">用户地址:<span style="color:#f00">*</span></label>
                        <div class="col-sm-7">
                            <input maxlength="50" type="text" placeholder="请输入用户地址" name="address" class="form-control" id="address"/>
                        </div>
                        <label id="address-error" class="error" for="address">用户地址不能为空</label>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">联系方式:<span style="color:#f00">*</span></label>
                        <div class="col-sm-7">
                            <input maxlength="20" type="text" placeholder="请输入联系方式" name="phone" class="form-control" id="phone"/>
                        </div>
                        <label id="phone-error" class="error" for="phone">联系方式不能为空</label>
                    </div>
                                    </div>
                <div class="row" style="margin-top:50px;">
                    <div class="col-md-1 col-md-offset-5">
                        <button class="btn btn-primary btn-lg" id="user_set" type="button">
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
	            $("#user_set").click(function(){
	                post = true;
	                var name = get_data($("#name"),false,true,'name-error');
	                var address = get_data($("#address"),false,true,'address-error');
	                var phone = get_data($("#phone"),false,true,'phone-error');
	                if(!post){
	                    return;
	                }
	                $(this).attr('disabled',true);
	                $.ajax({
	                    type: "post",
	                    url: '<%=request.getContextPath()%>/add_user',
	                    data: {
	                        name:name,
	                        address:address,
	                        phone:phone,
	                    },
	                    success: function (data) {
	                    	data = eval("("+data+")");
	                        if (data.code==0) {
	                            Notify("ok", 'top-right', '3000', 'success', 'fa-check');
	                            setTimeout(function(){
	                            	<%-- var url = "<%=request.getContextPath()%>/admin/sellerinfo.do?user_info="+data.msg; --%>
	                                var url = "<%=request.getContextPath()%>/admin/user.do";
	                            	window.location.href=url;
	                            },1000)
	                        }else{
	                            Notify("flase", 'top-right', '3000', "danger", 'fa-edit');
	                            $("#user_set").attr('disabled',false);
	                        }
	                    },
	                    error:function(data){
	                    	Notify("系统错误，请重试！", 'top-right', '3000', "danger", 'fa-edit');
                            $("#user_set").attr('disabled',false);
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