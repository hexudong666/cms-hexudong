<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form class="form-inline" id="queryForm">
	<div class="form-group mx-sm-3 mb-2">
		<input type="text" class="form-control" id="text" name="text" value="${link.text }" placeholder="请输入名称">
	</div>
	<input type="hidden" id="pageNum" name="pageNum" value="${pageInfo.pageNum }">
	<button type="button" class="btn btn-primary mb-2" onclick="query();">查询</button>
</form>
<table class="table">
	<thead>
		<tr>
			<th scope="col"><input type="checkbox" id="chkALL"></th>
			<th scope="col">#</th>
			<th scope="col">名称</th>
			<th scope="col">链接</th>
			<th scope="col">创建时间</th>
			<th scope="col">操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pageInfo.list }" var="item">
			<tr>
				<th scope="col"><input type="checkbox" value="${item.id }" name="chk_list"></th>
				<th scope="col">${item.id }</th>
				<th scope="row">${item.text }</th>
				<td>${item.url }</td>
				<td><fmt:formatDate value="${item.created }" pattern="yyyy-MM-dd"/> </td>
				<td><input type="button" class="btn btn-primary" onclick="update(${item.id})" value="修改"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="row">
	<div class="col-3">
		<button type="button" class="btn btn-primary mb-2" onclick="add();">添加</button>
	</div>
	<div class="col-9">
		<jsp:include page="../common/page.jsp"></jsp:include>
	</div>
</div>
<div class="alert alert-success" role="alert" style="display: none"></div>

<script type="text/javascript" src="/public/js/checkbox.js" ></script>

<script type="text/javascript">
	function add(){
		openPage('/admin/link/add');
	}
	
	function query(){
		var params = $("#queryForm").serialize();
		reload(params)
	}
	
	function gotoPage(pageNum){
		$("#pageNum").val(pageNum);
		query();
	}
	
	function update(id){
		console.log(id);
		openPage('/admin/link/add?id='+id);
		/* $.post('/admin/updateLocked',{id:id},function(res){
			if(res.result){
				query();
			}
		}) */
	}
	
</script>
