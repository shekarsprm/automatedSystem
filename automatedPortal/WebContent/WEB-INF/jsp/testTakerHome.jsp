<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ASAP - Home - Test Taker</title>
	<link rel="stylesheet" href="css/asap.css">
</head>
<body>
<%
	String user = (String) session.getAttribute("user");
	if (user != null || !"".equals(user)) {
%>
 	<%@include file="aboutASAP.jsp"%><br/><br/>
	<fieldset>
	<legend class="heading">Welcome ${sessionScope.user}</legend>
	<table cellspacing="5" cellpadding="5">
		<tr>
			<td><img src="images/assignment.png"/></td>
			<td class="label"><a href="ViewAssignedAssessment.action">View Assigned Assessments</a></td>
			<td rowspan="3" width="40px">&nbsp;</td>
			<td><img src="images/logout.png"/></td>
			<td class="label"><a href="Logout.action" onclick="timedRefresh(2)">Logout</a></td>
		</tr>
		<tr>
			<td colspan="8" align="center"><span class="errClass">${requestScope.message}</span></td>
		</tr>
	</table>
	</fieldset>
<%} else {%>
	<jsp:forward page="index.jsp"/>
<%} %>
</body>
</html>