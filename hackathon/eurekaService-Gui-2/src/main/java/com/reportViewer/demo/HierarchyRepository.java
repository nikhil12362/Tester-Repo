package com.reportViewer.demo;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface HierarchyRepository extends JpaRepository<Hierarchy, Integer>  {
	
	
	@Query("SELECT p FROM Hierarchy p WHERE LOWER(p.testerId) = LOWER(:testerId)")
    public List<Hierarchy> find(@Param("testerId") String testerId);
	
	@Query("SELECT p FROM Hierarchy p WHERE LOWER(p.assignedProject) = LOWER(:assignedProject)")
    public List<Hierarchy> findProject(@Param("assignedProject") String suiteId);
	
	@Query("SELECT p FROM Hierarchy p WHERE LOWER(p.currentSupervisor) = LOWER(:currentSupervisor)")
    public List<Hierarchy> findTester(@Param("currentSupervisor") String currentSupervisor);
	

}
