package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Login Page</title>\n");
      out.write("        <link\n");
      out.write("            rel=\"stylesheet\"\n");
      out.write("            href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\"\n");
      out.write("            />\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style_1.css\"/>\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                background-color: #f8f9fa;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-container {\n");
      out.write("                max-width: 800px;\n");
      out.write("                margin: 0 auto;\n");
      out.write("                margin-top: 100px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-form {\n");
      out.write("                background-color: #fff;\n");
      out.write("                padding: 20px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-banner {\n");
      out.write("                background-image: url(\"img/bg-login.svg\");\n");
      out.write("                background-size: cover;\n");
      out.write("                background-position: center;\n");
      out.write("                height: 400px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-banner h1 {\n");
      out.write("                color: #fff;\n");
      out.write("                text-align: center;\n");
      out.write("                margin-top: 200px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .custom-btn {\n");
      out.write("                margin-top: 10px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container login-container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-6\">\n");
      out.write("                    <div class=\"login-form\">\n");
      out.write("                        <h4>Input your information:</h4>\n");
      out.write("                        <form action=\"MainController\" method=\"post\" id=\"form\">\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"userID\">User ID</label>\n");
      out.write("                                <input\n");
      out.write("                                    type=\"text\"\n");
      out.write("                                    class=\"form-control\"\n");
      out.write("                                    id=\"userID\"\n");
      out.write("                                    name=\"userID\"\n");
      out.write("                                    required\n");
      out.write("                                    />\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"password\">Password</label>\n");
      out.write("                                <input\n");
      out.write("                                    type=\"password\"\n");
      out.write("                                    class=\"form-control\"\n");
      out.write("                                    id=\"password\"\n");
      out.write("                                    name=\"password\"\n");
      out.write("                                    required\n");
      out.write("                                    />\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"g-recaptcha\" data-sitekey=\"6LcVhgInAAAAANHH6OG9Bck-1XXs-uFZsi1eaT-i\"></div>\n");
      out.write("                            <div style=\"font-size: 18px; color: red;\" >\n");
      out.write("                                <h5>\n");
      out.write("                                    ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.ERROR}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("                                </h5>\n");
      out.write("                            </div>\n");
      out.write("                            <button\n");
      out.write("                                type=\"submit\"\n");
      out.write("                                name=\"action\"\n");
      out.write("                                value=\"Login\"\n");
      out.write("                                class=\"btn btn-primary\"\n");
      out.write("                                >\n");
      out.write("                                Login\n");
      out.write("                            </button>\n");
      out.write("                            <button type=\"reset\" class=\"btn btn-secondary\">Reset</button>\n");
      out.write("                        </form>\n");
      out.write("                        <button\n");
      out.write("                            type=\"button\"\n");
      out.write("                            onclick=\"location.href = 'MainController?action=CreatePage'\"\n");
      out.write("                            class=\"btn btn-link custom-btn\"\n");
      out.write("                            >\n");
      out.write("                            Register</button\n");
      out.write("                        ><br />\n");
      out.write("                        <button\n");
      out.write("                            type=\"button\"\n");
      out.write("                            onclick=\"location.href = 'MainController?action=ShoppingPage'\"\n");
      out.write("                            class=\"btn btn-link custom-btn\"\n");
      out.write("                            >\n");
      out.write("                            Back to home\n");
      out.write("                        </button>\n");
      out.write("                        <span class=\"d-block text-center my-4  text-muted s\"> or </span>\n");
      out.write("                        <div class=\"social-login\">\n");
      out.write("                            <a href=\"#\" class=\"facebook btn d-flex justify-content-start align-items-center\">\n");
      out.write("                                <i class=\"bi bi-facebook mr-3\"> </i> Login with Facebook\n");
      out.write("                            </a>\n");
      out.write("                            <a href=\"#\" class=\"twitter btn d-flex justify-content-start align-items-center\">\n");
      out.write("                                <i class=\"bi bi-twitter mr-3\"></i> Login with  Twitter\n");
      out.write("                            </a>\n");
      out.write("                            <div onclick= \"location.href = 'https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8084/PRJ301_T2S4_JSP_JSTL/GoogleController&response_type=code&client_id=744369254484-j7pier6bvdc2pqsaoelm03neud2461o6.apps.googleusercontent.com&approval_prompt=force'\">\n");
      out.write("                            <a href=\"https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8084/PRJ301_T2S4_JSP_JSTL/GoogleController&response_type=code&client_id=744369254484-j7pier6bvdc2pqsaoelm03neud2461o6.apps.googleusercontent.com&approval_prompt=force\" class=\"google btn d-flex justify-content-start align-items-center\">\n");
      out.write("                                <i class=\"bi bi-google mr-3\"></i> Login with Google\n");
      out.write("                                \n");
      out.write("                            </a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-6 align-items-center\">\n");
      out.write("                    <div class=\"login-banner\"></div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("                              <button\n");
      out.write("                            type=\"button\"\n");
      out.write("                            onclick=\"location.href = 'Top2Controller'\"\n");
      out.write("                            class=\"btn-primary custom-btn\"\n");
      out.write("                            >\n");
      out.write("                            Back to home\n");
      out.write("                        </button>\n");
      out.write("        </div>\n");
      out.write("                                \n");
      out.write("                 \n");
      out.write("        <script src=\"https://www.google.com/recaptcha/api.js\" async defer></script>  \n");
      out.write("        <script>\n");
      out.write("                   const $ = document.querySelector.bind(document);\n");
      out.write("                   const form = $(\"#form\");\n");
      out.write("                   form.addEventListener(\"submit\", (event) => {\n");
      out.write("                       const res = grecaptcha.getResponse();\n");
      out.write("                       if (res) {\n");
      out.write("                           window.open(MainController);\n");
      out.write("                       } else {\n");
      out.write("                           event.preventDefault();\n");
      out.write("                       }\n");
      out.write("                   });\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
