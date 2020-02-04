package com.reportViewer.demo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.sql.rowset.serial.SerialBlob;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.opencsv.CSVParser;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.bean.ColumnPositionMappingStrategy;
import com.opencsv.bean.CsvToBean;




@Controller // This means that this class is a Controller
@RequestMapping(path = "/demo")
public class ReportController {

	@Autowired
	private TestCaseRepository testCaseRepo;
	
	@Autowired
	private XmlStoreRepository xmlStoreRepository;
	
	@Autowired
	private TesterRecordRepository testerRecordRepository;
	
	@Autowired
	private HierarchyRepository hierarchyRepository;

	
	@GetMapping("/") 
	public String home() {	   
			
	    return "Report";
	    
	}  
	@CrossOrigin 
	@GetMapping("/login") 
	public String homeLogin() {	   
			
	    return "Login";
	    
	}
	
	@CrossOrigin 
	@RequestMapping(path = "/ValidLogin",method = RequestMethod.GET)
	public @ResponseBody List<Hierarchy> getAllData(@RequestParam("testerId") String testerId) {
		System.out.println(testerId);
		List<Hierarchy> tcv=null;
		if(testerId.equalsIgnoreCase("admin")) {
			tcv=hierarchyRepository.findAll();
		}else {
		tcv=hierarchyRepository.find(testerId);
		tcv.addAll(hierarchyRepository.findTester(testerId));
		}				
		return tcv;
	}
	@CrossOrigin 
	@RequestMapping(path = "/ValidLogin/Manger",method = RequestMethod.GET)
	public @ResponseBody List<TestCase> getAllManager(@RequestParam("testerId") String testerId) {
		System.out.println(testerId);
		List<Hierarchy> testers=new ArrayList<>();
		List<TestCase> testCases=new ArrayList<>();
		if(testerId.equalsIgnoreCase("all")) {
			testCases.addAll(testCaseRepo.findAll());
		}else {
		testers.addAll(hierarchyRepository.findTester(testerId));
		for(Hierarchy tester:testers) {
			testCases.addAll(testCaseRepo.find(tester.getTesterId()));
		}
		
		}
		return testCases;
	}
	@CrossOrigin 
	@RequestMapping(path = "/ValidLogin/Project",method = RequestMethod.GET)
	public @ResponseBody List<TestCase> getAllProject(@RequestParam("assignedProject") String assignedProject) {
		System.out.println(assignedProject);
		List<Hierarchy> testers=new ArrayList<>();
		List<TestCase> testCases=new ArrayList<>();
		testers.addAll(hierarchyRepository.findProject(assignedProject));
		for(Hierarchy tester:testers) {
			testCases.addAll(testCaseRepo.find(tester.getTesterId()));
		}
		return testCases;
	}
	@CrossOrigin 
	@RequestMapping(path = "/ValidLogin/Suite",method = RequestMethod.GET)
	public @ResponseBody List<TestCase> getAllSuite(@RequestParam("assignedProject") String assignedProject,@RequestParam("suiteId") String suiteId) {
		System.out.println(assignedProject);
		List<Hierarchy> testers=new ArrayList<>();
		List<TestCase> testCases=new ArrayList<>();
		testers.addAll(hierarchyRepository.findProject(assignedProject));
		for(Hierarchy tester:testers) {
			if(tester.getSuiteId().equalsIgnoreCase(suiteId))
			testCases.addAll(testCaseRepo.find(tester.getTesterId()));
		}
		return testCases;
	}
	
	
	
