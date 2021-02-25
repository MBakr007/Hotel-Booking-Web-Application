package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public final class Profile_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");


    if (request.getSession().getAttribute("userID") == null) 
    {
        response.sendRedirect("Login.html");
    }
    else 
    {
        String userID = request.getSession().getAttribute("userID").toString();
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/bookingdb";
        String user = "root";
        String password = "root";
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        con = DriverManager.getConnection(url, user, password);
        stmt = con.createStatement();
        rs = stmt.executeQuery("select * from user where userID ='" + userID + "'");
        rs.next();
    

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Profile</title>\n");
      out.write("        <script src=\"js\\validation.js\">\n");
      out.write("        </script>\n");
      out.write("        <link href=\"css\\bootstrap.min.css\" rel=\"stylesheet\" >\n");
      out.write("        <link href=\"css\\myfile.css\" rel=\"stylesheet\" >\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form class=\"center\" action=\"EditProfile\" onsubmit=\"return checkPassword();\">\n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("                <label for=\"userName\" class=\"form-label\">User Name</label>\n");
      out.write("                <input type=\"text\" name=\"userName\" disabled class=\"form-control\" value=\"");
      out.print(rs.getString("userName"));
      out.write("\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("                <label for=\"name\" class=\"form-label\">Full Name</label>\n");
      out.write("                <input type=\"text\" id=\"name\" name=\"name\" class=\"form-control\" value=\"");
      out.print(rs.getString("name"));
      out.write("\">\n");
      out.write("            </div>\n");
      out.write("            <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"n\"></p>\n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("                <label for=\"exampleInputEmail1\" class=\"form-label\">Email address</label>\n");
      out.write("                <input type=\"text\" id=\"email\" name=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" value=\"");
      out.print(rs.getString("email"));
      out.write("\">\n");
      out.write("            </div>\n");
      out.write("            <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"e\"></p>\n");
      out.write("            \n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("                <label for=\"phoneNumber\" class=\"form-label\">Phone Number</label>\n");
      out.write("                <input type=\"text\" id=\"phonenumber\" name=\"phoneNumber\" class=\"form-control\" value=\"");
      out.print(rs.getString("phoneNumber"));
      out.write("\">\n");
      out.write("            </div>\n");
      out.write("            <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"p\"></p>\n");
      out.write("            \n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("                <label for=\"exampleInputPassword1\" class=\"form-label\">Password</label>\n");
      out.write("                <input type=\"password\" name=\"password\" class=\"form-control\" id=\"Password1\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("                <label for=\"exampleInputPassword1\" class=\"form-label\">Confirm Password</label>\n");
      out.write("                <input type=\"password\" name=\"confirmPassword\" class=\"form-control\" id=\"Password2\">\n");
      out.write("            </div>\n");
      out.write("            <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"wrongData\"></p>\n");
      out.write("            <button type=\"submit\" class=\"btn btn-primary\">Update</button>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
}
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
