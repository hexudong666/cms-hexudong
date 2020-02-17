<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="saveForm">
	<input type="hidden" id="id" name="id" value="${link.id }">
	<div class="form-group row">
		<label for="inputEmail3" class="col-sm-2 col-form-label">链接名称</label>
		<div class="col-sm-5">
			<input type="email" class="form-control" id="text" name="text" value="${link.text }">
		</div>
	</div>
	
	<div class="form-group row">
		<label for="inputEmail3" class="col-sm-2 col-form-label">链接地址</label>
		<div class="col-sm-5">
			<input type="email" class="form-control" id="url" name="url" value="${link.url }">
		</div>
	</div>
	
	<button type="button" class="btn btn-primary mb-2" onclick="save();">保存</button>
	<div class="alert alert-success" role="alert" style="display: none"></div>
</form>

<script type="text/javascript">
	
	function save(){
		$.post("/admin/link/save",$("#saveForm").serialize(),function(res){
			if(res.result){
				$(".alert").html("保存成功");
				reload();
			}
		})
		
	}
</script>