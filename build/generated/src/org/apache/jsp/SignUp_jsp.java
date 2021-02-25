package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class SignUp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Sign Up Page</title>\n");
      out.write("        <link href=\"css\\bootstrap.min.css\" rel=\"stylesheet\" >\n");
      out.write("        <link href=\"css\\myfile.css\" rel=\"stylesheet\" >\n");
      out.write("        <script src=\"js\\validation.js\">\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body onload=\"changeCap()\">\n");
      out.write("        <h1 class=\"centerText\"> Sign Up Page</h1>\n");
      out.write("        <form class=\"center\" action=\"CheckSignUp\" name=\"form\" onsubmit=\"return check(this)\" method=\"post\" >\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label>User Name</label>\n");
      out.write("                <input type=\"text\" name =\"userName\" class=\"form-control\" placeholder=\"Enter Your User Name\" id=\"userName\">\n");
      out.write("            </div>\n");
      out.write("            <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"ua\"></p>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label>Name</label>\n");
      out.write("                <input type=\"text\" name =\"name\" class=\"form-control\" placeholder=\"Enter Your Name\" id=\"name\">\n");
      out.write("            </div>\n");
      out.write("            <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"n\"></p>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"exampleInputEmail1\">Email</label>\n");
      out.write("                <input type=\"email\" name =\"email\" class=\"form-control\" id=\"email\" aria-describedby=\"emailHelp\" placeholder=\"Enter email\" >\n");
      out.write("                <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"e\"></p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label>Phone Number</label>\n");
      out.write("                <input type=\"text\" name =\"phoneNumber\" class=\"form-control\" placeholder=\"Enter Phone Number\" id=\"phonenumber\">\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("            <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"p\"></p>\n");
      out.write("            <br>\n");
      out.write("            <div>\n");
      out.write("                <b id =\"realCP\"></b>\n");
      out.write("                <button type=\"button\" onclick=\"changeCap()\"><img src=\"reload.png\" width=\"20\"></button>\n");
      out.write("                <input type=\"text\" name=\"captcha\" id=\"CP\">\n");
      out.write("            </div>\n");
      out.write("            <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"wrongData\"></p>\n");
      out.write("            <br>\n");
      out.write("            <input type=\"submit\" class=\"btn btn-primary\" value=\"Sign up\">\n");
      out.write("        </form>\n");
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
