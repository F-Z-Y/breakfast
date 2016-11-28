<%@page import="com.fxb.breakfast.model.GoodInfo"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="css">

</rapid:override>
<rapid:override name="page-title">
	<li><i class="fa fa-home"></i> <a href="#">商品</a></li>
	<li class="active">商品管理</li>
</rapid:override>

<rapid:override name="header-title">
 商品管理
</rapid:override>

<rapid:override name="content">
	<div class="col-xs-12 col-md-12">
		<div class="well with-header">
			<div class="header bg-blue">商品详情</div>
			<%
				GoodInfo info = (GoodInfo) request.getAttribute("goodInfo");
			%>
			<%
				if (info != null) {
			%>
			<div class="row">
				<div class="col-lg-12 col-sm-12 col-xs-12">
					<div
						class="databox databox-xlg databox-halved radius-bordered databox-shadowed databox-vertical">
						<div class="databox-top bg-white padding-10">
							<div class="col-lg-4 col-sm-4 col-xs-4">
								<img src="<%=info.getPhoto()%>"
									style="width: 75px; height: 75px;"
									class="image-circular bordered-3 bordered-palegreen">
							</div>
							<div
								class="col-lg-8 col-sm-8 col-xs-8 text-align-left padding-10">
								<span class="databox-header carbon no-margin"> <%=info.getName()%>
								</span> <span class="databox-text lightcarbon no-margin"> 店铺：<%=info.getSeller_name()%>
								</span>
							</div>
						</div>
						<div class="databox-bottom bg-white no-padding">
							<div class="databox-row row-12">
								<div class="databox-row row-6 no-padding">
									<div
										class="databox-cell cell-4 no-padding text-align-center bordered-right bordered-platinum">
										<span class="databox-text sonic-silver  no-margin">价格</span> <span
											class="databox-number lightcarbon no-margin"><%=info.getPrice()%></span>
									</div>
									<div
										class="databox-cell cell-4 no-padding text-align-center bordered-right bordered-platinum">
										<span class="databox-text sonic-silver no-margin">销量</span>
										<span class="databox-number lightcarbon no-margin"><%=info.getVolume()%></span>
									</div>
									<div class="databox-cell cell-4 no-padding text-align-center">
										<span class="databox-text sonic-silver no-margin">状态</span> <span
											class="databox-number lightcarbon no-margin"><%=info.getStatus_info()%></span>
									</div>
								</div>
								<div class="databox-row row-6 padding-10">
									<input type="hidden" id="obj_id" value="<%=info.getId() %>">
									<%
										if (info.getStatus() == 0) {
									%>
									<button class="btn btn-palegreen btn-sm pull-right good_del">强制下架</button>
									<%
										} else {
									%>
									<button
										class="btn btn-palegreen btn-sm pull-right recovery_good">取消下架</button>
									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</rapid:override>
<rapid:override name="js">
	<script
		src="<%=request.getContextPath()%>/assets/js/bootbox/bootbox.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/toastr/toastr.js"></script>
	<script>
		$(function() {
			var obj_id = $("#obj_id").val();
			$(".good_del").click(function(){
				bootbox.confirm({
                    buttons: {
                        confirm: {
                            label: '确定',
                            className: 'btn-primary'
                        },
                        cancel: {
                            label: '取消',
                            className: 'btn-default'
                        }
                    },
                    message: '你确定要删除吗？',
                    callback: function (result) {
                        if (result) {
            				$.post(
           						"<%=request.getContextPath()%>/delete_good",
								{
									id : obj_id
								},
								function(
										data) {
									data = eval("("
											+ data
											+ ")");
									if (data.code == 0) {
										Notify(
												'删除成功',
												'top-right',
												'3000',
												'success',
												'fa-check');
										setTimeout(function(){
											location.reload();	
										},1000)
									} else {
										Notify(
												'删除失败，请重试！',
												'top-right',
												'3000',
												'danger',
												'fa-check');
									}
								})
							} else {

							}
						},
						title : "确认信息"
					});
				})
			$(".recovery_good").click(function(){
				bootbox.confirm({
                    buttons: {
                        confirm: {
                            label: '确定',
                            className: 'btn-primary'
                        },
                        cancel: {
                            label: '取消',
                            className: 'btn-default'
                        }
                    },
                    message: '你确定要操作吗？',
                    callback: function (result) {
                        if (result) {
            				$.post(
           						"<%=request.getContextPath()%>/recovery_good",
								{
									id : obj_id
								},
								function(data) {
									data = eval("("+ data + ")");
									if (data.code == 0) {
										Notify(
												'操作成功',
												'top-right',
												'3000',
												'success',
												'fa-check');
										setTimeout(function(){
											location.reload();	
										},1000)
									} else {
										Notify(
												'操作失败，请重试！',
												'top-right',
												'3000',
												'danger',
												'fa-check');
									}
								})
						} else {

						}
					},
					title : "确认信息"
				});
			})
		})
	</script>
</rapid:override>
<%@ include file="/base.jsp"%>