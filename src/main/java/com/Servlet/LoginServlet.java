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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("uemail");
        String pass = request.getParameter("upassword");
        
        UserDetails ud = new UserDetails();
        
        ud.setEmail(email);
        ud.setPassword(pass);
        
        
        UserDAO udao = new UserDAO(DBConnect.getConn());
        PrintWriter out = response.getWriter();
        UserDetails user = udao.loginUser(ud);
        HttpSession session = request.getSession();
        
        if(user != null){
            session.setAttribute("user", user);
            response.sendRedirect("home.jsp");
        }else{
            session.setAttribute("fail-msg", "Invalid Email or Password");
            response.sendRedirect("login.jsp");
        }
        
        
        
    }

}
