package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public final class Payment_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Reserve Room</title>\n");
      out.write("        <link href=\"css\\bootstrap.min.css\" rel=\"stylesheet\" >\n");
      out.write("        <link href=\"js\\bootstrap.min.js\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css\\myfile.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css\\main.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"js\\validation.js\">\n");
      out.write("        </script>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <style>\n");
      out.write("\n");
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
      out.write("\n");
      out.write("            li a {\n");
      out.write("                display: block;\n");
      out.write("                color: white;\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 14px 16px;\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("            li{\n");
      out.write("                float: left;\n");
      out.write("            }\n");
      out.write("            li a:hover {\n");
      out.write("                background-color: white;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <ul>\n");
      out.write("\n");
      out.write("            <li style=\"float:left\"><a href=\"Details.jsp\">Back</a></li>\n");
      out.write("            <li style=\"margin-left: 71%\">\"                                             \"</li>\n");
      out.write("            <li><a href=\"HomePage.jsp\">Home</a></li>\n");
      out.write("            <li><a href=\"Profile.jsp\">Profile</a></li>\n");
      out.write("            <li><a href=\"Reservation.jsp\">Reservation</a></li>\n");
      out.write("            <li style=\"float:right\"><a href=\"LogOut\">LogOut</a></li>\n");
      out.write("        </ul>\n");
      out.write("        <br><br><br>\n");
      out.write("        ");

            if (request.getSession().getAttribute("userID") == null) {
                response.sendRedirect("Login.html");
            } else {

                try {
                    
                    String userID = request.getSession().getAttribute("userID").toString();
                    String branchID = request.getParameter("branchID");
                    String roomID = request.getParameter("roomID");

                    session.setAttribute("branchID", branchID);
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/bookingdb";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    Statement stmt1 = null;
                    ResultSet rs1 = null;

                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.createStatement();
                    stmt1 = con.createStatement();
                    
                    rs = stmt.executeQuery("select * from room where roomID ='" + roomID + "' and Branch_branchID = '" + branchID + "'");
                    rs.next();
                    
                    rs1 = stmt.executeQuery("select name, email from user where userID ='" + userID + "'");
                    rs1.next();
                    
                
        
      out.write("\n");
      out.write("        <form onsubmit=\"return checkDate();\" action=\"ValidateChange?reservationID=");
      out.print(rs.getString("reservationID"));
      out.write("\" method=\"POST\">\n");
      out.write("            <div class=\"card\" style=\"width: 25rem; margin-left: 50px\">\n");
      out.write("                <img class=\"card-img-top\" src=\"");
      out.print(rs1.getString("BranchImage"));
      out.write("\">\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <h5 class=\"card-title\"><b>");
      out.print(rs1.getString("hotelName"));
      out.write(',');
      out.write(' ');
      out.print(rs1.getString("location"));
      out.write("</b></h5>\n");
      out.write("                    <p class=\"card-text\"><img src=\"calender.png\" width=\"15\">&nbsp;&nbsp;<input type=\"date\" required min=\"");
      out.print(curr_date);
      out.write("\" name=\"checkIn\" id=\"checkIn\" value=\"");
      out.print(rs.getString("checkInDate"));
      out.write("\"> &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;  <input type=\"date\" required min=\"");
      out.print(next_date);
      out.write("\"  id=\"checkOut\" name=\"checkOut\" value=\"");
      out.print(rs.getString("checkOutDate"));
      out.write("\"></p>\n");
      out.write("                    <p class=\"card-text\"><img src=\"bed.png\" width=\"20\">&nbsp;&nbsp;");
      out.print(rs1.getString("roomType"));
      out.write("&nbsp;&nbsp;x&nbsp;<input type=\"number\" size=\"1\" required min=\"1\" name=\"numberOfRooms\" id=\"numberOfRooms\" value=\"");
      out.print(rs.getString("numberOfRooms"));
      out.write("\"></p>\n");
      out.write("                    <p class=\"card-text\"><img src=\"user.png\" width=\"15\">&nbsp;&nbsp;Adults&nbsp;<input type=\"number\" required min=\"0\" max=\"10\" size=\"1\" name=\"adult\" id=\"adult\" value=\"");
      out.print(rs.getString("numberOfAdults"));
      out.write("\">&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;Children&nbsp;<input type=\"number\" required min=\"0\" max=\"10\" size=\"1\" id=\"children\" name=\"children\" value=\"");
      out.print(rs.getString("numberOfChildren"));
      out.write("\"></p>\n");
      out.write("                    <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"wrongDate\"></p>\n");
      out.write("                    <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"wrongAdults\"></p>\n");
      out.write("                    <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"wrongChildren\"></p>\n");
      out.write("                    <button type=\"submit\" style=\"float: right;\" class=\"btn btn-primary\">Confirm</button>\n");
      out.write("                    <input type=\"hidden\" name=\"max_adult\" id=\"max_adult\" value=\"");
      out.print(rs1.getInt("adultsCapacity"));
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"max_children\" id=\"max_children\" value=\"");
      out.print(rs1.getInt("childrenCapacity"));
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"roomPrice\" value=\"");
      out.print(rs1.getInt("roomPrice"));
      out.write("\">\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("        <form method=\"POST\" class=\"center\" action=\"EditProfile\" onsubmit=\"return checkUpdateProfile();\">\n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("                <label for=\"name\" class=\"form-label\">Full Name</label>\n");
      out.write("                <input type=\"text\" id=\"name\" name=\"name\" class=\"form-control\" value=\"");
      out.print(rs1.getString("email"));
      out.write("\" disabled>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("                <label for=\"exampleInputEmail1\" class=\"form-label\">Email address</label>\n");
      out.write("                <input type=\"text\" id=\"email\" disabled name=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" value=\"");
      out.print(rs1.getString("email"));
      out.write("\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("                <label for=\"numberOfRooms\" class=\"form-label\">Number of Rooms</label>\n");
      out.write("                <input type=\"number\" id=\"numberOfRooms\" name=\"numberOfRooms\" min=\"0\" class=\"form-control\" id=\"numberOfRooms\">\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            \n");
      out.write("            <p class=\"text-danger\" style=\"margin-left: 17px;\" id=\"wrongData\"></p>\n");
      out.write("            <button type=\"submit\" class=\"btn btn-primary\">Update</button>\n");
      out.write("        </form>\n");
      out.write("            ");
} catch (Exception e) {
                    out.println(e);
                }}
      out.write("\n");
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
