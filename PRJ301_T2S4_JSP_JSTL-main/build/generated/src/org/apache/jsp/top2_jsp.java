package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class top2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.data != null}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty requestScope.data}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                    <table>\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th>No</th>\n");
      out.write("                                <th>User ID</th>\n");
      out.write("                                <th>Full Name</th>\n");
      out.write("                                <th>Role ID</th>\n");
      out.write("                                <th>Password</th>\n");
      out.write("                                <th>Update</th>\n");
      out.write("                                <th>Remove</th>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody>\n");
      out.write("                            <c:forEach var=\"user\" items=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.data}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" varStatus=\"counter\">\n");
      out.write("                            <form action=\"MainController\" method=\"POST\">\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${counter.count}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <input type=\"text\" name=\"userID\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.userID}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" readonly class=\"form-control\" />\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <input type=\"text\" name=\"fullName\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.fullName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required class=\"form-control\" />\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <input type=\"text\" name=\"roleID\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.roleID}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write('"');
      out.write(' ');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.roleID eq 'AD'?\"readonly\":\"\"}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(" required class=\"form-control\" />\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.password}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <button type=\"submit\" name=\"action\" value=\"UpdateProduct\" class=\"btn btn-primary\">Update</button>\n");
      out.write("                                        \n");
      out.write("                                        \n");
      out.write("                                        <input type=\"hidden\" name=\"search\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.search}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" />\n");
      out.write("                                    </td>\n");
      out.write("                                    \n");
      out.write("                                </tr>\n");
      out.write("                            </form>\n");
      out.write("                            </c:forEach>\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                </c:if>\n");
      out.write("            </c:if>\n");
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
