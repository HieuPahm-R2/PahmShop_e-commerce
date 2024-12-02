<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update user</title>
    <!--bootstrap 5-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!--Jquery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- <link rel="stylesheet" href="/css/demo.css"> -->
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 col-12 mx-auto">
                <!-- <h2>Welcome Bro</h2> -->
                <h3 class="text-center">Delete user account</h3>
                <hr/>
                <form:form method="post" action="/admin/user/delete" modelAttribute="newUser">
				<p><c:out value="Are you sure you want to delete product with the ID of ${user.id}?" /></p>
                <div class="form-group mb-3" style="display: none">
                    <label class="form-label">Id:</label>
                    <form:input type="text" value="${id}" class="form-control" path="id"/>
                </div>
				<ul class="list-inline">
					<li><a class="btn btn-primary" href="/admin/user">Cancel</a></li>
					<li><button type="submit" class="btn btn-danger mt-2">Delete Product</button></li>
				</ul>
                </form:form>


                
            </div>
        </div>
    </div>
</body>
</html>