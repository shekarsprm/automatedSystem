<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/asap.css">
	<title>View Assigned Assessments</title>
</head>
<body>
 	<%@include file="aboutASAP.jsp"%><br/><br/>
	<fieldset>
	<legend class="heading">View Assigned Assessments</legend>
	<table cellspacing="5" cellpadding="5">
		<c:forEach items="${requestScope.assessmentSchedule}" var="assessmentSchedule">
		<tr>
			<td><img src="images/info.png"/></td>
			<td class="label" valign="center">
				<a href="ViewProblem.action?problemId=${assessmentSchedule.problem.problemId}">${assessmentSchedule.problem.name}</a>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td align="center">
				<input type="button" value="Cancel" onclick="location.href='<%="TestTakerHome.action"%>'" class="control"/>
			</td>
		</tr>
		<tr>
			<td align="center"><span class="errClass">${requestScope.message}</span></td>
		</tr>
	</table>
	</fieldset>
</body>
</html>