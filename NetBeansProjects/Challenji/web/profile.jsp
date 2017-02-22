<%-- 
    Document   : profile
    Created on : Nov 19, 2016, 8:20:39 PM
    Author     : konto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile page</title>
        <link rel="stylesheet" type="text/css" href="prof.css">
    </head>
    <body>
      <div class="card">
  <div class="content">
    <div class="post main">
      <div class="preview">Personal details: <br>
      Username: ${info[0]} <br>
      email address : ${info[2]}<br>
      Year of birth: ${info[1]}<br>

      </div>
    </div>
    <div class="post sec">
      <div class="preview">Challenges_posted</div>
 
      <div class="detail">Challenges_active</div>
    </div>
    <div class="post sec">
      <div class="preview">Challenges_completed</div>
    
      <div class="detail">Challenges_waiting_approval</div>
    </div>
    
  <div class="fabs">
    <div class="fab"></div>
    <i class="avatar zmdi zmdi-account"></i>
  </div>
  
   </div>
      </div>
    </body>
</html>
