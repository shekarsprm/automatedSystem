package com.iwt.nit.aws.utils;

import java.util.Date;

public class EmailContentUtils {

public static String userCreatedContent(String emailId){

		
		int endIndex=emailId.indexOf("@");
		String username=emailId.substring(0, endIndex);

		StringBuffer sb=new StringBuffer();
		sb.append("<body>");
		sb.append("<h2>Dear "+username+",</h2>");
		sb.append("<br/>");
		sb.append("<h3>");
		sb.append("We have received the alert as mentioned below and got closed. Kindly check if you are still  facing any issue..");
		sb.append("<br/>");
		sb.append("<br/>");
		sb.append("Server Down on Nit.com,Please contact system admin immediately");
		sb.append("<br/>");
		sb.append("<br/>");
		sb.append("Please check the services <a href=\"http://www.nareshit.in/\"> Here</a>");
		sb.append("<br/>");
		sb.append("<br/>");
		sb.append("<font color='blue'>");
		sb.append("Thanks");
		sb.append("<br/>");
		sb.append("admin@Nit.com");
		sb.append("</font>");
		sb.append("</body>");
		return sb.toString();
	}

public static void main(String[] args) {
	System.out.println(userCreatedContent("shekarsprm@gmail.com"));
}
}
