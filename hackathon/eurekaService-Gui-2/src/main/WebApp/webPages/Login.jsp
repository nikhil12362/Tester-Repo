<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>XURI</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<style>
    .login_form {
        margin: 100px 450px;
        padding: 20px;
        box-shadow: -9px 11px 11px 1px rgba(0, 0, 0, .6);
    }

    .submit_login {
        background: #15A563;
        color: #ffffff;
        border: none;
        transition: 0.4s;
    }

    .submit_login:hover {
        background: #15A563;
        color: #ffffff;
        box-shadow: -5px 5px 10px 1px rgba(0, 0, 0, .6);
    }

    .playground {
        display: none;
        padding: 10px 210px;
    }

    #file {
        border: 1px solid #7C7774;
        padding: 5px;
        width: 50%;
        border-radius: 5px;
        cursor: pointer;
    }

    .upload_file {
        display: none;
    }

    #donutchart {
        height: 300px;
    }

    .highlight_dropdown {
        border: 2px solid #18A1CD;
    }
    .table_header .col-sm-3{
    	border : 1px solid #fff;
    	background : #000;
    	color: #fff;
    	padding-top : 3px;
    	padding-bottom: 3px;
    	
    }
    .table_data_pass .col-sm-3{
    	border : 1px solid #fff;
    	background : #9DF41F;
    	color: #000;
    	padding-top : 3px;
    	padding-bottom: 3px;
    	cursor:pointer;
    	transition : 0.5s;
    }
    
    .table_data_pass:hover,.table_data_fail:hover{
    	zoom: 1.1;
    }
    
    .table_data_fail .col-sm-3{
    	border : 1px solid #fff;
    	background : #EC5820;
    	color: #000;
    	padding-top : 3px;
    	padding-bottom: 3px;
    }
    
    .result_table_wrapper{
	    display:none;
	    margin-top: 40px;
    }
    .upload_file_csv{
	    border: none;
	    margin-top: 10px;
	    background: #2059F2;
	    color: #fff;
	    padding: 8px 20px;
	    border-radius: 5px;
	    box-shadow: -3px 3px 6px 1px #8D8F93;
	    transition: 0.5s;
	}

    .upload_file_csv:hover{
    margin-left: 10px;
    }
    
</style>

