
package com.iwt.nit.aws.form;
import java.sql.Timestamp;
import java.util.Date;

public class AuditForm implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	private String hostname;

	private String ipAddress;

	private Date viewDate;

	private Timestamp viewDateAndTime;

	private String browser;

	private String systemUser;

	private String userAgent;

	private String vistorranId;

	private String osName;

	
	public String getSystemUser() {
		return systemUser;
	}

	public void setSystemUser(String systemUser) {
		this.systemUser = systemUser;
	}


	public String getVistorranId() {
		return vistorranId;
	}

	public void setVistorranId(String vistorranId) {
		this.vistorranId = vistorranId;
	}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public Date getViewDate() {
		return viewDate;
	}

	public void setViewDate(Date viewDate) {
		this.viewDate = viewDate;
	}

	public Timestamp getViewDateAndTime() {
		return viewDateAndTime;
	}

	public void setViewDateAndTime(Timestamp viewDateAndTime) {
		this.viewDateAndTime = viewDateAndTime;
	}

	public String getBrowser() {
		return browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOsName() {
		return osName;
	}

	public void setOsName(String osName) {
		this.osName = osName;
	}

}
