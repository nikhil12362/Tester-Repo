
package com.reportViewer.demo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Hierarchy {

	@Id
	private int empId;

	private String testerId;
	
	private String currentSupervisor;
	
	private String assignedProject;
	
	private String suiteId;
	
	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	
	public String getCurrentSupervisor() {
		return currentSupervisor;
	}

	public void setCurrentSupervisor(String currentSupervisor) {
		this.currentSupervisor = currentSupervisor;
	}

	public String getTesterId() {
		return testerId;
	}

	public void setTesterId(String testerId) {
		this.testerId = testerId;
	}

	public String getAssignedProject() {
		return assignedProject;
	}

	public void setAssignedProject(String assignedProject) {
		this.assignedProject = assignedProject;
	}

	public String getSuiteId() {
		return suiteId;
	}

	public void setSuiteId(String suiteId) {
		this.suiteId = suiteId;
	}

	@Override
	public String toString() {
		return "Hierarchy [empId=" + empId + ", testerId=" + testerId +  ", suiteId=" + suiteId + ", currentSupervisor="
				+ currentSupervisor + ", assignedProject=" + assignedProject + "]";
	}

}
