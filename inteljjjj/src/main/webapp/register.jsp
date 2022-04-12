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
        <section class="vh-150" style="background-color: #508bfc;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <form action="registerServlet" method="POST">
                                    <h3 class="mb-5">Register</h3>

                                    <div class="form-outline mb-4">
                                        <input required="" name="fullName" id="typeEmailX-2" class="form-control form-control-lg" placeholder="Full name"/>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input required="" name="password" type="password" id="typePasswordX-2" class="form-control form-control-lg" placeholder="Password"/>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input required="" name="address" id="typeEmailX-2" class="form-control form-control-lg" placeholder="Address"/>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input required="" type="date" name="birthDay" id="typeEmailX-2" class="form-control form-control-lg" placeholder="BirthDay"/>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input required="" name="phone" id="typeEmailX-2" class="form-control form-control-lg" placeholder="Phone"/>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input required="" type="email" name="mail" id="typeEmailX-2" class="form-control form-control-lg" placeholder="Mail"/>
                                    </div>
                                    <button class="btn btn-primary btn-lg btn-block" type="submit">Register</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
