<%-- 
    Document   : login
    Created on : Mar 7, 2022, 4:03:46 PM
    Author     : crrtt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

    </head>
    <body>
        <section class="vh-100" style="background-color: #508bfc;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <form action="loginServlet" method="POST">
                                    <h3 class="mb-5">Sign in</h3>
                                    <%
                                        try {
                                            String errorLogin = session.getAttribute("loginError").toString();
                                            if (!errorLogin.isEmpty()) {
                                    %>
                                    <div class="alert alert-warning">
                                        ${loginError}
                                    </div>
                                    <%
                                            }
                                        } catch (Exception e) {
                                        }
                                    %>

                                    <div class="form-outline mb-4">
                                        <input required="" name="Email" type="email" id="typeEmailX-2" class="form-control form-control-lg" placeholder="Email"/>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input required="" name="password" type="password" id="typePasswordX-2" class="form-control form-control-lg" placeholder="Password"/>
                                    </div>

                                    <!-- Checkbox -->
                                    <div class="form-check d-flex justify-content-start mb-4">
                                        <a href="register.jsp" class="form-check-label" for="form1Example3">Register</a>
                                    </div>
                                    <button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
