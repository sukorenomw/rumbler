package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signup_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Sign Up</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/foundation-icons.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/foundation.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/custom.css\" />\n");
      out.write("        <script src=\"assets/js/vendor/modernizr.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"sign-up-page\">\n");
      out.write("        <div class=\"jarak3\"></div>\n");
      out.write("        <h1 class=\"text-center blogtitle titel\">rumbler.</h1>\n");
      out.write("        <div class=\"sign-up-desc\"><p class=\"text-center\">Follow the blogs you've been hearing about.\n");
      out.write("                Share the things you love.</p></div>\n");
      out.write("        <form class=\"form-2\" method=\"post\" action=\"signup.html\" data-abide>\n");
      out.write("            <h1><span class=\"sign-up\">sign up</span></h1>\n");
      out.write("            <div>\n");
      out.write("                <input type=\"email\" name=\"email\" placeholder=\"Email\" required pattern=\"email\">\n");
      out.write("                <small class=\"error\">A valid email address is required.</small>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <input type=\"password\" name=\"password\" id=\"password\" placeholder=\"Password\" class=\"showpassword\" required pattern=\"alpha_numeric\">\n");
      out.write("                <small class=\"error\">Password must contain at least 8 character and Uppercase.</small>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <input type=\"password\" name=\"cpassword\" placeholder=\"Confirm Password\" class=\"showpassword\" required pattern=\"alpha_numeric\" data-equalto=\"password\">\n");
      out.write("                <small class=\"error\">Password doesn't match.</small>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <input type=\"text\" name=\"username\" placeholder=\"Username\" required pattern=\"alpha_numeric\">\n");
      out.write("                <small class=\"error\">You must provide a username.</small>\n");
      out.write("            </div>\n");
      out.write("            <p class=\"clearfix\">\n");
      out.write("                <input type=\"submit\" name=\"submit\" value=\"Sign Up\">\n");
      out.write("            </p>\n");
      out.write("        </form>\n");
      out.write("        <a href=\"login.jsp\" class=\"button transparan radius\">LOG IN</a>\n");
      out.write("        <script src=\"assets/js/vendor/jquery.js\"></script>\n");
      out.write("        <script src=\"assets/js/foundation.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).foundation();\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
