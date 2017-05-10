<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Activate an Assessment</title>
	<link rel="stylesheet" href="css/asap.css">
	<script type="text/javascript">
		var req;
		function populate() {
			if (window.XMLHttpRequest) {
				req = new XMLHttpRequest;
			} else if (window.ActiveXObject) {
				new ActiveXObject("Microsoft.XMLHTTP");
			}
			var url = "update.action";
			req.open("POST", url, true); //async
			req.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			req.onreadystatechange = display;
			req.send("n=" + document.getElementById("group").value);
		}
	
		function display() {
			if (req.readyState == 4) {
				if (req.status == 200) { //if response is got
					result.innerHTML = req.responseText;
				}
			}
		}
	</script>
</head>
<body onload="populate()">
	<%@include file="aboutASAP.jsp"%><br/><br/>
	<fieldset>
		<legend class="heading">Activate an Assessment</legend>
		<form:form commandName="update" action="UpdateAssessment.action">
		<table cellspacing="4" cellpadding="4">
			<tr>
				<td rowspan="4" valign="top"><img alt="login" src="images/activate.png"/></td>
				<td class="label">Group&nbsp;</td>
				<td>
					<form:select path="group.groupId" id="group" onchange="populate()" cssClass="control">
                		<form:options items="${groups}"  cssClass="control"/>
            		</form:select>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label">Assessment&nbsp;</td>
				<td>
					<span id="result" class="control"></span>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label">Status&nbsp;</td>
				<td>
					<form:radiobutton path="enable" value="true" cssClass="control"/><span class="label">Active</span>
					<form:radiobutton path="enable" value="false"  cssClass="control"/><span class="label">Inactive</span>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<input type="submit" name="command" value="Update Assessment" class="control"/>
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