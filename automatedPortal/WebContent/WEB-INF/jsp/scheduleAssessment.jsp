<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Schedule An Assessment</title>
	<link rel="stylesheet" href="css/asap.css">
	<script language="javaScript" type="text/javascript" src="js/calendar.js"></script>
	</head>
<body>
	<%@include file="aboutASAP.jsp"%><br/><br/>
	<fieldset>
		<legend class="heading">Schedule an Assessment</legend>
		<form:form method="post" action="ScheduleAssessment.action" commandName="assessmentSchedule">
		<table cellspacing="4" cellpadding="4">
			<tr>
				<td rowspan="5" valign="top"><img alt="schedule" src="images/schedule.png"/></td>
				<td class="label">Group&nbsp;</td>
				<td>
					<form:select path="group.groupId" cssClass="control">
						<form:options items="${groups}" cssClass="control"/>
					</form:select>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label" valign="top">Assessment&nbsp;</td>
				<td>
					<form:select path="problem.problemId" cssClass="control">
						<form:options items="${problems}" cssClass="control"/>
					</form:select>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="label" valign="top">Start Date&nbsp;</td>
				<td>
					<form:input path="startDate" id="startDate" cssClass="control"/>
					<a href="#" onClick="setYears(2010, 2100); showCalender(this, 'startDate');"><img src="images/calendar.png" width="20px" height="20px"></a>
				</td>
				<td>
					<form:errors path="startDate" cssClass="errClass" />
				</td>
			</tr>
			<tr>
				<td class="label" valign="top">End Date&nbsp;</td>
				<td>
					<form:input path="endDate" id="endDate" cssClass="control"/>
					<a href="#" onClick="setYears(2010,2100); showCalender(this, 'endDate');"><img src="images/calendar.png" width="20px" height="20px"></a>
				</td>
				<td>
					<form:errors path="endDate" cssClass="errClass" />
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<input type="submit" name="command" value="Save" class="control"/>
					<input type="button" value="Cancel" onclick="location.href='<%="AdminHome.action"%>'" class="control"/>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="errClass" align="right" colspan="2">${requestScope.message}</td>
			</tr>
		</table>
		<table id="calenderTable" class="label" style="display:none;" border width="225px">
		    <tbody id="calenderTableHead">
		        <tr>
		            <td colspan="4" align="center">
		                <select onChange="showCalenderBody(createCalender(document.getElementById('selectYear').value, this.selectedIndex, false));" id="selectMonth">
		                    <option value="0">Jan</option>
		                    <option value="1">Feb</option>
		                    <option value="2">Mar</option>
		                    <option value="3">Apr</option>
		                    <option value="4">May</option>
		                    <option value="5">Jun</option>
		                    <option value="6">Jul</option>
		                    <option value="7">Aug</option>
		                    <option value="8">Sep</option>
		                    <option value="9">Oct</option>
		                    <option value="10">Nov</option>
		                    <option value="11">Dec</option>
		                </select>
		            </td>
		            <td colspan="2" align="center">
		                <select onChange="showCalenderBody(createCalender(this.value, document.getElementById('selectMonth').selectedIndex, false));" id="selectYear"></select>
		            </td>
		            <td align="center">
		                <a href="#" onClick="closeCalender();"><font color="#003333" size="+1">x</font></a>
		            </td>
		        </tr>
		    </tbody>
		    <tbody id="calenderTableDays">
		        <tr style="">
		            <td>Sun</td>
		            <td>Mon</td>
		            <td>Tue</td>
		            <td>Wed</td>
		            <td>Thu</td>
		            <td>Fri</td>
		            <td>Sat</td>
		        </tr>
		    </tbody>
		    <tbody id="calender"/>
		</table>
		</form:form>
	</fieldset>
</body>
</html>