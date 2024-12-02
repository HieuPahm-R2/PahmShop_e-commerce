<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User information</title>
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
            <div class="col-12 mx-auto">
                <div class="d-flex justify-content-between">
                    <h3>Detailed User information </h3>
                </div>
                <hr/>
                <div class="card" style="width: 65%">
                    <div class="card-header">
                      User account information of ${id}
                    </div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">Id : ${user.id}</li>
                      <li class="list-group-item">Email:  ${user.email}</li>
                      <li class="list-group-item">Password:  ${user.password}</li>
                      <li class="list-group-item">FullName:  ${user.fullName} </li>
                      <li class="list-group-item">Address:  ${user.address} </li>
                    </ul>
                  </div>
                  <a href="/admin/user" class="btn btn-success mt-3">Back to Dashboard</a>
                  </table>
            </div>
        </div>
    </div>
</body>