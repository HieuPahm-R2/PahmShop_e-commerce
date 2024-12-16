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
                    <h1 class="mt-4">Update Users</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin/user">user info</a></li>
                        <li class="breadcrumb-item active">Update user information</li>
                    </ol>
                    <div class="mt-5">
                      <div class="row">
                          <div class="col-md-6 col-12 mx-auto">
                              <!-- <h2>Welcome Bro</h2> -->
                              <h3 class="text-center">Update user information</h3>
                              <hr/>
                              <form:form method="post" action="/admin/user/update" modelAttribute="newUser">
                                  <div class="form-group mb-3" style="display: none;">
                                      <label class="form-label">Id:</label>
                                      <form:input type="text"  disabled="true" class="form-control" path="id"/>
                                  </div>
              
                                  <div class="form-group mb-3">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <form:input type="email" class="form-control" path="email" placeholder="Enter email"/>
                                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                                  </div>
                              
                                  <div class="form-group mb-3">
                                    <label for="exampleInputPassword1">Password</label>
                                    <form:input type="password" class="form-control" path="password" placeholder="Password"/>
                                  </div>
              
                                  <div class="form-group mb-3">
                                      <label for="exampleInputPassword1">Phone number:</label>
                                      <form:input type="text" path="phone" class="form-control" placeholder="Your phone number"/>
                                    </div>
                                    <div class="form-group mb-3">
                                      <label for="exampleInputPassword1">Full Name:</label>
                                      <form:input type="text" path="fullName" class="form-control" placeholder="Your full name"/>
                                    </div>
                                    <div class="form-group mb-3">
                                      <label for="exampleInputPassword1">Address:</label>
                                      <form:input type="text" path="address" class="form-control" placeholder="Your address"/>
                                    </div>
                                  <button type="submit" class="btn btn-warning">Submit new Update</button>
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
    <script src="/js/jquery.js"></script>
    <script src="/js/bootstrap.bundle.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/js/jquery.easing.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.js"></script>




</body>

</html>