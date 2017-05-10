<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add an Assessment</title>
	<link rel="stylesheet" href="css/asap.css">
</head>
<body>
	<%@include file="aboutASAP.jsp"%><br/><br/>
	<fieldset>
		<legend class="heading">Add an Assessment</legend>
		<form:form commandName="problem" action="AddProblem.action">
		<table cellspacing="4" cellpadding="4">
			<tr>
				<td rowspan="6" valign="top"><img alt="assessment" src="images/assessment.png"/></td>
				<td class="label">Title&nbsp;</td>
				<td>
					<form:input path="name" cssClass="control"/>
				</td>
				<td>
					<form:errors path="name" cssClass="errClass" />
				</td>
			</tr>
			<tr>
				<td class="label" valign="top">Description&nbsp;</td>
				<td>
					<form:textarea path="description" rows="3" cols="40" cssClass="control"/>
				</td>
				<td>
					<form:errors path="description" cssClass="errClass" />
				</td>
			</tr>
			<tr>
				<td class="label" valign="top">Description of the Input&nbsp;</td>
				<td>
					<form:textarea path="input" rows="3" cols="40" cssClass="control"/>
				</td>
				<td>
					<form:errors path="input" cssClass="errClass"/>
				</td>
			</tr>
			<tr>
				<td class="label" valign="top">Description of the Output&nbsp;</td>
				<td>
					<form:textarea path="output" rows="3" cols="40" cssClass="control"/>
				</td>
				<td>
					<form:errors path="output" cssClass="errClass" />
				</td>
			</tr>
			<tr>
				<td class="label">Time Limit (in minutes)&nbsp;</td>
				<td>
					<form:input path="timeLimit" cssClass="control"/>
				</td>
				<td>
					<form:errors path="timeLimit" cssClass="errClass"/>
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<input type="submit" name="command" value="Save" class="control" />
					<input type="button" value="Cancel" onclick="location.href='<%="AdminHome.action"%>'" class="control" />
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="errClass" align="right" colspan="2">${requestScope.message}</td>
			</tr>
		</table>
		</form:form>
	</fieldset>
</body>
</html>