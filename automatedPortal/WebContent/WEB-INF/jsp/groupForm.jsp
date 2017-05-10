<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add a Group</title>
	<link rel="stylesheet" href="css/asap.css">
</head>
<body>
	<%@include file="aboutASAP.jsp"%><br/><br/>
	<fieldset>
		<legend class="heading">Add a Group</legend>
		<form:form commandName="group" action="CreateGroup.action">
		<table cellspacing="4" cellpadding="4">
			<tr>
				<td rowspan="3" valign="top"><img alt="login" src="images/group.png"/></td>
				<td class="label">Name of the Group&nbsp;</td>
				<td>
					<form:input path="name" cssClass="control"/>
				</td>
				<td>
					<form:errors path="name" cssClass="errClass"/>
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<input type="submit" name="command" value="Save" class="control"/>
					<input type="button" value="Cancel" onclick="location.href='<%= "AdminHome.action" %>'" class="control"/>			
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="errClass" align="center">${requestScope.message}</td>
			</tr>
		</table>
		</form:form>
	</fieldset>
</body>
</html>