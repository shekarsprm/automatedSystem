<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="css/asap.css">
		<title>Login</title>
	</head>
<body>
    <center>
		<fieldset ><legend class="heading">Login</legend>
		<form:form method="post" action="Login.action" commandName="user" align="center">
		<table align="center" cellspacing="4" cellpadding="4">
			<tr>
				<td rowspan="2" valign="top"><img alt="login" src="images/login.png"/></td>
				<td><span class="label">Username&nbsp;</span></td>
				<td>
			<%-- 		<form:input path="username" cssClass="control"/>
					<form:errors path="username" cssClass="errClass" />
			 --%>		
					<input type="text" name="username" id="username"
					maxlength="100" />
				</td>
			</tr>
			<tr>
				<td><span class="label">Password&nbsp;</span></td>
				<td>
			<%-- 		<form:password path="password" cssClass="control" />
					<form:errors path="password" cssClass="errClass" />
			 --%>		
					<input type="password" name="password" id="password"
					maxlength="16" />
			
				</td>
			</tr>
			<tr>
				<td align="right" colspan="3">
					<input type="submit" name="command" value="Login" class="control"/>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center"><span class="errClass">${requestScope.message}</span></td>
			</tr>
		</table>
		</form:form>
		</fieldset>
	</center>	
</body>
</html>