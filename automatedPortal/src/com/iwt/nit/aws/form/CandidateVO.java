package com.iwt.nit.aws.form;

public class CandidateVO implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private UserASPVO userVO;
	private GroupVO groupVO;
	private Integer candidateId;
	private String empId;
	private String name;

	public UserASPVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserASPVO userVO) {
		this.userVO = userVO;
	}

	public GroupVO getGroupVO() {
		return groupVO;
	}

	public void setGroupVO(GroupVO groupVO) {
		this.groupVO = groupVO;
	}

	public Integer getCandidateId() {
		return candidateId;
	}

	public void setCandidateId(Integer candidateId) {
		this.candidateId = candidateId;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "CandidateVO [userVO=" + userVO + ", groupVO=" + groupVO
				+ ", candidateId=" + candidateId + ", empId=" + empId
				+ ", name=" + name + "]";
	}

}
