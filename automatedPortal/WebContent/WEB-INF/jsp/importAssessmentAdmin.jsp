<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Importing Assessment</title>
<link rel="stylesheet" href="css/asap.css">
</head>
<body class="common">
	<form action="importProblem.do" method="post">
		<table>
		<tr>
			<td>File Name:</td>
			<td><input type="file" name="fileLocation"></td>
		</tr>
		<tr>
			<td align="center"><input type="submit" value="Import"></td>
		</tr>
		</table>
	</form>
</body>
</html>