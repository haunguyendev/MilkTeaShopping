<%-- 
    Document   : create
    Created on : Jun 8, 2023, 3:33:28 PM
    Author     : hoang
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        
        .container {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 100px;
        }
        
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .form-container h4 {
            margin-bottom: 20px;
        }
        
        .form-error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h4>Create new user:</h4>
            <form action="MainController" method="POST">
                <div class="form-group">
                    <label for="userID">User ID</label>
                    <input type="text" class="form-control" id="userID" name="userID" required>
                    <span class="form-error">${requestScope.USER_ERROR.userIDError}</span>
                </div>
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                    <span class="form-error">${requestScope.USER_ERROR.fullNameError}</span>
                </div>
                <div class="form-group">
                    <label for="roleID">Role ID</label>
                    <input type="text" class="form-control" id="roleID" name="roleID" value="US" readonly>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="confirm">Confirm</label>
                    <input type="password" class="form-control" id="confirm" name="confirm" required>
                    <span class="form-error">${requestScope.USER_ERROR.confirmError}</span>
                </div>
                <button type="submit" name="action" value="Create" class="btn btn-primary">Create</button>
                <button type="reset" class="btn btn-secondary">Reset</button>
                ${requestScope.ERROR}
            </form>
        </div>
    </div>
</body>
</html>

