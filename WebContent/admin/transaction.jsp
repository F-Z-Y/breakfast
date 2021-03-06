<%@page import="com.fxb.breakfast.model.Transaction"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>

<rapid:override name="css">
	<link
		href="<%=request.getContextPath()%>/assets/css/dataTables.bootstrap.css"
		rel="stylesheet" type="text/css">
</rapid:override>
<rapid:override name="page-title">
	<li><i class="fa fa-home"></i> <a href="#">充值/退款</a></li>
	<li class="active">
		<% if((int)request.getAttribute("status")==1){ %>
			用户充值
		<% }else{ %>
			用户退款
		<%} %>
	</li>
</rapid:override>

<rapid:override name="header-title">
<% if((int)request.getAttribute("status")==1){ %>
	用户充值
<% }else{ %>
	用户退款
<%} %>
</rapid:override>

<rapid:override name="content">
	<div class="col-xs-12 col-md-12">
		<div class="well with-header">
			<div class="header bg-blue">信息列表</div>
			<table class="table table-hover" id="editabledatatable">
				<thead class="bordered-darkorange">
					<tr>
						<th>#</th>
						<th>用户账号</th>
						<th>用户名</th>
						<th>金额（元）</th>
						<th>用户联系方式</th>
						<th>当前状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<Transaction> listn = (List<Transaction>) request.getAttribute("transaction");
							for (int i = 0; i < listn.size(); i++) {
					%>
					<tr>
						<td><%=listn.get(i).getId()%></td>
						<td><%=listn.get(i).getAccount()%></td>
						<td><%=listn.get(i).getName()%></td>
						<td><%=listn.get(i).getMoney()%></td>
						<td><%=listn.get(i).getPhone()%></td>
						<td><%=listn.get(i).getStatusInfo()%></td>
						<td v_obj=<%=listn.get(i).getId()%>>
						<%if(listn.get(i).getStatus()==0){ %>
							<a class='btn btn-warning btn-xs money_yes'> <i class='fa fa-edit'></i>收到转账</a>
						<%}else{%>
							已成功充值
						<%} %>
						</td>
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
			$("#editabledatatable").dataTable({
				"sDom" : "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
				"iDisplayLength" : 10,
				"aaSorting": [[0, 'false']],
				columnDefs : [ {
					orderable : false,//禁用排序
					targets : [ 0, 6 ]//指定的列
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
			/* $(".money_no").click(function(){
				var obj_id = $(this).parents("td").attr("v_obj");
				set_apply(obj_id,1);
			}) */
			
			$(".money_yes").click(function(){
				var obj_id = $(this).parents("td").attr("v_obj");
				set_apply(obj_id,0);
			})
			function set_apply(obj_id,status){
				console.log(obj_id);
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
                    message: '确认操作？',
                    callback: function (result) {
                        if (result) {
            				$.post(
            						"<%=request.getContextPath()%>/set_apply",
            						{
            							id:obj_id,
            							status:status
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
			}
			
		})
	</script>
</rapid:override>
<%@ include file="/base.jsp"%>