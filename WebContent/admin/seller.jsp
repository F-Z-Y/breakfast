<%@page import="com.fxb.breakfast.model.Seller"%>
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
	<li><i class="fa fa-home"></i> <a href="#">商铺</a></li>
	<li class="active">商铺管理</li>
</rapid:override>

<rapid:override name="header-title">
 商铺管理
</rapid:override>

<rapid:override name="content">
	<div class="col-xs-12 col-md-12">
		<div class="well with-header">
			<div class="header bg-blue">商铺表</div>
			<table class="table table-hover" id="editabledatatable">
				<thead class="bordered-darkorange">
					<tr>
						<th>#</th>
						<th>账号</th>
						<th>店铺名</th>
						<th>联系方式</th>
						<th>营业额</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<Seller> listn = (List<Seller>) request.getAttribute("sellerList");
							for (int i = 0; i < listn.size(); i++) {
					%>
					<tr>
						<td><%=listn.get(i).getId()%></td>
						<td><%=listn.get(i).getAccount()%></td>
						<td><a v_id="<%=listn.get(i).getId()%>" class="seller_info_a" ><%=listn.get(i).getName()%></a></td>
						<td><%=listn.get(i).getPhone()%></td>
						<td><%=listn.get(i).getMoney()%></td>
						<td><a class='btn btn-warning btn-xs' href='<%=request.getContextPath()%>/admin/addseller.do?seller=<%=listn.get(i).getId()%>'>
								<i class='fa fa-edit'></i>编辑
						</a>&nbsp <a v_id="<%=listn.get(i).getId() %>" class='btn btn-danger btn-xs good_del'> <i
								class='fa fa-trash-o'></i>删除
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
			$(".good_del").click(function(){
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
                    message: '你确定要删除吗？',
                    callback: function (result) {
                        if (result) {
            				$.post(
            						"<%=request.getContextPath()%>/del_seller",
            						{
            							id:obj_id
            						},
            						function(data){
            							data = eval("("+data+")");
            							if (data.code==0) {
                                            Notify('删除成功', 'top-right', '3000', 'success', 'fa-check');
                                            setTimeout(function(){
    											location.reload();	
    										},1000)
                                        }else{
                                            Notify('删除失败，请重试！', 'top-right', '3000', 'danger', 'fa-check');
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