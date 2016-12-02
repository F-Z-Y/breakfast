<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="css">
	<style>
		.error{color:#f45551;display: none;line-height: 34px;margin-bottom: 0px;}
		textarea{resize:none;}
		#find_name,#find_address,#find_phone{line-height:34px;height:34x;display:inherit; }
	</style>
</rapid:override>
<rapid:override name="page-title">
	<li><i class="fa fa-home"></i> <a href="#">充值/退款</a></li>
	<li class="active">资产管理</li>
</rapid:override>

<rapid:override name="header-title">
资产管理
</rapid:override>

<rapid:override name="content">
	<div class="col-xs-12 col-md-12">
		<div class="well with-header">
			<div class="header bg-blue">验证 + 操作</div>
			<div class="btn-group">
                <a onclick="location.reload();" class="btn btn-default btn-add">
                    <i class="glyphicon glyphicon-refresh"></i>刷新
                </a>
            </div>

            <form class="form-horizontal" style="padding:20px;">
                <!--第1行-->
                <div class="row">
					<div class="form-group">
                        <label for="acconut" class="col-sm-2 control-label">用户账户:<span style="color:#f00">*</span></label>
                        <div class="col-sm-7">
							<div class="input-group">
								<input maxlength="16" type="text" placeholder="请输入用户账户" name="acconut" id="acconut" class="form-control"> 
								<span class="input-group-btn">
									<button class="btn btn-default check" type="button">验证</button>
								</span>
							</div>
                        </div>
                        <label id="acconut-error" class="error" for="acconut">用户不存在</label>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">用户姓名:</label>
                        <div class="col-sm-7">
                        	<span id="find_name"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">用户电话:</label>
                        <div class="col-sm-7">
                        	<span id="find_phone"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">用户地址:</label>
                        <div class="col-sm-7">
                        	<span id="find_address"></span>                        
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top:50px;">
                    <div class="form-group">
                        <label for="money" class="col-sm-2 control-label">资产矫正:<span style="color:#f00">*</span></label>
                        <div class="col-sm-7">
							<div class="input-group">
								<span class="input-group-addon">￥</span> 
								<input maxlength="9" type="number" placeholder="请输入用户资产" name="money" class="form-control" id="money"> 
								<!-- <span class="input-group-addon">.0</span> -->
							</div>
                        </div>
                        <label id="money-error" class="error" for="money">用户资产不能为空</label>
                    </div>
                </div>
                <div class="row" style="margin-top:50px;">
                    <div class="col-md-1 col-md-offset-5">
                        <button class="btn btn-primary btn-lg" disabled id="patri_set" type="button">
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
            /**
            * 用户验证
            */
            var obj_id=0;
            $(".check").click(function(){
            	var account = $.trim($("#acconut").val());
            	var check_url = "<%=request.getContextPath()%>/check_user";
            	$.post(
					check_url,
					{
						account : account
					}, 
					function(data) {
						data = eval("(" + data + ")");
						if (data.code == 0) {
							obj_id = data.data.id;
							$("#find_name").text(data.data.name);
							$("#find_phone").text(data.data.phone);
							$("#find_address").text(data.data.address);
							$("#money").val(data.data.money);
							$("#acconut-error").hide();
							$("#patri_set").attr("disabled",false);
						} else {
							$("#find_name").text("");
							$("#find_phone").text("");
							$("#find_address").text("");
							$("#money").val(null);
							$("#acconut-error").show();
							$("#patri_set").attr("disabled",true);
						}
					}
				)
			})
			$("#patri_set").click(function(){
				var money = $("#money").val();
				var set_url = "<%=request.getContextPath()%>/patri_correct";
				$(this).attr("disabled",true);
				if(obj_id==0){
					return;
				}
				$.post(
					set_url,
					{
						money : money,
						obj_id:obj_id
					}, 
					function(data) {
						data = eval("(" + data + ")");
						if (data.code == 0) {
							Notify("操作成功", 'top-right', '3000', 'success', 'fa-check');
						} else {
							Notify("系统出错，请重试！", 'top-right', '3000', 'danger', 'fa-edit');
							$(this).attr("disabled",false);
						}
					}
				)
			})
		})
	</script>
</rapid:override>
<%@ include file="/base.jsp"%>