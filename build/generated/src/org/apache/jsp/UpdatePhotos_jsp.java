package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public final class UpdatePhotos_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Update Hotel Photos</title>\n");
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
      out.write("        ");

                if (request.getSession().getAttribute("userID") == null) {
        response.sendRedirect("Login.html");
    } else {
        if (request.getSession().getAttribute("hotelID") == null) {
            response.sendRedirect("Login.html");
        }
        else
        {
            String userID = request.getSession().getAttribute("userID").toString();
            String hotelID = request.getSession().getAttribute("hotelID").toString();
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bookingdb";
            String user = "root";
            String password = "root";
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            con = DriverManager.getConnection(url, user, password);
            stmt = con.createStatement();
            
            rs = stmt.executeQuery("select * from branch inner join hotel on branch.Hotel_hotelID = hotel.hotelID and Hotel_hotelID  ='" + hotelID + "'");
            
            while(rs.next())
            {
      out.write("\n");
      out.write("            <br><br><br><br>\n");
      out.write("                <div class=\"card\" style=\"width: 20rem; margin-left: 40px;\">\n");
      out.write("                    <img class=\"card-img-top\" src=\"");
      out.print(rs.getString("BranchImage"));
      out.write("\">\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <h5 class=\"card-title\"><b>");
      out.print(rs.getString("hotelName"));
      out.write(',');
      out.write(' ');
      out.print(rs.getString("location"));
      out.write("</b></h5>\n");
      out.write("                    <br>\n");
      out.write("                    <input class=\"btn btn-primary\" type = \"button\" value = \"Upload File\" id=\"upload\"/>\n");
      out.write("                    <br>\n");
      out.write("                    <input type = \"hidden\" value = \"");
      out.print(rs.getString("branchID"));
      out.write("\" id=\"branchID\"/>\n");
      out.write("                    <br>\n");
      out.write("                    <input type = \"file\" name = \"file\" size = \"50\"  id=\"fileInput\"/>\n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("            ");
}
            
      out.write("\n");
      out.write("            \n");
      out.write("        ");

        }
                }
        
        
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        document.getElementById('upload').onclick = function () {\n");
      out.write("            var name = document.getElementById('fileInput').value;\n");
      out.write("            window.location = \"UploadServlet?filename=\" + name;\n");
      out.write("        };\n");
      out.write("    </script>\n");
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
