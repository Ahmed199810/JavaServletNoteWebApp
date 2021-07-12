/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ahmed
 */


@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
    
    
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
     
        String name = request.getParameter("fname");
        String email = request.getParameter("uemail");
        String pass = request.getParameter("upassword");
        
        UserDetails ud = new UserDetails();
        
        ud.setName(name);
        ud.setEmail(email);
        ud.setPassword(pass);
        
        
        UserDAO udao = new UserDAO(DBConnect.getConn());
        PrintWriter out = response.getWriter();
        boolean f = udao.addUser(ud);
        HttpSession session = request.getSession();
        
        if(f){
            session.setAttribute("reg-success", "Registeration Success");
            response.sendRedirect("register.jsp");
        }else{
            session.setAttribute("fail-msg", "Not Registered");
            response.sendRedirect("register.jsp");
        }
        
    }
    
}
