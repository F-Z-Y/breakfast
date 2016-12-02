<%@page import="com.fxb.breakfast.model.Order"%>
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
	<li><i class="fa fa-home"></i> <a href="#">订单</a></li>
	<li class="active">订单列表</li>
</rapid:override>

<rapid:override name="header-title">
订单列表
</rapid:override>

<rapid:override name="content">
	<div class="col-xs-12 col-md-12">
		<div class="well with-header">
			<div class="header bg-blue">订单信息</div>
			<table class="table table-hover" id="editabledatatable">
				<thead class="bordered-darkorange">
					<tr>
						<th>#</th>
						<th>订单号</th>
						<th>用户账号</th>
						<th>用户真名</th>
						<th>商品名</th>
						<th>购买数量</th>
						<th>实付金额</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<Order> listn = (List<Order>) request.getAttribute("orderctList");
							for (int i = 0; i < listn.size(); i++) {
					%>
					<tr>
						<td><%=listn.get(i).getId()%></td>
						<td><%=listn.get(i).getOrderNum() %></td>
						<td><%=listn.get(i).getAcconut() %></td>
						<td><%=listn.get(i).getUserName() %></td>
						<td><a v_id="<%=listn.get(i).getGoodId()%>" class="good_info_a" ><%=listn.get(i).getGoodName() %></a></td>
						<td><%=listn.get(i).getNum() %></td>
						<td><%=listn.get(i).getMoney() %></td>
						<td><%=listn.get(i).getStatusInfo() %></td>
						<%-- <td><a class='btn btn-warning btn-xs' href='<%=request.getContextPath()%>/admin/addseller.do?seller=<%=listn.get(i).getId()%>'>
								<i class='fa fa-edit'></i>编辑
						</a>&nbsp <a v_id="<%=listn.get(i).getId() %>" class='btn btn-danger btn-xs good_del'> <i
								class='fa fa-trash-o'></i>删除
						</a></td> --%>
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
	<script>
		$(function() {
			$(".good_info_a").click(function(){
				var obj_id = $(this).attr('v_id');
				var url = "<%=request.getContextPath()%>/admin/goodinfo.do?good_info="+obj_id;
				window.open(url);
			})
			$("#editabledatatable").dataTable({
				"sDom" : "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
				"iDisplayLength" : 10,
				//"aaSorting": [[4, 'false']],
				/* columnDefs : [ {
					orderable : false,//禁用排序
					targets : [ 0, 5 ]//指定的列
				} ], */
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
		})
	</script>
</rapid:override>
<%@ include file="/base.jsp"%>