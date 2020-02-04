package com.reportViewer.demo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class TesterRecord {

	@Id
	private int suiteNumber;
	
	private String testerId;
	
	private String projectName;
	
	private String testSuiteId;

	public String getTesterId() {
		return testerId;
	}

	public void setTesterId(String testerId) {
		this.testerId = testerId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getTestSuiteId() {
		return testSuiteId;
	}

	public void setTestSuiteId(String testSuiteId) {
		this.testSuiteId = testSuiteId;
	}

	@Override
	public String toString() {
		return "TesterRecord [testerId=" + testerId + ", projectName=" + projectName + ", testSuiteId="
				+ testSuiteId + "]";
	}
	
		
}
