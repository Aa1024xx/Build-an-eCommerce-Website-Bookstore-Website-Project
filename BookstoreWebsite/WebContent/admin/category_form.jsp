<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
     <link rel="stylesheet" href="../css/style.css" >
     <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
     <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<title>
<c:if test="${category != null}">Edit Category</c:if> 
<c:if test="${category == null}">Create New Category</c:if>
</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${category != null}">Edit Category</c:if>
			<c:if test="${category == null}">Create New Category</c:if>
		</h2>
	</div>

	<div align="center">
		<c:if test="${category != null}">
			<form action="update_category" method="post" id="categoryForm">
				<input type="hidden" name="categoryId"
					value="${category.categoryId}">
		</c:if>
		<c:if test="${category == null}">
			<form action="create_category" method="post" id="categoryForm">
		</c:if>
		<table class="form">
			<tr>
				<td align="right">Name:</td>
				<td align="left"><input type="text" id="name" name="name"
					size="20" value="${category.name}" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;
			    <button id="buttonCancel">Cancel</button>
			</tr>
		</table>
		</form>
	</div>


	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	
$(document).ready(function(){
	$("#categoryForm").validate({
		rules: {
			name: "required",
		},
		messages: {
			name: "Please enter category name",
		}
	});
	
	$("#buttonCancel").click(function(){
		history.go(-1);
	});
});
	
</script>

</html>