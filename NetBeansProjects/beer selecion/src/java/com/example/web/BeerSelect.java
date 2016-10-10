/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author konto
 */
package com.example.web;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;



public class BeerSelect extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws IOException, ServletException {
        
        String c = request.getParameter("color");
        PrintWriter out=response.getWriter();
        out.println("Beer selection advice <br>");
        out.println("<br>Got beer color "+c);
       
    }
}