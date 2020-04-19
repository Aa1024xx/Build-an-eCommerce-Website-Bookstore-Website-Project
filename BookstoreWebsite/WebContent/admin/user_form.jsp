<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New User</title>
    <link rel="stylesheet" href="../css/style.css" >
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">
		<c:if test="${user != null}">Edit User</c:if>
		<c:if test="${user == null}">Create New User</c:if>
		</h2>
	</div>

	<div align="center">
	<c:if test="${user != null}">
	<form action="update_user" method="post" id="userForm">
	<input type="hidden" name="userId" value="${user.userId}">
	</c:if>
	<c:if test="${user == null}">
	<form action="create_user" method="post" id="userForm">
	</c:if>
	
		<table class="form">
			<tr>
				<td align="right">Email:</td>
				<td align="left"><input type="text" id="email" name="email" size="20" value="${user.email}"/></td>
			</tr>
			<tr>
				<td align="right">Full name:</td>
				<td align="left"><input type="text" id="fullname" name="fullname" size="20" value="${user.fullName}" /></td>
			</tr>
			<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" id="password" name="password" size="20" value="${user.password}"/></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
			   <td colspan="2" align="center">
			      <button type="submit">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;
			      <input type="button" id="buttonCancel" value="Cancel" />
			   </td>
			</tr>
		</table>
		</form>
	</div>


	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">

$(document).ready(function(){
	$("#userForm").validate({
		rules: {
			email: {
				required: true,
				email: true
			},
			fullname: "required",
			password:"required",
		},
		messages: {
			email: {
				required: "Please enter email",
				email: "Please enter an valid email address"
			},
			fullname: "Please enter full name",
			password:"Please enter password"
		}
	});
	
	$("#buttonCancel").click(function(){
		history.go(-1);
	});
});

</script>

</html>