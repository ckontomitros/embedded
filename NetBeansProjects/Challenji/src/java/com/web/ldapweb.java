/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web;

/**
 *
 * @author konto
 */
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.model.Uthldap;
 // notice this
public class ldapweb extends HttpServlet {
@Override
     public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws IOException, ServletException {
         response.setContentType("text/html");         
         String passwd = request.getParameter("user");
         String user = request.getParameter("passwd");
         Uthldap auth=new Uthldap(user,passwd);
         List info=new ArrayList();
         if(auth.auth()){
         info.add(auth.getName());
         info.add(auth.getBirthYear());
         info.add(auth.getMail());
         }
         request.setAttribute("info",info);
         RequestDispatcher view=
          request.getRequestDispatcher("profile.jsp");
        view.forward(request,response);
         
     }
        
}
