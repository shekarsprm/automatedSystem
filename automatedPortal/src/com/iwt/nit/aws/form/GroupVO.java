package com.iwt.nit.aws.form;

public class GroupVO {
	private Integer groupId;
	private String groupName;

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	@Override
	public String toString() {
		return "GroupVO [groupId=" + groupId + ", groupName=" + groupName + "]";
	}

}
