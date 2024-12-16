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
 <!--bootstrap 5-->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
 <!--Jquery-->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script>
    $(document).ready(()=>{
        const avatarFile = $("#avatarFile");
        avatarFile.change(function(e){
            const imgUrl = URL.createObjectURL(e.target.files[0]);
            $("#avatarPreview").attr("src",imgUrl);
            $("#avatarPreview").css({"display":"block"});
        });
    });
 </script>
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
        <div id="content-wrapper" class="d-flex flex-column" >

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
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                    <div class="mt-5">
                      <div class="row">
                          <div class="col-md-6 col-12 mx-auto">

                            <c:set var="errorEmail">
                                <form:errors path="email" cssClass="invalid-feedback"/>
                            </c:set>
                            <c:set var="errorPassword">
                                <form:errors path="password" cssClass="invalid-feedback"/>
                            </c:set>
                            <c:set var="errorFullName">
                                <form:errors path="fullName" cssClass="invalid-feedback"/>
                            </c:set>
                            <c:set var="errorPhone">
                                <form:errors path="phone" cssClass="invalid-feedback"/>
                            </c:set>
                              <!-- <h2>Welcome Bro</h2> -->
                              <h3 class="text-center">Create new account</h3>
                              <hr/>
                              <form:form class="row" method="post" action="/admin/user/create" 
                                    modelAttribute="newUser"
                                    enctype="multipart/form-data">
                                  <div class="mb-3 col-12 col-md-6">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' : ''}" path="email" 
                                    aria-describedby="emailHelp" placeholder="Enter email"/>
                                    ${errorEmail}
                                    
                                  </div>
                              
                                  <div class="mb-3 col-12 col-md-6">
                                    <label for="exampleInputPassword1">Password</label>
                                    <form:input type="password" class="form-control ${not empty errorPassword ? 'is-invalid' : ''}" path="password" placeholder="Password"/>
                                    ${errorPassword}
                                </div>
              
                                  <div class="mb-3 col-12 col-md-6">
                                      <label for="exampleInputPassword1">Phone number:</label>
                                      <form:input type="text" path="phone" class="form-control" placeholder="Your phone number"/>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                      <label for="exampleInputPassword1">Full Name:</label>
                                      <form:input type="text" path="fullName" class="form-control ${not empty errorFullName ? 'is-invalid' : ''}" placeholder="Your full name"/>
                                        ${errorFullName}
                                    </div>
                                    <div class="mb-3 col-12">
                                      <label for="exampleInputPassword1">Address:</label>
                                      <form:input type="text" path="address" class="form-control" placeholder="Your address"/>
                                    </div>

                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Role:</label>
                                        <form:select class="form-select form-select-md mb-3" path="role.name">
                                            <option selected>Open this select menu</option>
                                            <form:option value="Admin" >Administrator</form:option>
                                            <form:option value="User">User</form:option>
                                            <form:option value="Hr">Human resource</form:option>
                                          </form:select>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label for="avatarFile" class="form-label">Avatar:</label>
                                        <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg" name="hieuFile"/>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <img id="avatarPreview" style="max-height: 250px; display: none;" alt="avatar preview">
                                    </div>
                                   <div class="col-12 mb-5">
                                    <button type="submit" style="width: 100%;" class="btn btn-primary">Create now</button>
                                   </div>
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




</body>

</html>