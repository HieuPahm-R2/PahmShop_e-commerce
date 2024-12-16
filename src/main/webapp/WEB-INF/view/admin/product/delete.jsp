<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PahmStudio - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/style.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="../layout/sidebar.jsp" />
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <jsp:include page="../layout/header.jsp" />
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Manage Users</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Product info</a></li>
                        <li class="breadcrumb-item active">Delete product</li>
                    </ol>
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <!-- <h2>Welcome Bro</h2> -->
                                <h3 class="text-center">Delete This Product ?</h3>
                                <hr/>
                                <form:form method="post" action="/admin/product/delete" modelAttribute="newProduct">
                                <p><c:out value="Are you sure you want to delete product with the ID of ${user.id}?" /></p>
                                <div class="form-group mb-3" style="display: none">
                                    <label class="form-label">Id:</label>
                                    <form:input type="text" value="${id}" class="form-control" path="id"/>
                                </div>
                                <ul class="list-inline">
                                    <li><a class="btn btn-primary" href="/admin/product">Cancel</a></li>
                                    <li><button type="submit" class="btn btn-danger mt-2">Delete Product</button></li>
                                </ul>
                                </form:form>
                                
                            </div>
                        </div>
                    </div>
                
                
                </div>
                

                
 

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <jsp:include page="../layout/footer.jsp" />
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="js/jquery.easing.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.js"></script>

    <!-- Page level plugins -->
    <script src="js/Chart.js"></script>

    <!-- Page level custom scripts -->
       <!-- Page level custom scripts -->
    <script src="js/chart-area-demo.js"></script>
    <script src="js/chart-pie-demo.js"></script>
</body>

</html>