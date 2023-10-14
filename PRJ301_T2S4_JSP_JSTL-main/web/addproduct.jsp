<%-- 
    Document   : addproduct.jsp
    Created on : Jul 8, 2023, 5:29:06 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Add Product</title>
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            />
    </head>

    <body>
        <div class="container">
            <h1>Add Product</h1>
            <c:if test="${requestScope.ADD_SUCCESS!=null||requestScope.ADD_ERROR!=null}">


                <div class="container">
                    <h1>Add Status</h1>

                    <c:if test="${requestScope.ADD_SUCCESS!=null}"> 
                        <div class="alert alert-success" role="alert">
                            Add successful! Your changes have been saved.
                        </div>

                    </c:if>
                    <c:if test="${requestScope.ADD_ERROR!=null}">
                        <div class="alert alert-danger" role="alert">
                            Add failed! Your input is not valid.
                        </div>
                    </c:if>

                </c:if>
            <form action="MainController" method="POST">
                <div class="form-group">
                    <label for="productId">ID</label>
                    <input
                        type="number"
                        class="form-control"
                        id="productId"
                        placeholder="Enter ID"
                        name="productId"
                        />
                    <c:if test="${requestScope.PRODUCT_ERROR.id!=null&&requestScope.PRODUCT_ERROR.id.length()>0}"> 
                    <div class="alert alert-primary" role="alert" style="height:30%;">
                        ${requestScope.PRODUCT_ERROR.id}
                    </div>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="productName">Name</label>
                    <input
                        type="text"
                        class="form-control"
                        id="productName"
                        placeholder="Enter Name"
                        name="productName"
                        />
                    <c:if test="${requestScope.PRODUCT_ERROR.name!=null&&requestScope.PRODUCT_ERROR.name.length()>0}"> 
                    <div class="alert alert-primary" role="alert" style="height:30%;">
                        ${requestScope.PRODUCT_ERROR.name}
                    </div>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="productPrice">Price</label>
                    <input
                        type="text"
                        class="form-control"
                        id="productPrice"
                        placeholder="Enter Price"
                        name="productPrice"
                        />
                    <c:if test="${requestScope.PRODUCT_ERROR.price!=null&&requestScope.PRODUCT_ERROR.price.length()>0}">
                    <div class="alert alert-primary" role="alert" style="height:30%;">
                        ${requestScope.PRODUCT_ERROR.price}
                    </div>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="productDescription">Description</label>
                    <textarea
                        class="form-control"
                        id="productDescription"
                        rows="3"
                        placeholder="Enter Description"
                        name="productDescription"
                        ></textarea>
                    <c:if test="${requestScope.PRODUCT_ERROR.desciption!=null&&requestScope.PRODUCT_ERROR.desciption.length()>0}"> 
                    <div class="alert alert-primary" role="alert" style="height:30%;">
                        ${requestScope.PRODUCT_ERROR.desciption}
                    </div>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="productImage">Image</label>
                    <input
                        type="text"
                        class="form-control"
                        id="productImage"
                        placeholder="Enter Image URL"
                        name="productImage"
                        />
                    <c:if test="${requestScope.PRODUCT_ERROR.image!=null&&requestScope.PRODUCT_ERROR.image.length()>0}"> 
                    <div class="alert alert-primary" role="alert" style="height:30%;">
                        ${requestScope.PRODUCT_ERROR.image}
                    </div>
                       </c:if>
                </div>
                <div class="form-group">
                    <label for="productCategory">Category</label>
                    <select class="form-control" id="productCategory" name="productCategory">
                        <option value="1">Tea</option>
                        <option value="2">Coffee</option>
                        <option value="3">Milktea</option>
                        <!-- Add more options for other categories -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="productQuantity">Quantity</label>
                    <input
                        type="number"
                        class="form-control"
                        id="productQuantity"
                        placeholder="Enter Quantity"
                        name="productQuantity"
                        />
                    <c:if test="${requestScope.PRODUCT_ERROR.quantity!=null&&requestScope.PRODUCT_ERROR.quantity.length()>0}">
                    <div class="alert alert-primary" role="alert" style="height:30%;">
                        ${requestScope.PRODUCT_ERROR.quantity}
                    </div>
                     </c:if>
                </div>
                <input type="hidden" name="action" value="AddProduct"> 
                <button type="submit" class="btn btn-primary">Add Product</button>
            </form>
            
            <a href="ManagementGetAllProductController" class="btn btn-secondary"
               >Back to Product Management</a
            >
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>


