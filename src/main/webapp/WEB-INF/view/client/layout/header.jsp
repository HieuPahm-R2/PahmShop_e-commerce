<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="container-fluid fixed-top">
    <!-- <div class="container topbar d-none d-lg-block" style="background-color: aqua;">
        <div class="d-flex justify-content-between">
            <div class="top-info ps-2">
                <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">Sale all up to 89%</a></small>
                <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Happy new year 2025</a></small>
            </div>
            <div class="top-link pe-2">
                    <a href="#" class="text-white"><small class="text-white mx-2">Merry Christmas 2024</small>/</a>
                    <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
            </div>
        </div>
    </div> -->

    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="/" class="navbar-brand"><img style="width: 150px;" src="/client/img/clover.png"></img></a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white justify-content-between mx-5" id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="shop-detail.html" class="nav-item nav-link">Products Detail</a>
                    
                    <a href="#" class="nav-link nav-item">Pages</a>
                    <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="/" class="dropdown-item">Cart</a>
                            <a href="/" class="dropdown-item">Chackout</a>
                            <a href="/" class="dropdown-item">Testimonial</a>
                    </div>
                    <a href="/" class="nav-item nav-link">Contact</a>
                </div>
                <div class="d-flex m-3 me-0">
                    <c:if test="${not empty pageContext.request.userPrincipal}">
                        <a href="/cart" class="position-relative me-4 my-auto">
                        <i class="fa fa-shopping-bag fa-2x"></i>
                        <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" 
                        style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${sessionScope.sum}</span>
                        </a>
                        <div class="dropdown">
                            <a href="#" class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user fa-2x"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">
                                <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                    <img src="/client/img/${sessionScope.avatar}" style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;" alt="">
                                    <div class="text-center my-3">
                                        <c:out value="${sessionScope.fullname}"/>
                                    </div>
                                </li>
                                <li><a class="dropdown-item" href="#">Detailed information</a></li>
                                
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                                <li>
                                    <form action="/logout" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        <button class="dropdown-item">Logout</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </c:if>
                    <c:if test="${empty pageContext.request.userPrincipal}">
                        <button class="btn btn-primary">
                            <a href="/login">Sign in</a>
                        </button>
                        <button class="mx-3 btn btn-secondary">Sign up</button>
                    </c:if>
                </div>
            </div>
        </nav>
    </div>
</div>