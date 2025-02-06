<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- <!DOCTYPE html> -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PahmStudio</title>
      <!-- Google Web Fonts -->
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

      <!-- Icon Font Stylesheet -->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

      <!-- Libraries Stylesheet -->
      <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
      <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

      <!-- Customized Bootstrap Stylesheet -->
      <link href="/client/css/bootstrap.min.css" rel="stylesheet">

      <!-- Template Stylesheet -->
      <link href="/client/css/style.css" rel="stylesheet">
</head>
<body >
    <!-- Spinner Start -->
    <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <!-- Navbar start -->
    <jsp:include page="../layout/header.jsp" />
    <!-- Navbar End -->


    <!-- Fruits Shop Start-->
    <div class="container-fluid fruite py-5" style="background-color: azure;">
        <div class="container py-5">
            <div class="row g-4 mb-5">
                <div>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mt-3">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item active">Filter products</li>
                        </ol>
                    </nav>
                </div>

                <div class="d-flex justify-content-end col-12">
                    <form method="GET" action="http://localhost:8080/products" target="_blank" class="form-inline my-lg-0" style="display: flex;"  >
                            <input type="hidden" value="1" id="k" placeholder="XXX" name="page">
                            <input type="text" id="keyword" placeholder="search" name="name">
                            <button type="submit" class="btn btn-primary mx-2">
                                <i class="fas fa-search"></i>
                            </button>
                    </form>
                </div>

                <div class="row g-4 fruite">
                    <div class="col-12 col-md-4">
                       <div class="row g-4">
                            <div class="col-12">
                                <div class="mb-2"><b>Manufacture</b></div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="factory-1" value="Apple">
                                    <label for="factory-1" class="form-check-label">Apple</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="factory-2" value="Asus">
                                    <label for="factory-2" class="form-check-label">Asus</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="factory-3" value="DELL">
                                    <label for="factory-3" class="form-check-label">DELL</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="factory-4" value="ROG">
                                    <label for="factory-4" class="form-check-label">ROG</label>
                                </div>
                            </div>
                            <!--muc dich su dung-->
                            <div class="col-12">
                                <div class="mb-2"><b>Usage needs</b></div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="target-1" value="Gaming">
                                    <label for="target-1" class="form-check-label">Gaming</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="target-2" value="Design">
                                    <label for="target-2" class="form-check-label">Digital Design</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="target-3" value="Office">
                                    <label for="target-3" class="form-check-label">Office task</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="target-4" value="entertainment">
                                    <label for="target-4" class="form-check-label">amusing</label>
                                </div>
                            </div>
                            <!--Cost price-->
                            <div class="col-12">
                                <div class="mb-2"><b>Cost price</b></div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="price-1" value="Low">
                                    <label for="price-1" class="form-check-label">under 10M VND</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="price-2" value="medium">
                                    <label for="price-2" class="form-check-label">From 10M - 15M VND</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="price-3" value="High">
                                    <label for="price-3" class="form-check-label">From 15 - 22M VND</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="price-4" value="Upto">
                                    <label for="price-4" class="form-check-label">over 23M VND</label>
                                </div>
                            </div>
                             <!--Sort price-->
                             <div class="col-12">
                                <div class="mb-2"><b>Sort price</b></div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" class="form-check-input" id="sort-1" >
                                    <label for="sort-1" class="form-check-label">Sort ascending</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" class="form-check-input" id="sort-2">
                                    <label for="sort-2" class="form-check-label">Sort descending</label>
                                </div>
                             
                            </div>
                            <div class="col-12">
                                <a class="btn btn-primary" href="#" role="button">process filter</a>
                            </div>
                       </div>
                    </div>
                    <div class="col-12 col-md-8 text-center">
                        <div class="row gx-3">
                            <c:forEach var="product" items="${products}">
                                <div class="col-md-7 col-lg-5 col-xl-4">
                                    <div class="rounded position-relative fruite-item">
                                        <div class="fruite-img">
                                            <img src="/images/product/${product.image}" class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Sale %56</div>
                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom" style="background-color: white;">
                                            <a href="/product/${product.id}">
                                                <h4>${product.name}</h4>
                                            </a>
                                            <p>${product.shortDesc}</p>
                                            <div class="d-flex  flex-lg-wrap justify-content-center flex-column">
                                                <p class="text-dark fw-bold mb-3" 
                                                style="width: 100%; text-align: center; font-size: 15px;">
                                                <fmt:formatNumber type="number" value="${product.price}"/> vnd
                                                </p>
                                                <form action="/add-product-to-cart/${product.id}" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                    <button class="mx-auto border border-secondary rounded-pill px-3 text-primary">
                                                        <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-12 mx-auto">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                          <li class="page-item">
                            <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}" 
                            href="/products?page=${currentPage - 1}" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </li>
                          <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                            <li class="page-item">
                                <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                href="/products?page=${loop.index + 1}">${loop.index + 1}</a>
                            </li>
                          </c:forEach>
                     
                          <li class="page-item">
                            <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}" 
                            href="/products?page=${currentPage + 1}" 
                            aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </a>
                          </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Fruits Shop End-->

   
    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

    
<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script> -->
<script src="/client/lib/easing/easing.min.js"></script>
<script src="/client/lib/waypoints/waypoints.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
</body>
<footer>
      <!-- Footer Start -->
    <!-- Footer End --> <!-- Copyright Start -->
    <jsp:include page="../layout/footer.jsp" />
    <!-- Copyright End -->
</footer>
</html>