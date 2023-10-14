<%-- 
    Document   : management_product
    Created on : Jul 8, 2023, 12:56:30 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Product Management</title>
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
            />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
            />
        <style>
            .coffee-title {
                font-family: "Pacifico", cursive;
                font-size: 36px;
                color: #663300;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            }
            .search-form {
                display: flex;
                align-items: center;
                padding: 20px;
                background-color: #f5f5f5;
                border-radius: 5px;
            }

            .categories {
                flex: 3;
            }

            .search-input {
                flex: 9;
            }
        </style>
    </head>

    <body>
        <div class="box container-fluid my-4">
            <h2 class="coffee-title">Management Product</h2>
            <div class="row">
                <div class="mx-3">
                    <a href="MainController" class=""
                       ><i class="bi bi-arrow-return-left"></i> Back to home
                    </a>
                </div>
                <div class="mx-3">
                    <c:url var="addLink" value="MainController">
                        <c:param name="action" value="addproduct.jsp"></c:param>
                    </c:url>
                    <a href="${addLink}" class=""
                       ><i class="bi bi-plus-circle"></i> Add Product
                    </a>
                </div>
            </div>
            <form action="ManagementSearchProductController" method="GET" class="search-form">
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


            <c:if test="${requestScope.UPDATE_SUCCESS!=null||requestScope.UPDATE_ERROR!=null}">
                <c:if test="${requestScope.DELETE_SUCCESS!=null}"> 
                    <div class="alert alert-success" role="alert">
                        Update successful! Your changes have been saved.
                    </div>

                </c:if>


                <div class="container-fluid">
                    <h1>Update Status</h1>


                    <c:if test="${requestScope.UPDATE_SUCCESS!=null}"> 
                        <div class="alert alert-success" role="alert">
                            Update successful! Your changes have been saved.
                        </div>

                    </c:if>
                    <c:if test="${requestScope.UPDATE_ERROR!=null}">
                        <div class="alert alert-danger" role="alert">
                            Update failed! Your input is not valid.
                        </div>
                    </c:if>

                </c:if>

                <c:if test="${((requestScope.products==null)||requestScope.products.size()==0)}">
                    <h3>No product</h3>
                </c:if>
                <c:if test="${((requestScope.products!=null)||requestScope.products.size()>0)}">     

                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Description</th>
                                <th>Image</th>
                                <th>Category</th>
                                <th>Quantity</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <c:set var="list" value="${requestScope.products}"/>
                        <tbody>
                            <c:forEach  var="p" items="${requestScope.products}">
                            <form action="MainController" method="POST">

                                <tr>
                                    <td>${p.id}</td>
                                <input type="hidden" value="${p.id}" name="id" />
                                <td>
                                    <input type="text" value="${p.name}" name="name" />
                                </td>
                                <td><input type="text" value="${p.price}" name="price" /></td>
                                <td><input type="text" value="${p.description}" name="description" /></td>
                                <td>
                                    <img
                                        src="${p.image}"
                                        alt="Product Image"
                                        width="50"
                                        height="50"
                                        />
                                </td>
                                <td>
                                    <select class="form-control" name="category">
                                        <option value="1"${p.category.id eq '1' ? 'selected' : ''}>Tea</option>
                                        <option value="2"${p.category.id eq '2' ? 'selected' : ''}>Coffee</option>
                                        <option value="3"${p.category.id eq '3' ? 'selected' : ''}>MilkTea</option>
                                    </select>
                                </td>
                                <input type="hidden" value="${requestScope.CID_SELECTED}" name="cidSelected">
                                <input type="hidden" value="${requestScope.PRODUCT_NAME_SELECTED}" name="productNameInputed">
                                <td><input type="number" value="${p.quantity}" name="quantity" /></td>
                                <td>
                                    <input type="hidden" name="action" value="UpdateProduct"/>
                                    <button type="submit" class="btn btn-primary">Update</button>

                                </td>
                                <td>
                                    <c:url var="deleteProduct" value="ManagementDeleteProductController">
                                        <c:param name="productID" value="${p.id}"></c:param>
                                        <c:param name="cid" value="${requestScope.CID_SELECTED}"></c:param>
                                        <c:param name="productName" value="${requestScope.PRODUCT_NAME_SELECTED}"></c:param>
                                    </c:url>
                                    <a href="${deleteProduct}" class="btn btn-danger">Delete</a>
                                </td>
                                </tr>
                            </form>

                        </c:forEach>
                        <!-- Add more rows for other products -->
                        </tbody>
                    </table>
                </c:if>
            </div>

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
