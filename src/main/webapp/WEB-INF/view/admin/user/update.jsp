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
                <h3 class="text-center">Update user information</h3>
                <hr/>
                <form:form method="post" action="/admin/user/update" modelAttribute="newUser">
                    <div class="form-group mb-3">
                        <label class="form-label">Id:</label>
                        <form:input type="text" class="form-control" path="id"/>
                    </div>

                    <div class="form-group mb-3">
                      <label for="exampleInputEmail1">Email address</label>
                      <form:input type="email" class="form-control" disabled="true" path="email" placeholder="Enter email"/>
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
</body>
</html>