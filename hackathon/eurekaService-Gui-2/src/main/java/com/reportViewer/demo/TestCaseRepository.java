package com.reportViewer.demo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TestCaseRepository extends JpaRepository<TestCase, Integer>  {

	
	@Query("SELECT p FROM TestCase p WHERE LOWER(p.testerId) = LOWER(:testerId)")
    public List<TestCase> find(@Param("testerId") String testerId);
}
