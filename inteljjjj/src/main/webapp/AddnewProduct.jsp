<%@page import="DTO.Category"%>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Dashboard - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="Admincss/styles.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.js"></script>
    <script type="text/javascript" src="http://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html"></a>
    <!-- Sidebar Toggle-->
</nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Core</div>
                    <a class="nav-link active" href="AdminPage.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                       Product
                    </a>
                     <a class="nav-link" href="CatePages.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                      category
                    </a>
                    <div class="sb-sidenav-menu-heading"></div>
                    <a class="nav-link" href="logoutServlet">
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        Logout
                    </a>
                </div>
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <h1>Add New</h1>
            <div class="container-fluid px-4">
                <form action="AdminServlet" method="post">
                  
                    <div class="form-row">
                        <div class="form-group">
                            <label for="inputEmail4">Product Name</label>
                            <input name="name" type="text" class="form-control" id="inputEmail4">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputAddress">Image</label>
                        <input name="img" type="text" class="form-control" id="inputAddress">
                    </div>
                    <div class="form-group">
                        <label for="inputAddress">Description</label>
                        <input name="Des" type="text" class="form-control" id="inputAddress16">
                    </div>
                    <div class="form-group">
                        <label for="inputAddress2">Price</label>
                        <input name="price" type="text" class="form-control" id="inpu2">
                    </div>
                      <div class="form-group">
                        <label for="inputAddress2">quantity</label>
                        <input name="quantity" type="number" class="form-control" id="inputAddress15" >
                          <label for="inputAddress2">Category</label>
                          <select class="form-control" name="cate">
                              <%
                              ArrayList<Category> arrayList = DAO.CategoryDAO.getAllCategory();
                              for(Category category : arrayList){
                                  %>
                                  <option value="<%=category.getCategoryID()%>"><%=category.getCategoryName()%></option>
                              <%
                              }
                              %>
                          </select>
                                <label for="inputAddress2">usingDate</label>
                        <input name="usingDate" type="number" class="form-control" id="inputAddress2" >
                    </div>
                    <button name="Add" value="add" type="submit" class="btn btn-primary">Add</button>
                </form>
            </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2021</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<script type="text/javascript">
</script>
</body>
</html>
