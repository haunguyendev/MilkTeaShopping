<%-- 
    Document   : home
    Created on : Jul 6, 2023, 4:43:49 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/style.css?version=42113" />
    <title>Tien's farm</title>
  </head>
  <body>
    <div class="header container-fluid">
      <div class="row justify-content-md-between">
        <div class="col-md-3">
          <img src="images/MilkTea (1).png" alt="logo" class="logo-img" />
        </div>
        <div class="col-md-3">
          <img src="images/logo-center.png" alt="" class="logo-img" />
        </div>
        <c:if test="${sessionScope.LOGIN_USER!=null}">
        <c:if test="${(sessionScope.LOGIN_USER.roleID eq 'US')}">
           <div class="login-nav col-md-4 text-end py-5 px-5">
          <div class="dropdown">
            <a
              class="btn btn-secondary dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              style="background-color: aliceblue; color: #333"
            >
              Hi,${sessionScope.LOGIN_USER.fullName}
            </a>

            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="user.jsp">Management Profile</a></li>
             <c:url var="logoutLink" value="MainController">
                <c:param name="action" value="Logout"></c:param>
            </c:url>
              <li><a class="dropdown-item" href="${logoutLink}">Logout</a></li>
            </ul>
          </div>
            <a href="view_cart.jsp" class="btn text-dark">
                            <i class="bi bi-cart-fill"></i>
                            <span class="badge bg-secondary">${size}</span>
                        </a>
        </div>
        </c:if>
          <c:if test="${(sessionScope.LOGIN_USER.roleID eq 'AD')}">
             <div class="login-nav col-md-4 text-end py-5 px-5">
          <div class="dropdown">
            <a
              class="btn btn-secondary dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              style="background-color: aliceblue; color: #333"
            >
              Hi,${sessionScope.LOGIN_USER.fullName}
            </a>

            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="user.jsp">Management Profile</a></li>
              <li><a class="dropdown-item" href="MainController?action=admin.jsp">Management Users</a></li>
              <li><a class="dropdown-item" href="ManagementGetAllProductController">Management Products</a></li>
              <c:url var="logoutLink" value="MainController">
                <c:param name="action" value="Logout"></c:param>
            </c:url>
              <li><a class="dropdown-item" href="${logoutLink}">Logout</a></li>
            </ul>
          </div>
            <a href="view_cart.jsp" class="btn text-dark">
                            <i class="bi bi-cart-fill"></i>
                            <span class="badge bg-secondary">${size}</span>
                        </a>
        </div>
        </c:if>
        </c:if>
          <c:if test="${sessionScope.LOGIN_USER==null}">
              <div class="login-nav col-md-3 text-end py-5 px-5">
          <a href="MainController?action=login.jsp" class="login-link">Login</a>
          <a href="MainController?action=Create" class="register-link">Register</a>
          <a href="view_cart.jsp" class="btn text-dark">
                            <i class="bi bi-cart-fill"></i>
                            <span class="badge bg-secondary">${size}</span>
                        </a>
        </div>
          </c:if>
        
      </div>
    </div>
    <div class="nav-header container">
      <div class="row justify-content-center">
        <div class="col-md-2"></div>
        <div class="col-md-4 text-center">
          <a class="nav-link" href="#">About us</a>
        </div>
        <div class="col-md-4 text-center">
          <a class="nav-link" href="MainController?action=Menu">Menu</a>
        </div>
        <div class="col-md-2"></div>
      </div>
    </div>
    <div class="banner-box container">
      <div class="banner-main-1 row justify-content-between">
        <div class="image-container col-md-6">
          <img src="images/banner1.png" alt="banner1" class="img-banner" />
        </div>
        <div class="col-md-6 align-self-center">
          <h3 class="banner-title">Coffee so awesome</h3>
          <p class="banner-description">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut neque
            qui quae enim, illo nisi, quidem similique voluptates dolor odit
            sequi in, ipsa corporis nam fuga.
          </p>
        </div>
      </div>
      <div class="banner-main-1 row justify-content-between">
        <div class="col-md-6 align-self-center">
          <h3 class="banner-title">Coffee so sweet</h3>
          <p class="banner-description">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut neque
            qui quae enim, illo nisi, quidem similique voluptates dolor odit
            sequi in, ipsa corporis nam fuga.
          </p>
        </div>
        <div class="col-md-6">
          <img src="images/banner2.png" alt="banner1" class="img-banner" />
        </div>
      </div>
    </div>
    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <h4>About Us</h4>
            <p>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga,
              voluptatum.
            </p>
          </div>
          <div class="col-md-4">
            <h4>Contact Us</h4>
            <p>Email: info@milktea.com</p>
            <p>Phone: +1 123 456 7890</p>
            <p>Address: 123 Milk Tea Street, City, Country</p>
          </div>
          <div class="col-md-4">
            <h4>Follow Us</h4>
            <div class="social-icons">
              <a href="#"><i class="fab fa-facebook-f"></i></a>
              <a href="#"><i class="fab fa-instagram"></i></a>
              <a href="#"><i class="fab fa-twitter"></i></a>
            </div>
          </div>
        </div>
        <hr />
        <p class="text-center">© 2023 Milk Tea. All rights reserved.</p>
      </div>
    </footer>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
      integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
      integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
      crossorigin="anonymous"
    ></script>
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  </body>
</html>

