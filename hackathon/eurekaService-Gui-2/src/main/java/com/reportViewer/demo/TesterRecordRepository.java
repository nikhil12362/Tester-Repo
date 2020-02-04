package com.reportViewer.demo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TesterRecordRepository extends JpaRepository<TesterRecord, Integer> {
	
	@Query("SELECT p FROM TesterRecord p WHERE LOWER(p.testerId) = LOWER(:testerId)")
    public List<TesterRecord> find(@Param("testerId") String testerId);

}
