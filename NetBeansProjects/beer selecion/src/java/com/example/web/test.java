/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.web;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.example.model.Uthldap;

 // notice this
public class test extends HttpServlet {
@Override
     public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws IOException, ServletException {
         response.setContentType("text/html");
         
         String passwd = request.getParameter("lname");
         String user = request.getParameter("fname");
         Uthldap auth=new Uthldap(user,passwd);
         PrintWriter out=response.getWriter();
         out.println(auth.getName());
         
         
     }
        
}
