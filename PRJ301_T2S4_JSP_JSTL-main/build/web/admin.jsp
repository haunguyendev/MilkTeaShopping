<%-- 
    Document   : admin
    Created on : May 29, 2023, 4:48:16 PM
    Author     : hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
                padding: 20px;
                font-family: Arial, sans-serif;
            }
            
            h1 {
                margin-bottom: 20px;
            }
            
            .welcome-message {
                margin-bottom: 20px;
            }
            
            .form-container {
                margin-bottom: 20px;
            }
            
            table {
                width: 100%;
                border-collapse: collapse;
            }
            
            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            
            .form-actions {
                margin-top: 10px;
            }
            
            .form-actions button {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Admin World!</h1>
            
            <div class="welcome-message">
                Welcome: ${sessionScope.LOGIN_USER.userID}
            </div>

            <form action="MainController" class="form-container">
                <div class="form-group">
                    <label for="search">Search</label>
                    <input type="text" class="form-control" id="search" name="search" value="${param.search}" />
                </div>
                <button type="submit" name="action" value="Search" class="btn btn-primary">Search</button>
            </form>

            
            <c:url var="logoutLink" value="MainController">
                <c:param name="action" value="Logout"></c:param>
            </c:url>
            <a href="${logoutLink}" class="btn btn-link">Logout</a>

            <c:if test="${requestScope.LIST_USER != null}">
                <c:if test="${not empty requestScope.LIST_USER}">
                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>User ID</th>
                                <th>Full Name</th>
                                <th>Role ID</th>
                                <th>Password</th>
                                <th>Update</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${requestScope.LIST_USER}" varStatus="counter">
                            <form action="MainController" method="POST">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>
                                        <input type="text" name="userID" value="${user.userID}" readonly class="form-control" />
                                    </td>
                                    <td>
                                        <input type="text" name="fullName" value="${user.fullName}" required class="form-control" />
                                    </td>
                                    <td>
                                        <input type="text" name="roleID" value="${user.roleID}" ${user.roleID eq 'AD'?"readonly":""} required class="form-control" />
                                    </td>
                                    <td>${user.password}</td>
                                    <td>
                                        <button type="submit" name="action" value="UpdateProduct" class="btn btn-primary">Update</button>
                                        
                                        
                                        <input type="hidden" name="search" value="${param.search}" />
                                    </td>
                                    <td>
                                        <c:url var="removeLink" value="MainController">
                                            <c:param name="action" value="Delete"></c:param>
                                            <c:param name="userID" value="${user.userID}"></c:param>
                                            <c:param name="search" value="${param.search}"></c:param>
                                        </c:url>
                                        <a href="${removeLink}" class="btn btn-link">Remove</a>
                                    </td>
                                </tr>
                            </form>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
            ${requestScope.ERROR}
        </div>
    </body>
</html>
