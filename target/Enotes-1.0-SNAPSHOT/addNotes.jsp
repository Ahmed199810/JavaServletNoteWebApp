<%-- 
    Document   : addNotes
    Created on : Jul 12, 2021, 5:43:54 AM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    UserDetails userDetails2 = (UserDetails) session.getAttribute("user");
    
    if(userDetails2 == null){
        response.sendRedirect("../Enotes/login.jsp");
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Notes</title>
        <%@include file="all_components/allcss.jsp" %>
    </head>
    <body>
        
        <div class="container-fluid p-0">
            <%@include file="all_components/navbar.jsp" %>
            
            
            <h1 class="text-center">Add Your Notes</h1>
            
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <form action="AddNoteServlet" method="post">
                            <div class="form-group">
                                
                                <% 
                                    UserDetails ud1 = (UserDetails)session.getAttribute("user");
                                    if(ud1 != null){
                                        %>
                                            <input type="hidden" value="<%= ud1 == null ? null : ud1.getId()%>" name="uid">
                                        <%
                                    }
                                %>
                                
                                
                                <input name="title" required="required" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Title">
                            </div>
                            <div class="form-group">
                                <textarea name="desc" required="required" rows="6" class="form-control" placeholder="Enter Description"></textarea>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary">Add Note</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
    </body>
</html>
