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
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html">Admin</a>
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
            <h1>Update</h1>
            <div class="container-fluid px-4">
                <%Product product = (Product) request.getAttribute("product");%>
               <div class="container-fluid px-4">
                <form action="AdminServlet" method="post">
                  <input name="id" value="<%=product.getProductID()%>" HIDDEN>
                    <input name="importday" value="<%=product.getImportDate()%>" HIDDEN>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="inputEmail4">Product Name</label>
                            <input name="name" value="<%=product.getProductName()%>" type="text" class="form-control" id="inputEmail4">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputAddress">Image</label>
                        <input name="img" value="<%=product.getImage()%>" type="text" class="form-control" id="inputAddress">
                    </div>
                    <div class="form-group">
                        <label for="inputAddress">Description</label>
                        <input name="Des" value="<%=product.getDes()%>" type="text" class="form-control" id="inputAddress16">
                    </div>
                    <div class="form-group">
                        <label for="inputAddress2">Price</label>
                        <input name="price" value="<%=product.getPrice()%>" type="text" class="form-control" id="inpu2">
                    </div>
                      <div class="form-group">
                        <label for="inputAddress2">quantity</label>
                        <input name="quantity" value="<%=product.getQuantity()%>" type="number" class="form-control" id="inputAddress2" >
                          <label for="inputAddress2">Category</label>
                          <select class="form-control" name="cate">
                              <%
                              ArrayList<Category> arrayList = DAO.CategoryDAO.getAllCategory();
                              for(Category category : arrayList){
                                  if(category.getCategoryID() == product.getCategoryID()){
                                      %>
                                      <option selected="" value="<%=category.getCategoryID()%>"><%=category.getCategoryName()%></option>
                              <%
                                  }else{
                                  %>
                                  <option value="<%=category.getCategoryID()%>"><%=category.getCategoryName()%></option>
                              <%
                              }}
                              %>
                          </select>
                                <label for="inputAddress2">usingDate</label>
                                <input name="usingDate" value="<%=product.getUsingDate()%>" type="text" class="form-control" id="inputAddress2" >
                    </div>
                    <button name="Update" value="update" type="submit" class="btn btn-primary">Add</button>
                </form>
            </div>
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
