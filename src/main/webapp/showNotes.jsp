<%-- 
    Document   : showNotes
    Created on : Jul 12, 2021, 7:46:04 AM
    Author     : Ahmed
--%>

<%@page import="java.util.List"%>
<%@page import="com.User.Note"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.NoteDAO"%>
<%@page import="com.User.UserDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    UserDetails userDetails1 = (UserDetails) session.getAttribute("user");
    
    if(userDetails1 == null){
        response.sendRedirect("../Enotes/login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Notes</title>
        <%@include file="all_components/allcss.jsp"%>
    </head>
    <body>
        <%@include file="all_components/navbar.jsp" %>
        
        <% 
            
            String updateMsg = (String)session.getAttribute("update-msg");
            if(updateMsg != null){
                %>
                <div class="alert alert-success" role="alert">
                                    <%=updateMsg %>
                                </div>
                <%
                    session.removeAttribute("update-msg");
            }
        %>
        
        <% 
            
            String deleteMsg = (String)session.getAttribute("delete-msg");
            if(deleteMsg != null){
                %>
                <div class="alert alert-success" role="alert">
                                    <%=deleteMsg %>
                                </div>
                <%
                    session.removeAttribute("delete-msg");
            }
        %>
        
        <div class="container">
            <h2 class="text-center">All Notes</h2>
            
            <div class="row">
                
                                         
                            
                <div class="col-md-12">
                    
                             <%  
                                
                                if(userDetails1 != null){
                                    NoteDAO dao = new NoteDAO(DBConnect.getConn());
                                    List<Note> notesList = dao.getNotes(userDetails1.getId());
                                    for(Note note : notesList){
                                        %>
                                        <div class="card mt-3">
                                            <img alt="" src="imgs/edit.png" class="card-img-top mt-2 mx-auto" style="max-width: 100px;">

                                            <div class="card-body p-4">

                                                <h5 class="card-title"><%=note.getTitle()%></h5>
                                                <p><%=note.getDesc()%></p>

                                                <p>
                                                    <b class="text-success">Published By: <%=userDetails1.getName()%></b> </br> <b class="text-primary"> </b>
                                                </p>

                                                <p>
                                                    <b class="text-success">Published Date: <%=note.getDate()%></b> </br> <b class="text-success"> </b>
                                                </p>

                                                <div class="container text-center mt-2">
                                                    <a href="DeleteNoteServlet?note_id=<%= note.getId()%>"" class="btn btn-danger">Delete</a>
                                                    <a href="edit.jsp?note_id=<%= note.getId()%>" class="btn btn-primary">Edit</a>
                                                </div>

                                            </div>

                                        </div>
                                                            <%
                                    }
                                }
                                
                            %>   
                    
                </div>
            </div>
            
        </div>
    </body>
</html>
