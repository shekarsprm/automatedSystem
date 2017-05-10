<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Assessment Report</title>
	<link rel="stylesheet" href="css/asap.css">
</head>
<body>
 	<%@include file="aboutASAP.jsp"%><br/><br/>
	<fieldset>
		<legend class="heading">Assessment Report</legend>
		<table border="1" cellpadding="8" cellspacing="0">
			<tr>
				<td class="label">Assessment Name</td>
				<td class="control" colspan="3">${requestScope.reports[0].problem.name }</td>
			</tr>
			<tr>
				<td class="label">Date Range</td>
				<td class="control" colspan="3">from <i>${requestScope.assessmentSchedule.startDate}</i> to <i>${requestScope.assessmentSchedule.endDate}</i></td>
			</tr>
			<tr>
				<td class="label">Number Of Matches</td>
				<td class="control" colspan="3">${requestScope.numberOfMatches }</td>
			</tr>
			<tr bgcolor="lightblue">
				<th class="label">Name</th>
				<th class="label">Test Date</th>
				<th class="label">Score</th>
			</tr>
			<c:forEach items="${requestScope.reports}" var="report">
				<tr>
					<td class="control">${report.candidate.name }</td>
					<td class="control">${report.solution.submittedOn }</td>
					<td class="control">${report.score.totalScore }</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" value="Cancel" onclick="location.href='<%="AdminHome.action"%>'" class="control" />
	</fieldset>
</body>
</html>