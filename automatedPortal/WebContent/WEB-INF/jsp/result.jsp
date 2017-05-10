<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.List" %>
<%-- <%@page import="com.iwt.nit.aws.model.TestCase" %> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<fieldset>
<legend style="color: brown;">RESULT</legend>
<table>
<tr></tr>
<tr><td>
<%if(request.getAttribute("error")!=null){%>
<p style="font: verdana;size: 100;color: red">Compilation Error</p>
<%}%>
<%if(request.getAttribute("testcase")!=null){%>
<%List<TestCase> cases =(List)request.getAttribute("testcase"); %>
<%int size = cases.size();%>

<table border="1">
<tr><th>Scenario</th><th>Expected Output</th><th>Actual Output</th></tr>
<% for(int i=0;i<size;i++){%>
<tr>
<td><%=cases.get(i).getTestCaseDescription()%></td>
<td><%=cases.get(i).getExpectedOutput()%></td>
<td><%=cases.get(i).getActualOutput()%></td>
</tr>	
<%}}%>
</table>
</td></tr>
<tr><td>
<input type="button" value="Home" align="bottom"
				onclick="location.href='<%="TestTakerHome.action"%>'" />
</td></tr>		
</table>
</fieldset>
</center>
</body>
</html>