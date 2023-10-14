<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/style_1.css"/>
        <style>
            body {
                background-color: #f8f9fa;
            }

            .login-container {
                max-width: 800px;
                margin: 0 auto;
                margin-top: 100px;
            }

            .login-form {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .login-banner {
                background-image: url("img/bg-login.svg");
                background-size: cover;
                background-position: center;
                height: 400px;
                border-radius: 5px;
            }

            .login-banner h1 {
                color: #fff;
                text-align: center;
                margin-top: 200px;
            }

            .custom-btn {
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container login-container">
            <div class="row">
                <div class="col-md-6">
                    <div class="login-form">
                        <h4>Input your information:</h4>
                        <form action="MainController" method="post" id="form">
                            <div class="form-group">
                                <label for="userID">User ID</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="userID"
                                    name="userID"
                                    required
                                    />
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input
                                    type="password"
                                    class="form-control"
                                    id="password"
                                    name="password"
                                    required
                                    />
                            </div>
                            <div class="g-recaptcha" data-sitekey="6LcVhgInAAAAANHH6OG9Bck-1XXs-uFZsi1eaT-i"></div>
                            <div style="font-size: 18px; color: red;" >
                                <h5>
                                    ${requestScope.ERROR}
                                </h5>
                            </div>
                            <button
                                type="submit"
                                name="action"
                                value="Login"
                                class="btn btn-primary"
                                >
                                Login
                            </button>
                            <button type="reset" class="btn btn-secondary">Reset</button>
                        </form>
                        <button
                            type="button"
                            onclick="location.href = 'MainController?action=CreatePage'"
                            class="btn btn-link custom-btn"
                            >
                            Register</button
                        ><br />
                        <button
                            type="button"
                            onclick="location.href = 'MainController?action=ShoppingPage'"
                            class="btn btn-link custom-btn"
                            >
                            Back to home
                        </button>
                        <span class="d-block text-center my-4  text-muted s"> or </span>
                        <div class="social-login">
                            <a href="#" class="facebook btn d-flex justify-content-start align-items-center">
                                <i class="bi bi-facebook mr-3"> </i> Login with Facebook
                            </a>
                            <a href="#" class="twitter btn d-flex justify-content-start align-items-center">
                                <i class="bi bi-twitter mr-3"></i> Login with  Twitter
                            </a>
                            <div onclick= "location.href = 'https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8084/PRJ301_T2S4_JSP_JSTL/GoogleController&response_type=code&client_id=744369254484-j7pier6bvdc2pqsaoelm03neud2461o6.apps.googleusercontent.com&approval_prompt=force'">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8084/PRJ301_T2S4_JSP_JSTL/GoogleController&response_type=code&client_id=744369254484-j7pier6bvdc2pqsaoelm03neud2461o6.apps.googleusercontent.com&approval_prompt=force" class="google btn d-flex justify-content-start align-items-center">
                                <i class="bi bi-google mr-3"></i> Login with Google
                                
                            </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 align-items-center">
                    <div class="login-banner"></div>
                </div>
            </div>
                              <button
                            type="button"
                            onclick="location.href = 'MainController?action=Top2'"
                            class="btn-primary custom-btn"
                            >
                            Top2
                        </button>
        </div>
                                
                 
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>  
        <script>
                   const $ = document.querySelector.bind(document);
                   const form = $("#form");
                   form.addEventListener("submit", (event) => {
                       const res = grecaptcha.getResponse();
                       if (res) {
                           window.open(MainController);
                       } else {
                           event.preventDefault();
                       }
                   });
        </script>
    </body>
</html>
