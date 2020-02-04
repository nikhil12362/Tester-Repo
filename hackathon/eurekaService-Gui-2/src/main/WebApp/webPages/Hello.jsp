<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>Insert</title>
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

    

    #donutchart {
        height: 300px;
    }

    .highlight_dropdown {
        border: 2px solid #18A1CD;
    }
</style>
<!--  
<body>
  <form method="post" action="add" enctype="multipart/form-data">
  <input type="file" name="csvFile" accept=".csv">
  <input type="submit">
</form>
  -->

<div class="upload_file">

            <h3 class="text-info">Upload your CSV test result</h3>

            <!--file input example -->
            <span class="control-fileupload">
             
                <label for="file">Choose a file :</label>
                <form method="post" action="add" enctype="multipart/form-data">
                <input type="file" id="file" name="csvFile" accept=".csv">
                <input type="submit">
               </form>
            </span>
            <!--./file input example --> 
          <p>&nbsp;</p>
            <hr>
            
        </div>



</body>
</html>
<!-- 
<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html xmlns='http://www.w3.org/1999/xhtml' >
  <head>
    <title>AJAX Upload Progress & Cancel Upload</title>
    <script type='text/javascript'>
        var file;
        function prepareUpload()
        {
            document.getElementById('fileSize').innerHTML = '';
            document.getElementById('bytesUploaded').innerHTML = '';
            document.getElementById('percentUploaded').innerHTML = '';
            document.getElementById('uploadProgressBar').style.width = '0%';
  
            // get file name
            file = document.getElementById('file').value;
            if(file.lastIndexOf('\\')>=0)
                file = file.substr(file.lastIndexOf('\\')+1);
            document.getElementById('fileName').innerHTML = file;
                
            // get folder path
            var curFolder = window.location.href;
            if(curFolder[curFolder.length-1]!='/')
                curFolder = curFolder.substring(0, curFolder.lastIndexOf('/')+1);
  
            document.getElementById('target').innerHTML = curFolder;
            document.getElementById('frm').action = curFolder;
        }
        
        var timerId;
        function formSubmit()
        {
            timerId = setInterval('updateProgress()', 1000);
            document.getElementById('cancelUploadBtn').disabled = false;
        }
        
        function updateProgress()
        {
            var request = window.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : new XMLHttpRequest();
            var uploadTarget = document.getElementById("frm").action + file;
            
            request.open("REPORT", uploadTarget, false);
            request.send("<upload-progress xmlns='ithit'/>");
            var resp = request.responseText;
            
            // Extract number of bytes uploaded and total content length of the file.
            // Usually you will use XML DOM or regular expressions for this purposes
            // but here for the sake of simplicity we will just extract using string methods.
            var size;
            var sizeIndex = resp.indexOf("total-content-length");
            if(sizeIndex != -1)
            {
                size = resp.substring(resp.indexOf(">", sizeIndex)+1, resp.indexOf("</", sizeIndex));
                document.getElementById("fileSize").innerHTML = size;
            }
            var bytes = "Finished";
            var percent = 100;
            var bytesIndex = resp.indexOf("bytes-uploaded");
            if(bytesIndex != -1)
            {
                bytes = resp.substring(resp.indexOf(">", bytesIndex)+1, resp.indexOf("</", bytesIndex));
                if(parseInt(size)!=0)
                    percent = 100*parseInt(bytes)/parseInt(size);
            }
  
            document.getElementById("bytesUploaded").innerHTML = bytes;
            document.getElementById("percentUploaded").innerHTML = percent.toString().substr(0, 4) + " %";
            document.getElementById("uploadProgressBar").style.width = percent.toString() + "%";
            
            if(percent==100)
            {
                clearInterval(timerId);
                document.getElementById("cancelUploadBtn").disabled = true;
            }
        }
        
        function cancelUpload()
        {
            // recreate iframe to cancel upload
            document.getElementById("uploadFrameHolder").innerHTML = "<iframe name='uploadFrame' ></iframe>";
            clearInterval(timerId);
            document.getElementById("cancelUploadBtn").disabled = true;
        }
    </script>
  </head>
  <body>
    <span id="uploadFrameHolder" style="display:none"><iframe name="uploadFrame" ></iframe></span>
      
    <form id="frm" method="post" enctype="multipart/form-data" target="uploadFrame" onsubmit="formSubmit()">
        <input type="file" id="file" name="csvFile" onchange="prepareUpload()" />
        <input type="submit" value="Upload" />
    </form>
    <table>
        <tr><td>File Name: </td><td id="fileName"></td></tr>
        <tr><td>Upload Target: </td><td id="target"></td></tr>
        <tr><td>File Size: </td><td id="fileSize"></td></tr>
        <tr><td>Bytes Uploaded: </td><td id="bytesUploaded"></td></tr>
        <tr>
            <td>Upload Progress: </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <div style="width:200px; height:10px; border: solid 1px black; font-size:0px">
                                <div id="uploadProgressBar" style=" background-color: gray; height:100%; width:0%"></div>
                            </div>
                        </td>
                        <td id="percentUploaded"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <input id="cancelUploadBtn" disabled="true" type="button" value="Cancel" onclick="cancelUpload()" />
  </body>
</html><span style="line-height: 20px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; background-color: transparent;" data-mce-style="line-height: 20px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; background-color: transparent;"> </span>

 -->