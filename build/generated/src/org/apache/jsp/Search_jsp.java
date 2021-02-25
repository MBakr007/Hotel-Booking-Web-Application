package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

public final class Search_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Search Page</title>\n");
      out.write("        <link href=\"css\\main.css\" rel=\"stylesheet\" />\n");
      out.write("        <link href=\"css\\bootstrap.min.css\" rel=\"stylesheet\" >\n");
      out.write("        <link href=\"css\\myfile.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css\\css1.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"js\\bootstrap.min.js\" rel=\"stylesheet\" >\n");
      out.write("        <style>\n");
      out.write("            #dd{\n");
      out.write("                float: right;\n");
      out.write("                margin-right: 50px;\n");
      out.write("                margin-top: 50px; \n");
      out.write("            }\n");
      out.write("            h1.ex1:visited, h1.ex1:link {color: black; text-decoration: none;}\n");
      out.write("            h1.ex1:hover, h1.ex1:active {color: blue;}\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <ul class=\"nav justify-content-center\">\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"nav-link active\" aria-current=\"page\" href=\"#\">Active</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"nav-link\" href=\"HomePage.jsp\">Home</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"nav-link\" href=\"Profile.jsp\">Profile</a>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"nav-link\" href=\"LogOut\" tabindex=\"-1\" aria-disabled=\"true\">Log Out</a>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("        <div class=\"dropdown\" id=\"dd\">\n");
      out.write("            <button class=\"btn btn-primary\">Filter</button>\n");
      out.write("            <div class=\"dropdown-content\">\n");
      out.write("                <a onclick=\"\">Price</a>\n");
      out.write("                <a href=\"#\">Rating</a>\n");
      out.write("                <a href=\"#\">Stars</a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");

            if (request.getSession().getAttribute("userID") == null) {
                response.sendRedirect("Login.html");
            } else {
                String destination = request.getParameter("destination");
                String checkIn = request.getParameter("checkIn");
                String checkOut = request.getParameter("checkOut");
                String numberOfAdults = request.getParameter("numberOfAdults");
                String numberOfChildern = request.getParameter("numberOfChildern");

                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/bookingdb";
                String user = "root";
                String password = "root";
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;

                con = DriverManager.getConnection(url, user, password);
                stmt = con.createStatement();
                stmt.executeQuery("SELECT distinct hotel.hotelName, branch.branchStars, branch.expectedPrice, branch.branchRate, branch.BranchImage, branch.branchID, branch.location FROM branch INNER JOIN room INNER JOIN hotel ON hotel.hotelID = branch.Hotel_hotelID and branch.branchID = room.Branch_branchID and branch.location = '" + destination + "' and room.adultsCapacity <= '" + numberOfAdults + "' and room.childrenCapacity <= '" + numberOfChildern + "' and room.roomAvailability = '" + 1 + "'");
                rs = stmt.getResultSet();
                if (rs.isBeforeFirst()) {
        
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("\n");
      out.write("            ");
                while (rs.next()) {
            
      out.write("\n");
      out.write("\n");
      out.write("            <br><br>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-sm-3\"><img width=\"300\" border=\"3\" src=\"");
      out.print(rs.getString("BranchImage"));
      out.write("\"></div>\n");
      out.write("                <div class=\"col-sm-5\">\n");
      out.write("                    <h1 class=\"ex1\" id='");
      out.print(rs.getString("branchID"));
      out.write("' onclick='doClick(this)'>");
      out.print(rs.getString("hotelName"));
      out.write(',');
      out.write(' ');
      out.print(rs.getString("location"));
      out.write("</a></h1>\n");
      out.write("                    <h5>Expected Price : ");
      out.print(rs.getString("expectedPrice"));
      out.write(" EGP</h5>\n");
      out.write("                    <h5>Hotel Rate : ");
      out.print(rs.getString("branchRate"));
      out.write("</h5>\n");
      out.write("                    <h5>Hotel Stars : ");
      out.print(rs.getString("branchStars"));
      out.write("</h5>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("        <script type='text/javascript'>\n");
      out.write("            doClick = function (sender)\n");
      out.write("            {\n");
      out.write("                window.location = \"Details.jsp?branchID=\" + sender.id;\n");
      out.write("            };\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </body>");

        }
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
