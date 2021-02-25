package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class captcha_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <style>\n");
      out.write("        \n");
      out.write("        .contain {\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            margin-top: 100px;\n");
      out.write("        }\n");
      out.write("        #capt {\n");
      out.write("            width: 170px;\n");
      out.write("            height: 72px;\n");
      out.write("            font-size: 37px;\n");
      out.write("            background-color: #138496;\n");
      out.write("            padding: 5px;\n");
      out.write("            border: none;\n");
      out.write("            letter-spacing: 1px;\n");
      out.write("            float: left;\n");
      out.write("            color: #CED4F0;\n");
      out.write("            border-radius: 5px 0 0 5px;\n");
      out.write("        }\n");
      out.write("        #refresh {\n");
      out.write("            float: left;\n");
      out.write("            background-color: transparent;\n");
      out.write("            height: 72px;\n");
      out.write("            border-radius: 0 5px 5px 0;\n");
      out.write("        }\n");
      out.write("        #refresh img {\n");
      out.write("            margin-top: 20px;\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write("        #textinput {\n");
      out.write("            width: 170px;\n");
      out.write("            height: 70px;\n");
      out.write("            font-size: 37px;\n");
      out.write("            background-color: windowframe;\n");
      out.write("            border: none;\n");
      out.write("            margin-left: 10px;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            padding: 5px;\n");
      out.write("            color: #0056b3;\n");
      out.write("        }\n");
      out.write("        .contain button {\n");
      out.write("            padding: 8px 20px;\n");
      out.write("            height: 35px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            margin-left: 10px;\n");
      out.write("            margin-top: 25px;\n");
      out.write("            background-color: red;\n");
      out.write("            color: #CED4F0;\n");
      out.write("            transition: .5s;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("\n");
      out.write("    </style>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"user/css/all.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"user/css/bootstrap.min.css\">\n");
      out.write("        <title>captcha</title>\n");
      out.write("    </head>\n");
      out.write("    <body  onload=\"cap()\">\n");
      out.write("        <div class=\"mt-5\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <input type=\"text\" id=\"capt\" readonly=\"readonly\" >\n");
      out.write("                <div id=\"refresh\"> <img src=\"images/\" width=\"50px\" onclick=\"cap()\"></div>\n");
      out.write("\n");
      out.write("                <input type=\"text\" id=\"textinput\" placeholder=\"enter..\">\n");
      out.write("                <button id=\"button\"  onclick=\"validcap()\">Check</button>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("            function cap() {\n");
      out.write("\n");
      out.write("                var alpha = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V'\n");
      out.write("                            , 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',\n");
      out.write("                    'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];\n");
      out.write("\n");
      out.write("                var a = alpha[Math.floor(Math.random() * 62)];\n");
      out.write("                var b = alpha[Math.floor(Math.random() * 62)];\n");
      out.write("                var c = alpha[Math.floor(Math.random() * 62)];\n");
      out.write("                var d = alpha[Math.floor(Math.random() * 62)];\n");
      out.write("                var e = alpha[Math.floor(Math.random() * 62)];\n");
      out.write("                var f = alpha[Math.floor(Math.random() * 62)];\n");
      out.write("\n");
      out.write("                var sum = a + b + c + d + e + f;\n");
      out.write("\n");
      out.write("                document.getElementById(\"capt\").value = sum;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function validcap() {\n");
      out.write("                var string1 = document.getElementById('capt').value;\n");
      out.write("                var string2 = document.getElementById('textinput').value;\n");
      out.write("                if (string1 == string2) {\n");
      out.write("                    alert(\"Form is validated Succesfully\");\n");
      out.write("                    window.location.href = \"http://localhost:47847/project_1/HomePage.jsp\";\n");
      out.write("                    return true;\n");
      out.write("                } else {\n");
      out.write("                    alert(\"Please enter a valid captcha\");\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
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
