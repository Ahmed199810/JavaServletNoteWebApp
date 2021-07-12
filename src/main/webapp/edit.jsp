<%-- 
    Document   : edit
    Created on : Jul 12, 2021, 1:14:08 PM
    Author     : Ahmed
--%>

<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.NoteDAO"%>
<%@page import="com.User.Note"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    UserDetails userDetails3 = (UserDetails) session.getAttribute("user");
    
    if(userDetails3 == null){
        response.sendRedirect("../Enotes/login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Note</title>
        <%@include file="all_components/allcss.jsp"%>
    </head>
    <body>
        
        <% 
            
            Integer noteId = Integer.parseInt(request.getParameter("note_id"));
            NoteDAO dao = new NoteDAO(DBConnect.getConn());
            Note note = dao.getNoteById(noteId);
            
        %>
        
        <div class="container-fluid p-0">
            <%@include file="all_components/navbar.jsp" %>
            
            
            <h1 class="text-center">Edit Your Notes</h1>
            
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <form action="EditNoteServlet" method="post">
                            <div class="form-group">      
                                <input type="hidden" value="<%=noteId%>" name="noteId">
                                <input name="title" value="<%=note.getTitle()%>" required="required" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Title">
                            </div>
                            <div class="form-group">
                                <textarea name="desc" required="required" rows="6" class="form-control" placeholder="Enter Description"><%=note.getDesc()%></textarea>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary">Update Note</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
