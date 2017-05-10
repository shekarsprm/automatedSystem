package com.iwt.nit.aws.utils;

import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;

import com.iwt.nit.aws.helper.AwsPortalConstants;

public class EmailUtils {

public static Logger LOGGER=Logger.getLogger(EmailUtils.class);	
	public static Integer emailUtils(String userEmailId){
		Integer STATUS_ID=0;
		try {
				
			// sets SMTP server properties
			Properties properties = new Properties();
			properties.put("mail.smtp.host", AwsPortalConstants.SERVER_HOST);
			properties.put("mail.smtp.port",AwsPortalConstants.SERVER_PORT);
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			properties.put("mail.user", AwsPortalConstants.FROM_EMAIL_ID);
			properties.put("mail.password", AwsPortalConstants.FROM_PWD);
			System.out.println(AESEncrpUtils.decrypt(AwsPortalConstants.FROM_PWD));
			// creates a new session with an authenticator

			Authenticator auth = new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					try {
						return new PasswordAuthentication(AwsPortalConstants.FROM_EMAIL_ID,AESEncrpUtils.decrypt(AwsPortalConstants.FROM_PWD));
					} catch (Exception e) {
						e.printStackTrace();
						return null;
					}
				}
			};
			
			Session session = Session.getInstance(properties, auth);

			// creates a new e-mail message
			Message msg = new MimeMessage(session);

			msg.setFrom(new InternetAddress(AwsPortalConstants.FROM_EMAIL_ID));
			InternetAddress[] toAddresses = { new InternetAddress(userEmailId) };
			msg.setRecipients(Message.RecipientType.TO, toAddresses);
			msg.setRecipients(Message.RecipientType.CC, toAddresses);
			msg.setSubject("Alert: NIT Service down "+new Date());
			msg.setSentDate(new Date());
			// creates message part
					MimeBodyPart messageBodyPart = new MimeBodyPart();
					messageBodyPart.setContent(EmailContentUtils.userCreatedContent(userEmailId), "text/html");

					
					//4) create new MimeBodyPart object and set DataHandler object to this object      
				    MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
				  
				    String filename = "E:/Jars/pom.xml";//change accordingly  
				    DataSource source = new FileDataSource(filename);  
				    messageBodyPart2.setDataHandler(new DataHandler(source));  
				    messageBodyPart2.setFileName(filename);  
				    
				    
					// creates multi-part
					Multipart multipart = new MimeMultipart();
					multipart.addBodyPart(messageBodyPart);
					 multipart.addBodyPart(messageBodyPart2);  
					// sets the multi-part as e-mumail's content
					msg.setContent(multipart);
					

					// sends the e-mail
					Transport.send(msg);
					STATUS_ID=1;

		} catch (Exception e) {
			e.printStackTrace();
			STATUS_ID=0;
			LOGGER.error("#### Error into the emailUtils ()  "+e.getMessage());
		}
		return STATUS_ID;
	}

	public static void main(String[] args) {
		
		System.out.println(emailUtils("shekarsprm@gmail.com"));
		
	}
}
