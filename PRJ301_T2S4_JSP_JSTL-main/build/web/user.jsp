<%-- 
    Document   : user
    Created on : May 29, 2023, 4:44:04 PM
    Author     : hoang
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>View Profile</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
  </head>
  <body>
    <div class="container">
        <c:if test="${requestScope.EDIT_SUCCESS!=null}"> 
                        <div class="alert alert-success" role="alert">
                            ${requestScope.EDIT_SUCCESS}
                        </div>

                    </c:if>
                    <c:if test="${requestScope.EDIT_ERROR!=null}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.EDIT_ERROR}
                        </div>
                    </c:if>
      <h1 class="mt-4">User's information:</h1>

      <div class="card mt-4">
        <div class="card-body">
          <h5 class="card-title">User ID: ${sessionScope.LOGIN_USER.userID}</h5>

          <form action="EditUserController" method="GET">
            <div class="form-group">
              <label for="fullName">Full Name:</label>
              <input
                type="text"
                class="form-control"
                id="fullName"
                name="fullName"
                value="${sessionScope.LOGIN_USER.fullName}"
                readonly
              />
            </div>

            <div class="form-group">
              <label for="roleID">Role ID:</label>
              <input
                type="text"
                class="form-control"
                id="roleID"
                name="roleID"
                value="${sessionScope.LOGIN_USER.roleID}"
                readonly
              />
            </div>

            <div class="form-group">
              <label for="password">Password:</label>
              <input
                type="password"
                class="form-control"
                id="password"
                name="password"
                value="${sessionScope.LOGIN_USER.password}*************"
                readonly
              />
            </div>
                <input type="hidden" name="id" value="${sessionScope.LOGIN_USER.id}"/>

            <button type="button" class="btn btn-primary" id="editBtn">
              Edit
            </button>
            <button
              type="submit"
              class="btn btn-success"
              id="saveBtn"
              style="display: none"
            >
              Save
            </button>
          </form>
        </div>
      </div>

      <a href="MainController" class="btn btn-secondary mt-4">Back to Home</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
    <script>
      $(document).ready(function () {
        $("#editBtn").click(function () {
          $("#fullName").removeAttr("readonly");
          $("#editBtn").hide();
          $("#saveBtn").show();
        });
      });
    </script>
  </body>
</html>
