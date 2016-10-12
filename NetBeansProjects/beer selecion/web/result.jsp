<%-- 
    Document   : result
    Created on : Oct 11, 2016, 11:22:07 AM
    Author     : konto
--%>

<%@page import="java.util.*"%>

<html>
  
    <body>
    <h1 align="center">Beer recommendations Jsp </h1>
    <%
        List styles=(List)request.getAttribute("styles");
    int k=styles.size();
        while(k!=0){
           out.println("<br>try:"+styles.get(k-1));
           k--;
        }
        %>
    </body>
</html>
