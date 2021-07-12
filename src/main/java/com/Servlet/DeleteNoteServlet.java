/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.DAO.NoteDAO;
import com.Db.DBConnect;
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
@WebServlet(name = "DeleteNoteServlet", urlPatterns = {"/DeleteNoteServlet"})
public class DeleteNoteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Integer noteId = Integer.parseInt(request.getParameter("note_id"));
            
            NoteDAO dao = new NoteDAO(DBConnect.getConn());
            boolean f = dao.deleteNote(noteId);
            
            if(f){
                HttpSession session = request.getSession();
                session.setAttribute("delete-msg", "Deleted Successfully");
                response.sendRedirect("../Enotes/showNotes.jsp");
            }else{
            
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
    }


}
