<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>View Assessment Reports</title>
	<link rel="stylesheet" href="css/asap.css">
</head>
<body>
	<%@include file="aboutASAP.jsp"%><br/><br/>
	<fieldset>
		<legend class="heading">View Assessment Reports</legend>
		<form:form commandName="assessmentSchedule" action="ViewAssessmentReports.action">
		<table cellspacing="4" cellpadding="4">
			<tr>
				<td rowspan="4" valign="top"><img alt="reports" src="images/reports.png"/></td>
				<td class="label">Assessment&nbsp;</td>
				<td>
					<form:select path="problem.problemId" id="problemId" cssClass="control">
                		<form:options items="${problems}" cssClass="control"/>
            		</form:select>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label">Start Date (dd-mm-yyyy)&nbsp;</td>
				<td>
					<form:input path="startDate" id="startDate" cssClass="control"/>
				</td>
				<td><form:errors path="startDate" cssClass="errClass"/></td>
			</tr>
			<tr>
				<td class="label">End Date (dd-mm-yyyy)&nbsp;</td>
				<td>
					<form:input path="endDate" id="endDate" cssClass="control"/>
				</td>
				<td><form:errors path="endDate" cssClass="errClass"/></td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<input type="submit" name="assessmentReport" value="View Report" class="control"/>
					<input type="button" value="Cancel" onclick="location.href='<%="AdminHome.action"%>'" class="control"/>
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