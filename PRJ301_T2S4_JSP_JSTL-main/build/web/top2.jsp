<%-- 
    Document   : top2
    Created on : Jul 13, 2023, 3:57:26 PM
    Author     : ACER
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${requestScope.data != null}">
                <c:if test="${not empty requestScope.data}">
                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>User ID</th>
                                <th>Full Name</th>
                                <th>Role ID</th>
                               
                               
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${requestScope.data}" varStatus="counter">
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
                                    
                                    
                                </tr>
                            </form>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
    </body>
</html>
