<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Assign Group to a Candidate</title>
	<link rel="stylesheet" href="css/asap.css">
	</head>
<body>
	<%@include file="aboutASAP.jsp"%><br/><br/>
	<fieldset>
		<legend class="heading">Assign Group to a Candidate</legend>
		<form:form commandName="candidate" action="AssociateGroupWithCandidate.action">
			<table cellspacing="4" cellpadding="4">
				<tr>
					<td rowspan="4" valign="top"><img alt="assigngroup" src="images/assigngroup.png"/></td>
					<td class="label">Candidate Name&nbsp;</td>
					<td>
						<form:select path="candidateId" cssClass="control">
							<form:options items="${candidates}" cssClass="control"/>
						</form:select>
					</td>
				</tr>
				<tr>
					<td class="label">Group Name&nbsp;</td>
					<td>
						<form:select path="group.groupId" cssClass="control">
							<form:options items="${groups}" cssClass="control"/>
						</form:select>
					</td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<input type="submit" name="command" value="Save" class="control"/>
						<input type="button" value="Cancel" onclick="location.href='<%="AdminHome.action"%>'" class="control"/>
					</td>
				</tr>
				<tr>
					<td class="errClass" align="right" colspan="2">${requestScope.message}</td>
				</tr>
			</table>
		</form:form>
	</fieldset>
</body>
</html>