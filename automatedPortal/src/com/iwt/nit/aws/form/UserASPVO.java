package com.iwt.nit.aws.form;

public class UserASPVO {

	private String username;
	private Integer userId;
	private String ipAddress;
	private boolean isAdmin;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "UserASPDTO [username=" + username + ", userId=" + userId
				+ ", ipAddress=" + ipAddress + ", isAdmin=" + isAdmin + "]";
	}

}
