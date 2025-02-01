<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Product Cart</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="/client/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/client/css/style.css" rel="stylesheet">
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


    <!-- Navbar start -->
    <jsp:include page="../layout/header.jsp" />
    <!-- Navbar End -->

        <!-- Modal Search End -->


        <!-- Single Page Header start -->
        <div class="container-fluid py-5">
            <h1 class="text-center text-white display-6">Cart</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active text-white" style="color: black;">Cart</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Cart Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">Products</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                            <th scope="col">Handle</th>
                          </tr>
                        </thead>
                        <tbody>
                            <c:if test="${cartDetails != null}">
                                <c:forEach var="cartDetail" items="${cartDetails}">
                                <tr>
                                    <th scope="row">
                                        <div class="d-flex align-items-center">
                                            <img src="/images/product/${cartDetail.product.image}"
                                             class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                                        </div>
                                    </th>
                                    <td>
                                        <p class="mb-0 mt-4">
                                            <a href="/product/${cartDetail.product.id}" target="_blank">${cartDetail.product.name}</a>
                                        </p>
                                    </td>
                                    <td>
                                        <p class="mb-0 mt-4">
                                            <fmt:formatNumber type="number" value="${cartDetail.product.price}"/>vnd
                                        </p>
                                    </td>
                                    <td>
                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                            <input type="text" class="form-control form-control-sm text-center border-0" 
                                            value="${cartDetail.quantity}"
                                            data-cartDetail-id="${cartDetail.id}"
                                            data-cartDetail-price="${cartDetail.price}"
                                            data-cartDetail-index="${status.index}">
                                        </div>
                                    </td>
                                    <td>
                                        <p class="mb-0 mt-4" data-cartDetail-id="${cartDetail.id}">
                                            <fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity}"/>vnd
                                        </p>
                                    </td>
                                    <td>
                                        <form action="/delete-cartProduct/${cartDetail.id}" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        </form>
                                    </td>
                                </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                </div>
                <form:form action="/place-order " method="post" modelAttribute="cart">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="mt-5 justify-content-start">
                            <div class="col-12 col-md-6">
                                <div class="p-4">
                                    <h5>Customer's order</h5>
                                    <div class="row">
                                        <div class="col-12 form-group mb-3">
                                            <label>Name</label>
                                            <input class="form-control" name="receiverName" required/>
                                        </div>
                                        <div class="col-12 form-group mb-3">
                                            <label>Address</label>
                                            <input class="form-control" name="receiverName"required />
                                        </div>
                                        <div class="col-12 form-group mb-3">
                                            <label>Phone number</label>
                                            <input class="form-control" name="receiverPhone" required />
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </form:form>
               
                <!--sum table-->
              
                    <div class="col-12 col-md-6">
                        <div class="bg-light rounded">
                            <div class="p-4">
                                <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
                                <div class="d-flex justify-content-between mb-4">
                                    <h5 class="mb-0 me-4">Subtotal:</h5>
                                    <p class="mb-0" data-cartTotal-price="${totalPrice}">
                                        <fmt:formatNumber type="number" value="${totalPrice}"/>vnd
                                    </p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h5 class="mb-0 me-4">Shipping</h5>
                                    <div class="">
                                        <p class="mb-0">Flat rate: 0</p>
                                    </div>
                                </div>
                            </div>
                            <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                <h5 class="mb-0 ps-4 me-4">Total</h5>
                                <p class="mb-0 pe-4" data-cartTotal-price="${totalPrice}">
                                    <fmt:formatNumber type="number" value="${totalPrice}"/>vnd
                                </p>
                            </div>
                          
                            <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="button">Proceed Checkout</button>
                        </div>
                    </div>
          
            </div>
        </div>
        <!-- Cart Page End -->


       <!-- Footer End --> <!-- Copyright Start -->
        <jsp:include page="../layout/footer.jsp" />

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/lib/easing/easing.min.js"></script>
<script src="/client/lib/waypoints/waypoints.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/client/js/main.js"></script>
    </body>

</html>