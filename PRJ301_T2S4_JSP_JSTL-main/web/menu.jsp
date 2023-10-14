<%-- 
    Document   : menu
    Created on : Jul 6, 2023, 12:47:41 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link
            rel="stylesheet"
            type="text/css"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="css/style.css?version=1233"  />
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <script type="text/javascript">
            function buy(id) {
                var m = 1;
                document.f.action = "BuyController?id=" + id + "&num=" + m;
                document.f.submit();
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <title>Menu</title>
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

                <c:set var="size" value="${sessionScope.size}"/>
                <c:if test="${sessionScope.LOGIN_USER!=null}">
                    <c:if test="${(sessionScope.LOGIN_USER.roleID eq 'US')}">
                        <div class="login-nav col-md-5 text-end py-5 px-5">
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
                        <div class="login-nav col-md-5 text-end py-5 px-5">
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
                <c:param name="action" value="${logoutLink}"></c:param>
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
                    <a class="nav-link--current" href="#">Menu</a>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
        <div class="header-menu container">
            <div class="row justify-content-center">
                <h2 class="text-center">MENU</h2>
            </div>

        </div>
        <div class="container my-4">
            <h2 class="coffee-title">Search Product</h2>
            <form action="SearchProductController" method="GET" class="search-form">
                <div class="input-group categories">
                    <select class="form-control" id="category" name="categoryID">

                        <option value="0">All</option>
                        <c:forEach items="${requestScope.categories}" var="category">
                           <option value="${category.id}" ${requestScope.CID_SELECTED == category.id ? 'selected' : ''}>${category.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group search-input">
                    <input
                        type="text"
                        class="form-control"
                        placeholder="${requestScope.PRODUCT_NAME_SELECTED != null ? requestScope.PRODUCT_NAME_SELECTED : 'Product name'}"
                        name="productName"
                        />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="submit"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </form>
        </div>



        <div class="container">
            <div class="row container">

                <c:if test="${((requestScope.products==null)||requestScope.products.size()==0)}">
                    <h3>No product</h3>
                </c:if>



                <c:if test="${((requestScope.products!=null) &&(requestScope.products.size()>0))}">
                    <c:forEach items="${requestScope.products}" var="p">

                        <form class="card col-md-4 p-1" name="f" action="BuyController" method="get" >
                            <input type="hidden" name="id" value="${p.id}"/>
                            <div class="card-img-box">

                                <img
                                    src="${p.image}"
                                    class="card-img-top"
                                    alt=""
                                    />
                            </div>
                            <div class="card-body position-relative">
                                <h4 class="card-title ont-weight-bold d-flex">${p.name}</h4>
                                <p class="card-text">
                                    ${p.description}
                                </p>
                                <div class="d-flex align-items-baseline mb-2">
                                    <h2 class="mr-2">${p.price}</h2>
                                    <h5 class="text-striked text-muted mr-3 font-weight-regular">
                                        $<fmt:formatNumber pattern="##.##" value="${(p.price+(40/100)*p.price)}"/>
                                    </h5>
                                    <h5 class="text-success">42% off</h5>
                                </div>
                                <div class=""></div>
                                <button type="submit"   value="Add to card" >Add to cart</button>
                            </div>
                        </form>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
