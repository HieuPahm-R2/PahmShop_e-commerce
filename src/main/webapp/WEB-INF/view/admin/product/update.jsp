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
   
    <!--Jquery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- Custom styles for this template-->
    <link href="/css/style.css" rel="stylesheet">
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            const orgImage = "${newProduct.image}";
            if(orgImage){
                const urlImage = "/images/product/" + orgImage;
                $("#avatarPreview").attr("src", urlImage);
                $("#avatarPreview").css({"display" : "block"});
            }
            avatarFile.change(function (e){
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({"display" : "block"});
            });
        });
    </script>

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
                    <h1 class="mt-4">Update product info </h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin/product"> Product info</a></li>
                        <li class="breadcrumb-item active">Update product information</li>
                    </ol>
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <!-- <h2>Welcome Bro</h2> -->
                                <h3 class="text-center">UPDATE New Product</h3>
                                <hr/>
                                <form:form class="row" method="post" action="/admin/product/update" 
                                      modelAttribute="newProduct"
                                      enctype="multipart/form-data">
                                      <c:set var="errorName">
                                          <form:errors path="name" cssClass="invalid-feedback"/>
                                      </c:set>
                                      <c:set var="errorPrice">
                                          <form:errors path="price" cssClass="invalid-feedback"/>
                                      </c:set>
                                      <c:set var="errorDetailDesc">
                                          <form:errors path="detailDesc" cssClass="invalid-feedback"/>
                                      </c:set>
                                      <c:set var="errorShortDesc">
                                          <form:errors path="shortDesc" cssClass="invalid-feedback"/>
                                      </c:set>
                                      <c:set var="errorQuantity">
                                          <form:errors path="quantity" cssClass="invalid-feedback"/>
                                      </c:set>
                                    <div class="mb-3 col-12 col-md-6">
                                      <label for="exampleInputEmail1">Product Name:</label>
                                      <form:input type="text" class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                      path="name"/>
                                      ${errorName}
                                    </div>
                                
                                    <div class="mb-3 col-12 col-md-6">
                                      <label for="exampleInputPassword1">Price:</label>
                                      <form:input type="text" class="form-control ${not empty errorPrice ? 'is-invalid' : ''}" 
                                      path="price" placeholder="xx.000.000 VND"/>
                                      ${errorPrice}
                                    </div>
                
                                    <div class="mb-3 col-12">
                                        <label for="exampleInputPassword1">Detail Description:</label>
                                        <form:input type="text" path="detailDesc" class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}" />
                                        ${errorDetailDesc}
                                      </div>
                                      <div class="mb-3 col-12 col-md-6">
                                        <label for="exampleInputPassword1">Short Description:</label>
                                        <form:input type="text" path="shortDesc" class="form-control" />
                                      </div>
                                      <div class="mb-3 col-12 col-md-6">
                                        <label for="exampleInputPassword1">Quantity:</label>
                                        <form:input type="text" path="quantity" class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"/>
                                      ${errorQuantity}
                                      </div>
  
                                      <div class="mb-3 col-12 col-md-6">
                                          <label class="form-label">Manufacture:</label>
                                          <form:select class="form-select form-select-md mb-3" path="factory">
                                              <option selected>Open this select menu</option>
                                              <form:option value="Apple" >Apple</form:option>
                                              <form:option value="Samsung">Samsung</form:option>
                                              <form:option value="DELL">DELL</form:option>
                                              <form:option value="Huawei">Huawei</form:option>
                                              <form:option value="Xiaomi">Xiaomi</form:option>
                                              <form:option value="ASUS">ASUS</form:option>
                                            </form:select>
                                      </div>
                                      <div class="mb-3 col-12 col-md-6">
                                          <label class="form-label">Target:</label>
                                          <form:select class="form-select form-select-md mb-3" path="target">
                                              <option selected>Open this select menu</option>
                                              <form:option value="Admin" >Gaming</form:option>
                                              <form:option value="Graphic design">Graphic design</form:option>
                                              <form:option value="Hr">office tasks</form:option>
                                              <form:option value="Hr">Business</form:option>
                                              <form:option value="mining coins">mining coins</form:option>
                                              <form:option value="Watch movies">Watch movies</form:option>
                                            </form:select>
                                      </div>
                                      <div class="mb-3 col-12 col-md-6">
                                          <label for="avatarFile" class="form-label">Illustrations:</label>
                                          <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg, .webp" name="hieuFile"/>
                                      </div>
                                      <div class="col-12 mb-3">
                                          <img id="avatarPreview" style="max-height: 250px; display: none;" alt="avatar preview">
                                      </div>
                                     <div class="col-12 mb-5">
                                      <button type="submit" style="width: 100%;" class="btn btn-primary">Update now</button>
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