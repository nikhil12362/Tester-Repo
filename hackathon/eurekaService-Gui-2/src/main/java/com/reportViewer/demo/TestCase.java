package com.reportViewer.demo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class TestCase  implements Serializable {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int serialNumber;
	
	private String testerId;
	private String testSuiteId;
	
	private String testCaseId;

	private String testCaseName;

	private String testCaseDescription;

	private String testCaseStep;

	private String testCaseStatus;
	
	

	public String getTestCaseId() {
		return testCaseId;
	}

	public void setTestCaseId(String testCaseId) {
		this.testCaseId = testCaseId;
	}

	public String getTestCaseName() {
		return testCaseName;
	}

	public void setTestCaseName(String testCaseName) {
		this.testCaseName = testCaseName;
	}

	public String getTestCaseDescription() {
		return testCaseDescription;
	}

	public void setTestCaseDescription(String testCaseDescription) {
		this.testCaseDescription = testCaseDescription;
	}

	public String getTestCaseStep() {
		return testCaseStep;
	}

	public void setTestCaseStep(String testCaseStep) {
		this.testCaseStep = testCaseStep;
	}

	public String getTestCaseStatus() {
		return testCaseStatus;
	}

	public void setTestCaseStatus(String testCaseStatus) {
		this.testCaseStatus = testCaseStatus;
	}

	public String getTestSuiteId() {
		return testSuiteId;
	}

	public void setTestSuiteId(String testSuiteId) {
		this.testSuiteId = testSuiteId;
	}

	public String getTesterId() {
		return testerId;
	}

	public void setTesterId(String testerId) {
		this.testerId = testerId;
	}

	@Override
	public String toString() {
		return "TestCase [testCaseId=" + testCaseId + ", testCaseName=" + testCaseName + ", testCaseDescription="
				+ testCaseDescription + ", testCaseStep=" + testCaseStep + ", testCaseStatus=" + testCaseStatus + ", testerId="
						+ testerId +"]";
	}
}
