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

                    <h1 class="h3 mb-0 text-gray-800">Products</h1>
                    <div class="mt-5">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3>Table Users</h3>
                                            <a href="/admin/product/create" class="btn btn-primary">Add new user</a>
                                        </div>
                                        <hr/>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                              <tr>
                                                <th scope="col"> ID</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Manufacture</th>
                                                <th scope="col">Status Action</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="product" items="${products}">
                                                    <tr>
                                                        <td style="text-align: center">${product.id}</td>
                                                        <td>${product.name}</td>
                                                        <td style="text-align: center">${product.price}</td>
                                                        <td style="text-align: center">${product.factory}</td>
                                                        <td>
                                                            <a href="/admin/product/${product.id}" class="btn btn-success">View</a>
                                                            <a href="/admin/product/update/${product.id}" class="btn btn-warning">Update</a>
                                                            <a href="/admin/product/delete/${product.id}" class="btn btn-danger">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                          </table>
                                    </div>
                                </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

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
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="js/jquery.easing.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.js"></script>

    <!-- Page level plugins -->
    <script src="js/Chart.js"></script>

    <!-- Page level custom scripts -->


</body>

</html>