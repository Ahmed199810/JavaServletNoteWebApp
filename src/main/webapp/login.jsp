<%-- 
    Document   : login
    Created on : Jul 11, 2021, 10:30:11 PM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="all_components/allcss.jsp"%>

    </head>
    <body>
        <%@include file="all_components/navbar.jsp" %>

        <div class="container-fluid div-color">
            
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-4">
                        <div class="card-header text-center text-white bg-custom">
                            <i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
                            <h4>Login</h4>
                        </div>
                        <%  
                        
                            String failMsg = (String) session.getAttribute("fail-msg");
                            if(failMsg != null){
                                %>
                                <div class="alert alert-danger" role="alert">
                                    <%=failMsg %>
                                </div>
                                <%
                                    session.removeAttribute("fail-msg");
                            }
                        
                        %>
                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <input name="uemail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div>
                                    <div class="form-group">
                                        <input name="upassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <button type="submit" class="btn btn-primary badge-pill btn-block">Submit</button>
                                </form>
                            </div>
                    </div>
                </div>
            </div>
            
        </div>

    </body>
</html>
