<%@page import="DTO.Category"%>
<%@page import="DTO.Product"%>
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
    <script src="Adminjs/scripts.js"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html">Vegetable</a>
    <!-- Sidebar Toggle-->
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Core</div>
                    <a class="nav-link " href="AdminPage.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                       Product
                    </a>
                     <a class="nav-link active" href="#">
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
            <div class="container-fluid px-4">
                <h1>List Vegetable</h1>
                <h3><a href="addnewcate.jsp">Creat New</a></h3>
                <table id="table_id" class="display">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Img</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Category> news = DAO.CategoryDAO.getAllCategory();
                        for (Category listnew:news
                        ) {
                    %>
                    <tr>
                        <td><%=listnew.getCategoryID()%></td>
                        <td><%=listnew.getCategoryName()%></td>
                        <td><a href="CateAdminServlet?mid=<%=listnew.getCategoryID()%>&&action=delete" >Delete </a> <a href="CateAdminServlet?mid=<%=listnew.getCategoryID()%>&&action=details">Update</a></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
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
    jQuery(document).ready( function () {
        jQuery('#table_id').DataTable();
    } );
    let table = new DataTable('#table_id', {
        // options
    });
</script>
</body>
</html>
    