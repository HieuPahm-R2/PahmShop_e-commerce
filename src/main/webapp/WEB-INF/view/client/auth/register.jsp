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

    <title>Pahm Studio - Register</title>

    <!-- Custom fonts for this template-->
    <link href="/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body style="background-color: #afd4d9;
background-image: linear-gradient(270deg, #afd4d9 0%, #97D9E1 50%, #ffffff 100%);
">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block  bg-register-image">
                        <img src="/images/admin/registerImg.jpg" style="width: 110%; height: 110%; object-fit: contain;" alt="">
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form:form class="user" method="post" action="/register"
                                 modelAttribute="registerUser">
                                 <!--init error ano-->
                                <c:set var="errorPassword">
                                    <form:errors path="confirmPassword" cssClass="invalid-feedback"/>
                                </c:set>
                                <c:set var="errorEmail">
                                    <form:errors path="email" cssClass="invalid-feedback"/>
                                </c:set> 
                                <!--end-->
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <form:input type="text" class="form-control form-control-user" id="exampleFirstName" path="firstName"
                                            placeholder="First Name.."/>
                                    </div>
                                    <div class="col-sm-6">
                                        <form:input type="text" class="form-control form-control-user" id="exampleLastName"
                                            placeholder="Last Name" path="lastName" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' : ''} 
                                    form-control-user" id="exampleInputEmail"
                                        placeholder="Email Address" path="email" />
                                    ${errorEmail}
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <form:input type="password" class="form-control 
                                        ${not empty errorEmail ? 'is-invalid' : ''}
                                        form-control-user"
                                        id="exampleInputPassword" placeholder="Password" path="password"/>
                                        ${errorPassword}
                                    </div>

                                    <div class="col-sm-6">
                                        <form:input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="Repeat Password" path="confirmPassword"/>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    Register Account
                                </button>
                                <hr>
                                <a href="/" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form:form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="/login">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
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

</body>

</html>