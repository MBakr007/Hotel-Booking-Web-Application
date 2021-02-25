package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class AdminHomePage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    if (request.getSession().getAttribute("userID") == null) {
        response.sendRedirect("Login.html");
    } else {
        if (request.getSession().getAttribute("hotelID") == null) {
            response.sendRedirect("Login.html");
        } 

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link href=\"css\\bootstrap.min.css\" rel=\"stylesheet\" >\n");
      out.write("        <link href=\"css\\myfile.css\" rel=\"stylesheet\" >\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Admin Home Page</title>\n");
      out.write("        <link href=\"css\\main.css\" rel=\"stylesheet\" />\n");
      out.write("        <link href=\"css\\bootstrap.min.css\" rel=\"stylesheet\" >\n");
      out.write("        <link href=\"css\\myfile.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"js\\bootstrap.min.js\" rel=\"stylesheet\" >\n");
      out.write("        <script src=\"js\\validation.js\">\n");
      out.write("        </script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                background-image: url('background.jpg');\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            ul {\n");
      out.write("                list-style-type: none;\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                overflow: hidden;\n");
      out.write("                background-color: #333;\n");
      out.write("            }\n");
      out.write("            li a {\n");
      out.write("                display: block;\n");
      out.write("                color: white;\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 14px 16px;\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("            li a:hover {\n");
      out.write("                background-color: white;\n");
      out.write("            }\n");
      out.write("            .disabled {\n");
      out.write("                pointer-events:none; \n");
      out.write("                opacity:0.6;         \n");
      out.write("            }\n");
      out.write("        </style> \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <ul>\n");
      out.write("            <li style=\"float:left\"><a class=\"disabled\">Back</a></li>\n");
      out.write("             <li style=\"float:right\"><a href=\"LogOut\">LogOut</a></li>\n");
      out.write("        </ul>\n");
      out.write("        <ul class=\"center\">\n");
      out.write("            \n");
      out.write("            <li style=\"margin-left: 71%\">\"                                             \"</li>\n");
      out.write("            <li><a class=\"nav-link center\"  href=\"SearchUser.jsp\">Search for User</a></li>\n");
      out.write("            <li><a class=\"nav-link center\" href=\"CurrentReservations.jsp\">View Current Reservation</a></li>\n");
      out.write("            <li><a class=\"nav-link center\" href=\"ReservationHistory.jsp\">view Reservation within specific Period</a></li>\n");
      out.write("            <li><a class=\"nav-link center\" href=\"CancelReservation.jsp\">Cancel Reservations</a></li>\n");
      out.write("            <li><a class=\"nav-link center\" href=\"ConfirmPayment.jsp\">Confirm pending payments</a></li>\n");
      out.write("            <li><a class=\"nav-link center\" href=\"room.jsp\">ADD/update room information</a></li>\n");
      out.write("            <li><a class=\"nav-link center\" href=\"ReservationHistory.jsp\">view Reservation within specific Period</a></li>\n");
      out.write("            <li><a class=\"nav-link center\" href=\"HotelRate.jsp\">View hotel rating and client’s comments</a></li>\n");
      out.write("            <li><a class=\"nav-link center\" href=\"UpdatePhotos.jsp\"> Upload and update hotel photos</a></li>\n");
      out.write("            <li><a class=\"nav-link center\" href=\"UpdateHotelInfo.jsp\">Update hotel basic information</a></li>\n");
      out.write("           \n");
      out.write("        </ul>\n");
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
