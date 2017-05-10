package com.iwt.nit.aws.dto;

public class TestCaseDTO {

	private int testCaseId;
	private ProblemsDTO problem = new ProblemsDTO();
	private String testCaseDescription;
	private String inputData;
	private String expectedOutput;
	private String actualOutput;
	private double score;
	private String status;

	public int getTestCaseId() {
		return testCaseId;
	}

	public void setTestCaseId(int testCaseId) {
		this.testCaseId = testCaseId;
	}

	public ProblemsDTO getProblem() {
		return problem;
	}

	public void setProblem(ProblemsDTO problem) {
		this.problem = problem;
	}

	public String getTestCaseDescription() {
		return testCaseDescription;
	}

	public void setTestCaseDescription(String testCaseDescription) {
		this.testCaseDescription = testCaseDescription;
	}

	public String getInputData() {
		return inputData;
	}

	public void setInputData(String inputData) {
		this.inputData = inputData;
	}

	public String getExpectedOutput() {
		return expectedOutput;
	}

	public void setExpectedOutput(String expectedOutput) {
		this.expectedOutput = expectedOutput;
	}

	public String getActualOutput() {
		return actualOutput;
	}

	public void setActualOutput(String actualOutput) {
		this.actualOutput = actualOutput;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