<script>
    $(document).ready(function () {

        google.charts.load("current", { packages: ["corechart"] });

        var tester_data = [
            {
                'tester_name': 'Tester_One',
                'test_suit': 'suit_1',
                'project': 'Hyderabad_proj_1',
                'result': 'pass'
            },
            {
                'tester_name': 'Tester_One',
                'test_suit': 'suit_1',
                'project': 'Hyderabad_proj_1',
                'result': 'fail'
            },
            {
                'tester_name': 'Tester_One',
                'test_suit': 'suit_2',
                'project': 'Hyderabad_proj_2',
                'result': 'pass'
            },
            {
                'tester_name': 'Tester_One',
                'test_suit': 'suit_2',
                'project': 'Hyderabad_proj_2',
                'result': 'fail'
            },
            {
                'tester_name': 'Tester_One',
                'test_suit': 'suit_2',
                'project': 'Hyderabad_proj_2',
                'result': 'fail'
            },
            {
                'tester_name': 'Tester_One',
                'test_suit': 'suit_3',
                'project': 'Hyderabad_proj_3',
                'result': 'fail'
            },
            {
                'tester_name': 'Tester_One',
                'test_suit': 'suit_4',
                'project': 'Hyderabad_proj_4',
                'result': 'fail'
            },
            {
                'tester_name': 'Tester_Two',
                'test_suit': 'suit_10',
                'project': 'Hyderabad_proj_1',
                'result': 'pass'
            },
            {
                'tester_name': 'Tester_Two',
                'test_suit': 'suit_10',
                'project': 'Hyderabad_proj_1',
                'result': 'pass'
            },
            {
                'tester_name': 'Tester_Two',
                'test_suit': 'suit_10',
                'project': 'Hyderabad_proj_1',
                'result': 'fail'
            },
            {
                'tester_name': 'Tester_Two',
                'test_suit': 'suit_11',
                'project': 'Hyderabad_proj_2',
                'result': 'pass'
            },
            {
                'tester_name': 'Tester_Two',
                'test_suit': 'suit_12',
                'project': 'Hyderabad_proj_3',
                'result': 'pass'
            },
            {
                'tester_name': 'Tester_Two',
                'test_suit': 'suit_12',
                'project': 'Hyderabad_proj_3',
                'result': 'pass'
            },
            {
                'tester_name': 'Tester_Two',
                'test_suit': 'suit_12',
                'project': 'Hyderabad_proj_3',
                'result': 'fail'
            },
            {
                'tester_name': 'Tester_Two',
                'test_suit': 'suit_12',
                'project': 'Hyderabad_proj_3',
                'result': 'fail'
            },
            {
                'tester_name': 'Tester_Two',
                'test_suit': 'suit_13',
                'project': 'Hyderabad_proj_4',
                'result': 'pass'
            },
            {
                'tester_name': 'Tester_Three',
                'test_suit': 'suit_21',
                'project': 'Hyderabad_proj_1',
                'result': 'pass'
            },
            {
                'tester_name': 'Tester_Three',
                'test_suit': 'suit_21',
                'project': 'Hyderabad_proj_1',
                'result': 'fail'
            },
            {
                'tester_name': 'Tester_Three',
                'test_suit': 'suit_22',
                'project': 'Hyderabad_proj_1',
                'result': 'fail'
            }
        ];

        var tester_namager_data = {
            'Manager_One': ['Tester_Three', 'Tester_Two'],
            'Manager_Two': ['Tester_One', 'Tester_Two']
        };


        var project_namager_data = {
            'Manager_One': ['Hyderabad_proj_1', 'Hyderabad_proj_2'],
            'Manager_Two': ['Hyderabad_proj_3', 'Hyderabad_proj_4']
        };

        user_list = ["Director", "Manager1", "Manager_Two", "Tester_Three", "Tester_Two", "Tester1", "Admin", 'admin'];
        user_loggedin = sessionStorage.getItem("xor_user");


        function authenticateUser() {
            user_loggedin = sessionStorage.getItem("xor_user");
            
            if ($.inArray(user_loggedin, user_list) != -1){
            	$.ajax({
                    url: "http://kumar-nh.india.xoriantcorp.com:8086/demo/ValidLogin?testerId="+user_loggedin, 
                    success: function(result){
                    console.log(result);
                    tester_data = result;
                    afterDataLoad();
                }});
            }
            
            
            $(".designation").html(user_loggedin);
            $(".manager_wrapper,.tester_wrapper").show();
            if ($.inArray(user_loggedin, ["Manager1", "Manager_Two"]) != -1) {
                $(".manager_wrapper").hide();
            }

            if ($.inArray(user_loggedin, ["Tester1","Tester2","Tester3","Tester4"]) != -1) {
                $(".manager_wrapper,.tester_wrapper").hide();
                $(".upload_file").show();
            }
        }

        if ($.inArray(user_loggedin, user_list) != -1) {
            $(".login_page").hide();
            $(".playground").fadeIn(500);
            $(".logout").show();
            $(".login").hide();
            authenticateUser();
        }


        $(".submit_login").click(function () {
            if ($.inArray($(".username").val(), user_list) != -1 && $(".pwd").val() == '123456') {
                console.log("login success");
                sessionStorage.setItem("xor_user", $(".username").val());
                $(".logout").show();
                $(".login").hide();
                $(".login_page").hide(500);
                setTimeout(function () {
                    $(".playground").fadeIn(500);
                }, 500);
                authenticateUser();
                
                // gettong the data
                
               	/* $.ajax({
                      url: "http://kumar-nh.india.xoriantcorp.com:8086/demo/ValidLogin?testerId="+$(".username").val(), 
                      success: function(result){
                      console.log(result);
                      tester_data = result;
                      afterDataLoad();
                  }}); */
                
            }
        });

        $(".logout").click(function () {
            sessionStorage.removeItem("xor_user");
            $(".playground,.logout").hide(500);
            setTimeout(function () {
                $(".login_page,.login").fadeIn(500);
                location.reload();
            }, 500);
        });
	
        function afterDataLoad(){
        	project_list = []
            test_suits = []
            all_tester_list = []
        	manager_list = []
        	
        	//$("#project_options,#test_suit_options,#tester_options,#manager_options").empty();
        	
            $.each(tester_data, function (k, v) {
                if ($.inArray(v.assignedProject, project_list) == -1) {
                    project_list.push(v.assignedProject);
                    var proj_name_str = '<option>' + v.assignedProject + '</option>';
                    $("#project_options").append(proj_name_str);
                }

                if ($.inArray(v.suiteId, test_suits) == -1) {
                    test_suits.push(v.suiteId);
                    var suit_str = '<option>' + v.suiteId + '</option>';
                    $("#test_suit_options").append(suit_str);
                }

                if ($.inArray(v.testerId, all_tester_list) == -1) {
                    all_tester_list.push(v.testerId);
                    var tester_str = '<option>' + v.testerId + '</option>';
                    $("#tester_options").append(tester_str);
                }
                
                if ($.inArray(v.currentSupervisor, manager_list) == -1) {
                    manager_list.push(v.currentSupervisor);
                    var manager_name_str = '<option>' + v.currentSupervisor + '</option>';
                    $("#manager_options").append(manager_name_str);
                }
            });


            $(".filter").change(function () {
                var param_name = $(this).attr('param');
                var value_str = $(this).val();
                $(".filter").removeClass('highlight_dropdown');
                $(this).addClass('highlight_dropdown');
                
                if (param_name == "project") {
                	$.ajax({
                        url: "http://kumar-nh.india.xoriantcorp.com:8086/demo/ValidLogin/Project?assignedProject="+$("#project_options").val(),
                        async: false,
                        success: function(result){
                        	//console.log(result);
                        	filtered_data = result;
                        	
                        	test_suits = []
                        	$("#test_suit_options").empty();
                        	$("#test_suit_options").append('<option>Select test suite</option>');
                        	
                        	$.each(filtered_data, function (k, v) {
	                        	if ($.inArray(v.testSuiteId, test_suits) == -1) {
	                                test_suits.push(v.testSuiteId);
	                                var suit_str = '<option>' + v.testSuiteId + '</option>';
	                                $("#test_suit_options").append(suit_str);
	                            }
                        	});
                        	
                        	drawChart(result);
                    }});
                }else if (param_name == "test_suit"){
                	$.ajax({
                        url: "http://kumar-nh.india.xoriantcorp.com:8086/demo/ValidLogin/Suite?assignedProject="+$("#project_options").val()+"&suiteId="+$("#test_suit_options").val(),
                        async: false,
                        success: function(result){
                        	//console.log(result);
                        	filtered_data = result;
                        	drawChart(result);
                    }});
                }else if (param_name == "manager"){
                	$.ajax({
                        url: "http://kumar-nh.india.xoriantcorp.com:8086/demo/ValidLogin/Manger?testerId="+$("#manager_options").val(),
                        async: false,
                        success: function(result){
                        	//console.log(result);
                        	filtered_data = result;
                        	
                        	
                        	testers = []
                        	$("#tester_options").empty();
                        	$("#tester_options").append('<option>Select tester</option>');
                        	
                        	$.each(filtered_data, function (k, v) {
	                        	if ($.inArray(v.testerId, testers) == -1) {
	                        		testers.push(v.testerId);
	                                var tester_str = '<option>' + v.testerId + '</option>';
	                                $("#tester_options").append(tester_str);
	                            }
                        	});
                        	
                        	
                        	drawChart(result);
                    }});
                }else if (param_name == "tester_name"){
                	$.ajax({
                        url: "http://kumar-nh.india.xoriantcorp.com:8086/demo/ValidLogin/Tester?testerId="+$("#tester_options").val(),
                        async: false,
                        success: function(result){
                        	//console.log(result);
                        	filtered_data = result;
                        	drawChart(result);
                    }});
                }
            });
        }
        
        
		
        function drawChart(filtered_data){
        	console.log("+++++++++++++++++++++++++++")
        	console.log(filtered_data);
        	$(".result_table_data_wrapper").empty();
        	
        	if ($.inArray(user_loggedin, ['Tester1','Tester2','Tester3','Tester4']) != -1){
    			filtered_data = filtered_data.filter(function(obj){
    				return obj.testerId.toUpperCase() == user_loggedin.toUpperCase();
    			})
    		}
        	
        	console.log(filtered_data);
        	
        	
        	
        	$.each(filtered_data,function(key,value){
        		if (value.testCaseStatus == 'pass'){
        			var temp_str = '<div class="table_data_pass row">'+
	            	'<div class="col-sm-3">'+value.testerId+'</div>'+
	            	'<div class="col-sm-3">'+value.testSuiteId+'</div>'+
	            	'<div class="col-sm-3">'+value.testCaseName+'</div>'+
	            	'<div class="col-sm-3">'+value.testCaseStatus+'</div>'+
            	'</div>';
        		}else{
        			var temp_str = '<div class="table_data_fail row">'+
	            	'<div class="col-sm-3">'+value.testerId+'</div>'+
	            	'<div class="col-sm-3">'+value.testSuiteId+'</div>'+
	            	'<div class="col-sm-3">'+value.testCaseName+'</div>'+
	            	'<div class="col-sm-3">'+value.testCaseStatus+'</div>'+
            	'</div>';
        		}
        		
            	
            	$(".result_table_data_wrapper").append(temp_str);
        	});
        	
        	if(filtered_data.length == 0){
        		$(".result_table_wrapper").hide();
        	}else{
        		$(".result_table_wrapper").fadeIn(800);
        	}
        	
        	
            var pass_status = filtered_data.filter(function (obj) {
                return obj.testCaseStatus == 'pass';
            });
            var pass_num = pass_status.length;

            var fail_status = filtered_data.filter(function (obj) {
                return obj.testCaseStatus == 'fail';
            });
            var fail_num = fail_status.length;

            var project_status = [
                ['Status', 'Quantity'],
                ['Pass', pass_num],
                ['Fail', fail_num]
            ];
            // google.charts.setOnLoadCallback(project_status_chart);
            project_status_chart(project_status)
        }
        
        
        // Chart section 
        function project_status_chart(project_status) {
            var data = google.visualization.arrayToDataTable(project_status);
            var options = {
                // title: 'Testing status',
                pieHole: 0.4,
                chartArea: { left: 20, top: 50, width: '100%', height: '100%', backgroundColor: '#F7F7F7' },
                // legend: {position: 'bottom', textStyle: {color: 'black', fontSize: 16}},
                 colors:['#9DF41F','#EC5820'],
            };
            var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
            chart.draw(data, options);
        }

        function drawChart2() {

            // Define the chart to be drawn.
            var data = google.visualization.arrayToDataTable([
                ['Year', 'Asia', 'Europe'],
                ['2012', 900, 390],
                ['2013', 1000, 400],
                ['2014', 1170, 440],
                ['2015', 1250, 480],
                ['2016', 1530, 540]
            ]);

            var options = { title: 'Population (in millions)', isStacked: true };

            // Instantiate and draw the chart.
            var chart = new google.visualization.BarChart(document.getElementById('bar'));
            chart.draw(data, options);
        }


        // Chart section 
    });
