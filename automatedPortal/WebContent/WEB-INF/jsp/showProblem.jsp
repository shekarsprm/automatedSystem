<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@page import="com.iwt.nit.aws.model.Problem"%><html>
<%@page import="java.util.List"%>
<%@page import="com.iwt.nit.aws.model.TestCase"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Assessment Solution</title>
	<link rel="stylesheet" href="css/asap.css">
	<script type="text/javascript">
		var mins;
		var secs;
	
		function display(mins, secs) {
			var disp = "";
			if (mins <= 9) {
				disp = " 0";
			}
			disp += mins + ":";
			if (secs <= 9) {
				disp += "0" + secs;
			} else {
				disp += secs;
			}
			return (disp);
		}
	
		function timer() {
			secs--;
			if (secs == -1) {
				secs = 59;
				mins--;
			}
			document.ctimer.timer.value = display(mins, secs);
			if ((mins == 0) && (secs == 0)) {
				document.forms["code"].submit();
	
			} else {
				setTimeout("timer()", 1000);
			}
		}
	
		function start() {
			mins = document.ctimer.timer.value;
			secs = 01;
			timer();
		}
		window.onload = start;
	</script>
</head>
<body>
	<%@include file="aboutASAP.jsp"%><br/><br/>
	<fieldset>
		<legend class="heading">Assessment Solution: ${requestScope.problem.name }</legend>
		<form:form commandName="solution" id="code" action="SubmitSolution.action">
		<table cellspacing="4" cellpadding="4">
			<tr>
				<td rowspan="9" valign="top"><img alt="assignment" src="images/assignment.png"/></td>
				<td class="label">Title&nbsp;</td>
				<td class="control">
					${requestScope.problem.name}
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label">Description&nbsp;</td>
				<td class="control">
					${requestScope.problem.description}
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label">Input Description&nbsp;</td>
				<td class="control">
					${requestScope.problem.input}
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label">Output Description&nbsp;</td>
				<td class="control">
					${requestScope.problem.output}
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label">Time Duration (in minutes)&nbsp;</td>
				<td class="control">
					<form name="ctimer">
						<input type="text" size="2" style="color:red" name="timer" value="${requestScope.problem.timeLimit }" />
					</form>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label" valign="top">Source Code&nbsp;</td>
				<td class="control">
					<form:textarea path="sourceCode" cols="60" rows="15" cssClass="control"/>
					<form:hidden path="problem.problemId" value="${requestScope.problem.problemId}"/>
				</td>
				<td><form:errors path="sourceCode" cssClass="errClass"/></td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<!--<input type="submit" name="command" value="Save Solution"  class="control"/>-->
					<input type="submit" id="command" name="command" value="Compile & Execute" class="control"/>
					<input type="submit" id="submit" name="command" value="Submit Solution"  class="control"/>
					<input type="button" value="Cancel" onclick="location.href='<%="TestTakerHome.action"%>'" class="control"/>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label" valign="top">Compiler Output</td>
				<td class="control" valign="top">
					<% if (request.getAttribute("error") != null) { %>
						<span class="errClass">${requestScope.error}</span>
					<% } else { %>
						<span class="label">No Errors</span>
					<% } %>
				</td>
			</tr>
			<tr>
				<td class="label" valign="top">Test Case Status</td>
				<td class="control">
					<table border="1" cellspacing="2" cellpadding="0">
						<%
						    if (request.getAttribute("testcase") != null) {
							    List<TestCase> cases = (List) request.getAttribute("testcase");
							    int size = cases.size();
						%>
					    <tr>
					        <th>Scenario</th>
					        <th>Expected Output</th>
					        <th>Actual Output</th>
					        <th>Status</th>
					    </tr>
						<%
						        for (int i = 0; i < size; i++) {
					    %>
					    <tr>
					        <td><%=cases.get(i).getTestCaseDescription()%></td>
					        <td><%=cases.get(i).getExpectedOutput()%></td>
					        <td><%=cases.get(i).getActualOutput()%></td>
					        <td><%=cases.get(i).getStatus()%></td>
					    </tr>
					    <% 		} 
					    	} 
					    %>
					</table>
				</td>
			</tr>						
			<tr>
				<td class="errClass" colspan="3" align="center">${requestScope.message}</td>
			</tr>
		</table>
		</form:form>
	</fieldset>
</body>
</html>