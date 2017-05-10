package com.iwt.nit.aws.form;

import java.sql.Timestamp;
import java.util.Date;

public class ProblemsVO implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer problemId;
	private String problemName;
	private String problemDescription;
	private String problemInput;
	private String problemOutput;
	private Integer problemTimeLine;
	private Date problemInsertDate;
	private Timestamp problemInsertTimestamp;

	public Integer getProblemId() {
		return problemId;
	}

	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}

	public String getProblemName() {
		return problemName;
	}

	public void setProblemName(String problemName) {
		this.problemName = problemName;
	}

	public String getProblemDescription() {
		return problemDescription;
	}

	public void setProblemDescription(String problemDescription) {
		this.problemDescription = problemDescription;
	}

	public String getProblemInput() {
		return problemInput;
	}

	public void setProblemInput(String problemInput) {
		this.problemInput = problemInput;
	}

	public String getProblemOutput() {
		return problemOutput;
	}

	public void setProblemOutput(String problemOutput) {
		this.problemOutput = problemOutput;
	}


	public Date getProblemInsertDate() {
		return problemInsertDate;
	}

	public void setProblemInsertDate(Date problemInsertDate) {
		this.problemInsertDate = problemInsertDate;
	}

	public Timestamp getProblemInsertTimestamp() {
		return problemInsertTimestamp;
	}

	public void setProblemInsertTimestamp(Timestamp problemInsertTimestamp) {
		this.problemInsertTimestamp = problemInsertTimestamp;
	}

	public Integer getProblemTimeLine() {
		return problemTimeLine;
	}

	public void setProblemTimeLine(Integer problemTimeLine) {
		this.problemTimeLine = problemTimeLine;
	}

}