</script>

<body>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">XURI</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <!-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Page 1-1</a></li>
                        <li><a href="#">Page 1-2</a></li>
                        <li><a href="#">Page 1-3</a></li>
                    </ul>
                </li>
                <li><a href="#">Page 2</a></li> -->
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="logout" style="display: none;"><a href="#"><span class="glyphicon glyphicon-user"></span>
                        Logout</a></li>
                <li class="login"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
        </div>
    </nav>

    <section class="login_page">
        <div class="login_form">
            <div class="form-group">
                <label for="email">Username:</label>
                <input type="text" class="form-control username" id="username" placeholder="Enter username">
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control pwd" id="pwd" placeholder="Enter password" name="pwd">
            </div>
            <button class="btn btn-default submit_login">Submit</button>
        </div>
    </section>

    <section class="playground">
    	<p style="text-align: right;
    font-size: 16px;
    font-weight: 600;
    font-style: italic;">Hi <span class="designation"></span></p>
        <div class="upload_file">

            <h3 class="text-info">Upload your CSV test result</h3>

            <!--file input example -->
            <span class="control-fileupload">
             
                <label for="file">Choose a file :</label>
                <form method="post" action="add" enctype="multipart/form-data">
                <input type="file" id="file" name="csvFile" accept=".csv">
                <input type="submit" class='upload_file_csv'>
               </form>
            </span>
            <!--./file input example --> 
          <p>&nbsp;</p>
            <hr>
            
        </div>

        <div class="dashboard row">

            <!-- PRoject dropdown -->
            <div class="col-sm-3 project_option_wrapper">
                <select class="form-control filter" id="project_options" param='project'>
                    <option value=''>Select project name</option>

                </select>
            </div>


            <!-- test suit dropdown -->
            <div class="col-sm-3 test_suit_wrapper">
                <select class="form-control filter" id="test_suit_options" param='test_suit'>
                    <option value=''>Select test suit </option>


                </select>
            </div>


            <!-- manager dropdown -->
            <div class="col-sm-3 manager_wrapper">
                <select class="form-control filter" id="manager_options" param='manager'>
                    <option value=''>Select Manager</option>


                </select>
            </div>



            <!-- tester dropdown -->
            <div class="col-sm-3 tester_wrapper">
                <select class="form-control filter" id="tester_options" param='tester_name'>
                    <option value=''>Select Tester</option>


                </select>
            </div>

        </div>

        <div class='row'>
            <div id="donutchart" class="col-sm-6"></div>
            <div class='col-sm-6'>
            <div class="result_table_wrapper">
            	<div class="table_header row">
	            	<div class="col-sm-3">Tester ID</div>
	            	<div class="col-sm-3">Test Suite </div>
	            	<div class="col-sm-3">Test Case </div>
	            	<div class="col-sm-3">Result</div>
            	</div>
           	</div>
           	
           	<div class="result_table_data_wrapper">
           	</div>
          
            </div>
            
        </div>
    </section>

</body>



</html>