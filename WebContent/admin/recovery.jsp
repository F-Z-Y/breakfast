<%@page import="com.fxb.breakfast.model.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="css">
	<link
		href="<%=request.getContextPath()%>/assets/css/dataTables.bootstrap.css"
		rel="stylesheet" type="text/css">
		<style>
			.seller_info_a,.good_info_a{
				cursor: pointer;
			}
		</style>
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
			<div class="header bg-blue">商品表</div>
			<table class="table table-hover" id="editabledatatable">
				<thead class="bordered-darkorange">
					<tr>
						<th>#</th>
						<th>商品名称</th>
						<th>所属商店</th>
						<th>价格</th>
						<th>销量</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<Product> listn = (List<Product>) request.getAttribute("recoveryList");
							for (int i = 0; i < listn.size(); i++) {
					%>
					<tr>
						<td><%=listn.get(i).getId()%></td>
						<td><a v_id="<%=listn.get(i).getSellerId()%>" class="good_info_a" ><%=listn.get(i).getProductName()%></a></td>
						<td><a v_id="<%=listn.get(i).getId()%>" class="seller_info_a" ><%=listn.get(i).getSellerName()%></a></td>
						<td><%=listn.get(i).getPice()%></td>
						<td><%=listn.get(i).getMark()%></td>
						<td><a v_id="<%=listn.get(i).getId()%>" class='btn btn-info btn-xs recovery_good'>
								<i class='fa fa-edit'></i>恢复上架
						</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>

	</div>
</rapid:override>
<rapid:override name="js">
	<script
		src="<%=request.getContextPath()%>/assets/js/datatable/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/datatable/dataTables.bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootbox/bootbox.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/toastr/toastr.js"></script>
	<script>
		$(function() {
			$(".good_info_a").click(function(){
				var obj_id = $(this).attr('v_id');
				var url = "<%=request.getContextPath()%>/admin/goodinfo.do?good_info="+obj_id;
				window.open(url);
			})
			$(".seller_info_a").click(function(){
				var obj_id = $(this).attr('v_id');
				var url = "<%=request.getContextPath()%>/admin/sellerinfo.do?seller_info="+obj_id;
				window.open(url);
			})
			$("#editabledatatable").dataTable({
				"sDom" : "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
				"iDisplayLength" : 10,
				//"aaSorting": [[4, 'false']],
				columnDefs : [ {
					orderable : false,//禁用排序
					targets : [ 0, 5 ]//指定的列
				} ],
				"language" : {
					"sProcessing" : "正在加载数据...",
					"sZeroRecords" : "没有您要搜索的内容",
					"sInfo" : "从_START_ 到 _END_ 条记录　总记录数为 _TOTAL_ 条",
					"sInfoEmpty" : "记录数为0",
					"sInfoFiltered" : "(全部记录数 _MAX_  条)",
					"sInfoPostFix" : "",
					"search" : "",
					"sLengthMenu" : "_MENU_",
					"oPaginate" : {
						"sPrevious" : "上一页",
						"sNext" : "下一页"
					}
				},
			});
			$(".recovery_good").click(function(){
				var obj_id = $(this).attr("v_id");
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
                    message: '你确定要恢复吗？',
                    callback: function (result) {
                        if (result) {
            				$.post(
            						"<%=request.getContextPath()%>/recovery_good",
            						{
            							id:obj_id
            						},
            						function(data){
            							data = eval("("+data+")");
            							if (data.code==0) {
                                            Notify('操作成功', 'top-right', '3000', 'success', 'fa-check');
                                            setTimeout(function(){
    											location.reload();	
    										},1000)
            							}else{
                                            Notify('操作失败，请重试！', 'top-right', '3000', 'danger', 'fa-check');
                                        }
            						}
            					)
                        } else {

                        }
                    },
                    title: "确认信息"
                });
			})
		})
	</script>
</rapid:override>
<%@ include file="/base.jsp"%>