<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item active">Detail information product</li>
                    </ol>
                    <div class="mt-5">
                        <div class="row">
                            <div class="d-flex justify-content-between">
                                <h3>Detailed product information </h3>
                            </div>
                            <div class="col-12 mx-auto d-flex">
                                <hr/>
                                <div class="image_display col-6 mb-2" style="width: 40%; border-radius: 10px; background-size: cover;">
                                    <img src="/images/product/${product.image}" class="card-img-top" alt="">
                                </div>
                                <div class="card col-6" style="width: 100%">
                                    <div class="card-header">
                                      Product information of ${id}
                                    </div>
                                    <ul class="list-group list-group-flush " >
                                      <li class="list-group-item">Id : ${product.id}</li>
                                      <li class="list-group-item">Product name:  ${product.name}</li>
                                      <li class="list-group-item" >Detail description:  ${product.detailDesc}</li>
                                      <li class="list-group-item">Price:  ${product.price}</li>
                                      <li class="list-group-item">
                                        <a href="/admin/product" class="btn btn-success mt-3">Back to Dashboard</a>
                                      </li>
                                    </ul>
                                  </div>
                                
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

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/js/jquery.js"></script>
    <script src="/js/bootstrap.bundle.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/js/jquery.easing.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.js"></script>

    <!-- Page level plugins -->
    <script src="/js/Chart.js"></script>



</body>

</html>