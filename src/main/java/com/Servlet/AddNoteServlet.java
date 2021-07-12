/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.DAO.NoteDAO;
import com.Db.DBConnect;
import com.User.Note;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ahmed
 */
@WebServlet(name = "AddNoteServlet", urlPatterns = {"/AddNoteServlet"})
public class AddNoteServlet extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int uid = Integer.parseInt(request.getParameter("uid"));
        String title = request.getParameter("title");
        String desc = request.getParameter("desc");
        
        NoteDAO noteDAO = new NoteDAO(DBConnect.getConn());
        
        boolean f = noteDAO.addNote(title, desc, uid);
        
        if(f){
            System.out.println("INSERT SUCCESS");
            response.sendRedirect("showNotes.jsp");
        }else{
            System.out.println("INSERT ERROR");
        }
        
        
    }

}