	@CrossOrigin 
	@RequestMapping(path = "/ValidLogin/Tester",method = RequestMethod.GET)
	public @ResponseBody List<TestCase> getAllTestCase(@RequestParam("testerId") String testerId) {
		System.out.println(testerId);
				
		return testCaseRepo.find(testerId);
	}
	
	
	@CrossOrigin 
	@GetMapping("/Entry") 
	public String employeeEntry() {	   
			
	    return "EmployeeEntry";
	    
	}
	
	
	
	
	
	
	@CrossOrigin 
	@RequestMapping("report") 
	public String getOrgDetails(TestCase testCase) {	  
		System.out.println(testCase);
		testCaseRepo.save(testCase);	
	    return "Report";  
	    
	}	
	@CrossOrigin 
	@GetMapping("/upload") 
	public String fileUpload() {	   
			
	    return "Hello";
	    
	}
	@CrossOrigin 
	@PostMapping(path = "add") 
	public String addFile(@RequestParam MultipartFile  csvFile) {
		BufferedReader br;
		List<String> result = new ArrayList<>();
		try {			
			
			String line;
		     InputStream is = csvFile.getInputStream();
		     br = new BufferedReader(new InputStreamReader(is));
		     int i=0;
		     while ((line = br.readLine()) != null ) {
		    	 if(i==0) {
		    		 i++;
		    		 continue; 
		    	 }
					if (line.isEmpty() || line.trim().equals("")) {
						continue;
					}
					System.out.println(line);
					
					String[] row= new CSVParser().parseLine(line);
					TestCase testCase = new TestCase();
					testCase.setTestCaseId(row[0]);
					testCase.setTestCaseName(row[1]);
					testCase.setTestCaseDescription(row[2]);
					testCase.setTestCaseStep(row[3]);
					testCase.setTestCaseStatus(row[4]);
					testCase.setTestSuiteId(row[5]);
					testCase.setTesterId(row[6]);
					testCaseRepo.save(testCase);
		    	 
		    	 
					result.add(line);
		     }}catch(Exception e) {
		    	 
		     }
		return "Login";
	}
	@CrossOrigin 
	@RequestMapping(path = "/allTestCases",method = RequestMethod.GET)
	public @ResponseBody List<TestCase> getAllTestCases(@RequestParam("testerId") String testerId) {
		System.out.println(testerId);
		List<TestCase> tcv=testCaseRepo.find(testerId);
		for(TestCase tc: tcv) {
			System.out.println(tc.toString());
		}
		return testCaseRepo.find(testerId);
	}

	
	///------------------------Test Case Entry completes------
	///------------------Hierarchy Entry Starts------------
	
	@GetMapping("/employee") 
	public String employee() {	   
			
	    return "EmployeeEntry";
	    
	}
	
	@RequestMapping("employeeEntry") 
	public String putEmployeeDetails(Hierarchy hierarchy) {	  
		
		hierarchyRepository.save(hierarchy);	
	    return "EmployeeEntry";
	    
	}	
	
	@GetMapping(path = "/allEmployee")
	public @ResponseBody List<Hierarchy> getAllEmployee() {
		return hierarchyRepository.findAll();
	}
	
	@GetMapping(path = "/Employee")
	public @ResponseBody Optional<Hierarchy> getEmployee(@RequestParam("empId") int empId ) {
		return hierarchyRepository.findById(empId);
	}
	
	
	//-----Hierarchy Ends-----
	//-----Tester Record Repository-----
	
	@GetMapping("/TesterRecord") 
	public String testerRecord() {	   
			
	    return "TesterRecordEntry";
	    
	}
	
	@RequestMapping("TesterEntry") 
	public String putEmployeeDetails(TesterRecord testerRecord) {	  
		
		testerRecordRepository.save(testerRecord);	
	    return "TesterRecordEntry";
	    
	}	
	
	@GetMapping(path = "/allTesterRecord")
	public @ResponseBody List<TesterRecord> getAllTester() {
		return testerRecordRepository.findAll();
	}
	
	@GetMapping(path = "/Tester")
	public @ResponseBody List<TesterRecord> getTesterRecord(@RequestParam("empId") String testerId ) {
		return testerRecordRepository.find(testerId);//(empId);
	}
	
	
	
}
