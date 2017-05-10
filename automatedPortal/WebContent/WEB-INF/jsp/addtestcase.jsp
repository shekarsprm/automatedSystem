<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add a Test Case to an Assessment</title>
	<link rel="stylesheet" href="css/asap.css">
</head>
<body>
	<%@include file="aboutASAP.jsp"%><br/><br/>
	<fieldset>
		<legend class="heading">Add a Test Case to an Assessment</legend>
		<form:form commandName="testcase" action="AddTestCase.action">
		<table cellspacing="4" cellpadding="4">
			<tr>
				<td rowspan="6" valign="top"><img alt="testcase" src="images/testcase.png"/></td>
				<td class="label">Assessment&nbsp;</td>
				<td>
					<form:select path="problem.problemId" cssClass="control">
                		<form:options items="${problems}" cssClass="control"/>
            		</form:select>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label" valign="top">Description&nbsp;</td>
				<td>
					<form:textarea path="testCaseDescription" rows="2" cols="40" cssClass="control"/>
				</td>
				<td>
					<form:errors path="testCaseDescription" cssClass="errClass"/>
				</td>
			</tr>
			<tr>
				<td class="label" valign="top">Input&nbsp;</td>
				<td>
					<form:textarea path="inputData" rows="2" cols="40" cssClass="control"/>
				</td>
				<td>
					<form:errors path="inputData" cssClass="errClass"/>
				</td>
			</tr>
			<tr>
				<td class="label" valign="top">Expected Output&nbsp;</td>
				<td>
					<form:textarea path="expectedOutput" rows="2" cols="40" cssClass="control"/>
				</td>
				<td>
					<form:errors path="expectedOutput" cssClass="errClass"/>
				</td>
			</tr>
			<tr>
				<td class="label">Score&nbsp;</td>
				<td>
					<form:input path="score" cssClass="control"/>
				</td>
				<td>
					<form:errors path="score" cssClass="errClass"/>
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<input type="submit" name="testCaseSubmission" value="Save" class="control"/>
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