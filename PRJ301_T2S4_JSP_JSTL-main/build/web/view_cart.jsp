<%-- 
    Document   : view_cart.jsp
    Created on : Jul 7, 2023, 10:43:39 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link
            rel="stylesheet"
            type="text/css"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <title>viewcart</title>
    </head>
    <body>
        <section class="pt-5 pb-5">
            <div class="container">
                <div class="row w-100">
                    <div class="col-lg-12 col-md-12 col-12">
                        <h3 class="display-5 mb-2 text-center">Shopping Cart</h3>
                        <c:set var="size" value="${sessionScope.size}"/>
                        <p class="mb-5 text-center">
                            <i class="text-info font-weight-bold">${size}</i> items in your cart
                        </p>

                        <c:if test="${requestScope.CHECKOUT_ERROR!=null}">  
                        <div class="alert alert-danger" role="alert">
                            <i class="bi bi-exclamation-diamond"></i>
                            ${requestScope.CHECKOUT_ERROR}
                        </div>
                        </c:if>

                        <table
                            id="shoppingCart"
                            class="table table-condensed table-responsive"
                            >
                            <thead>
                                <tr>
                                    <th style="width: 60%">Product</th>
                                    <th style="width: 12%">Price</th>
                                    <th style="width: 10%">Quantity</th>
                                    <th style="width: 16%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--<c:set var="o" value="${sessionScope.cart}"/>-->
                                <c:forEach items="${sessionScope.cart.items}" var="i">

                                    <tr>
                                        <td data-th="Product">
                                            <div class="row">
                                                <div class="col-md-3 text-left" >
                                                    <img
                                                        src="${i.product.image}"
                                                        alt=""
                                                        class="  d-none d-md-block rounded mb-2 shadow"
                                                        width="100px" 
                                                        height="100px"
                                                        />
                                                </div>
                                                <div class="col-md-9 text-left mt-sm-2">
                                                    <h4>${i.product.name}</h4>
                                                    <p class="font-weight-light">
                                                        <c:if test="${i.product.quantity>0}">
                                                            ${i.product.quantity} Available for purchase
                                                        </c:if>
                                                        <c:if test="${i.product.quantity<=0}">
                                                            <span style="color:red">Sold out</span> 
                                                        </c:if>
                                                        <c:if test="${i.quantity>i.product.quantity}">
                                                            </br>
                                                            <span style="color:red">Not enough product to sold</span>
                                                        </c:if>
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-th="Price">$<fmt:formatNumber pattern="##.#" value="${i.quantity*i.price}"/></td>
                                        <td data-th="Quantity">

                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex">
                                                    <input
                                                        type="number"
                                                        class="form-control form-control-lg text-center me-2"
                                                        value="${i.quantity}"

                                                        onchange="updateQuantity(this, '${i.product.id}')"


                                                        />
                                                </div>

                                            </div>
                                        </td>
                                        <td class="actions" data-th="">
                                            <div class="text-right">
                                                <form>
                                                    <a href="view_cart.jsp"
                                                        class="btn btn-white border-secondary bg-white btn-md mb-2"
                                                        >
                                                        <i class="bi bi-arrow-repeat"></i>
                                                    </a>
                                                </form>
                                                <form action="ProcessController" method="post">
                                                    <input type="hidden" name="id" value="${i.product.id}"/>
                                                    <button
                                                        class="btn btn-white border-secondary bg-white btn-md mb-2"
                                                        >
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <c:if test="${requestScope.isDone==true}">
                            <div class="container" style="text-align: center;
                                 margin-top: 100px;">
                                <h1 style="font-size: 24px;">Payment Completed</h1>
                                <p>Thank you for your payment. Your transaction has been successfully processed.</p>
                                <p>A confirmation email with the details of your purchase has been sent to your registered email address.</p>
                                <p>If you have any questions or need further assistance, please contact our customer support.</p>
                                <p>Thank you for choosing our services!</p>
                            </div>
                        </c:if>     
                        <div class="float-right text-right">
                            <h4>Subtotal:</h4>
                            <h1>$<fmt:formatNumber pattern="##.#" value="${o.getTotalMoney()}"/></h1>
                        </div>
                    </div>
                </div>
                <div class="row mt-4 d-flex align-items-center">
                    <div class="col-sm-6 order-md-2 text-right">
                        <form action="CheckoutController" method="post">

                            <button type="submit" class="btn btn-primary">Check out</button>
                        </form>
                    </div>
                    <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
                        <a href="MainController?action=Menu">
                            <i class="bi bi-arrow-bar-left"></i> Continue Shopping</a
                        >
                    </div>
                </div>
            </div>
        </section>
        <script type="text/javascript">
            function updateQuantity(input, productId) {
                var quantity = input.value;


                var xhr = new XMLHttpRequest();
                xhr.open("GET", "ProcessController?quantity=" + quantity + "&id=" + productId, true);
                xhr.send();
            }
        </script>
    </body>
</html>

