<%-- 
    Document   : login
    Created on : Oct 18, 2016, 5:03:56 PM
    Author     : konto
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
    <center>
        <%
        List pers=(List)request.getAttribute("info");
        if(pers.size()>0){
        out.println("<br>To onoma einai:"+pers.get(0));
        out.println("<br>H hmerominia gennisis einai:"+pers.get(1));
        out.println("<br>To eimail einai:"+pers.get(2));
        }
        else{
        out.println("wrong username or password");
        }
        int sessions=(Integer)request.getAttribute("total_ses");
        out.println("there are "+sessions+" active sessions");
        %>
       </center>
    </body>
</html>
