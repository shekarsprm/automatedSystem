package com.iwt.nit.aws.dto;

public class CandidateDTO implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private UserASPDTO userDTO;
	private GroupDTO groupDTO;
	private Integer candidateId;
	private String empId;
	private String name;

	public UserASPDTO getUserDTO() {
		return userDTO;
	}

	public void setUserDTO(UserASPDTO userDTO) {
		this.userDTO = userDTO;
	}

	public GroupDTO getGroupDTO() {
		return groupDTO;
	}

	public void setGroupDTO(GroupDTO groupDTO) {
		this.groupDTO = groupDTO;
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
		return "CandidateDTO [userDTO=" + userDTO + ", groupDTO=" + groupDTO
				+ ", candidateId=" + candidateId + ", empId=" + empId
				+ ", name=" + name + "]";
	}

}
