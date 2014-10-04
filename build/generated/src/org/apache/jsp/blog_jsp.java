package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class blog_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\" />\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("        <title>Profile Page</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/foundation-icons.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/foundation.css\" />\r\n");
      out.write("        <!--<link rel=\"stylesheet\" href=\"http://cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/css/foundation.css\" />-->\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/custom.css\" />\r\n");
      out.write("        <!--<link rel=\"stylesheet\" href=\"assets/css/normalize.css\" />-->\r\n");
      out.write("\r\n");
      out.write("        <script src=\"assets/js/vendor/modernizr.js\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"off-canvas-wrap\">\r\n");
      out.write("            <div class=\"fixed off-canvas-fixed\">\r\n");
      out.write("\r\n");
      out.write("                <nav class=\"tab-bar\">\r\n");
      out.write("                    <section class=\"left-small\">\r\n");
      out.write("                        <a class=\"left-off-canvas-toggle menu-icon\" href=\"#\"><span></span></a>\r\n");
      out.write("                    </section>\r\n");
      out.write("\r\n");
      out.write("                    <section class=\"middle tab-bar-section\">\r\n");
      out.write("                        <nav class=\"top-bar\" data-topbar role=\"navigation\">\r\n");
      out.write("                            <section class=\"top-bar-section\">\r\n");
      out.write("                                <!-- Right Nav Section -->\r\n");
      out.write("                                <ul class=\"right\">\r\n");
      out.write("                                    <li class=\"has-form\">\r\n");
      out.write("                                        <!--<form>-->\r\n");
      out.write("                                        <div class=\"large-12 column\">\r\n");
      out.write("                                            <div class=\"row collapse postfix-radius\">\r\n");
      out.write("                                                <div class=\"small-9 columns\">\r\n");
      out.write("                                                    <input type=\"text\" placeholder=\"Value\" class=\"radius\">\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                                <div class=\"small-3 columns\">\r\n");
      out.write("                                                    <a href=\"#\" class=\"button postfix radius\">Go</a>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <!--</form>-->\r\n");
      out.write("                                    </li>\r\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fi-home size-24\"></i></a></li>\r\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fi-mail size-24\"></i></a></li>\r\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fi-torsos-male-female size-24\"></i></a></li>\r\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fi-widget size-24\"></i></a></li>\r\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fi-power size-24\"></i></a></li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </section>\r\n");
      out.write("                        </nav>\r\n");
      out.write("                    </section>\r\n");
      out.write("                </nav>\r\n");
      out.write("\r\n");
      out.write("                <!-- menu pinggir -->\r\n");
      out.write("                <aside class=\"left-off-canvas-menu\">\r\n");
      out.write("                    <ul class=\"off-canvas-list\">\r\n");
      out.write("                        <li><label>Menu Pinggir 1</label></li>\r\n");
      out.write("                        <li><a href=\"#\">Menu 1</a></li>\r\n");
      out.write("                        <li><a href=\"#\">Menu 2</a></li>\r\n");
      out.write("                        <li><a href=\"#\">Menu 3</a></li>\r\n");
      out.write("                        <li><a href=\"#\">Dst ..</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    <ul class=\"off-canvas-list\">\r\n");
      out.write("                        <li><label>Menu Pinggir 2</label></li>\r\n");
      out.write("                        <li><a href=\"#\">Menu 1</a></li>\r\n");
      out.write("                        <li><a href=\"#\">Menu 2</a></li>\r\n");
      out.write("                        <li><a href=\"#\">Menu 3</a></li>\r\n");
      out.write("                        <li><a href=\"#\">Dst ..</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    <ul class=\"off-canvas-list\">\r\n");
      out.write("                        <li><label>Menu Pinggir 3</label></li>\r\n");
      out.write("                        <li><a href=\"#\">Menu 1</a></li>\r\n");
      out.write("                        <li><a href=\"#\">Menu 2</a></li>\r\n");
      out.write("                        <li><a href=\"#\">Menu 3</a></li>\r\n");
      out.write("                        <li><a href=\"#\">Dst ..</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </aside>\r\n");
      out.write("                <!-- menu pinggir end -->\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"inner-wrap\">\r\n");
      out.write("                <a class=\"exit-off-canvas\"></a>\r\n");
      out.write("                <div class=\"main-section\">\r\n");
      out.write("                    <!-- cover foto parallax -->\r\n");
      out.write("                    <section class=\"parralax\" data-type=\"background\" data-bgimg=\"../img/bg.png\" data-speed=\"4\"></section>\r\n");
      out.write("                    <!-- cover foto end -->\r\n");
      out.write("                    <div class=\"jarak\">\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row\"><h1 class=\"title text-center blogtitle\">Untitled</h1></div>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <!-- menu profile utama -->\r\n");
      out.write("                        <div class=\"large-3 columns \">\r\n");
      out.write("                            <div class=\"panel radius\">\r\n");
      out.write("                                <a href=\"#\"><img src=\"http://placehold.it/300x240&text=[Foto Profil]\"/></a>\r\n");
      out.write("                                <h5><a href=\"#\">Nama Disni</a></h5>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <!-- menu profil utama end -->\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"large-9 columns\">\r\n");
      out.write("                            <div class=\"row panel radius\">\r\n");
      out.write("                                <div class=\"large-2 columns small-3\"><img src=\"http://placehold.it/80x80&text=[img]\"/></div>\r\n");
      out.write("                                <div class=\"large-10 columns\">\r\n");
      out.write("                                    <section>\r\n");
      out.write("                                        <header><h1 class=\"title\">Judul Postingan</h1></header>\r\n");
      out.write("                                        <p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong.</p>\r\n");
      out.write("                                        <p>Sukoreno Mukti</p>\r\n");
      out.write("                                        <ul class=\"inline-list\">\r\n");
      out.write("                                            <li><a href=\"\"><i class=\"step fi-heart size-36\"></i></a></li>\r\n");
      out.write("                                            <li><a href=\"#\" data-reveal-id=\"commentModal\"><i class=\"step fi-comment size-36\"></i></a></li>\r\n");
      out.write("                                        </ul>\r\n");
      out.write("                                    </section>\r\n");
      out.write("\r\n");
      out.write("                                    <!-- popup isi comment -->\r\n");
      out.write("                                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "function/addComment.jsp", out, true);
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                    <hr/>\r\n");
      out.write("                                    <dl class=\"accordion\" data-accordion>\r\n");
      out.write("                                        <dd class=\"accordion-navigation\">\r\n");
      out.write("                                            <a href=\"#commentView\" >View Comments</a>\r\n");
      out.write("                                            <div id=\"commentView\" class=\"content radius\">\r\n");
      out.write("                                                <h6>2 Comments</h6>\r\n");
      out.write("                                                <div class=\"row\">\r\n");
      out.write("                                                    <div class=\"large-2 columns small-3\"><span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"Nama User\"><img src=\"http://placehold.it/50x50&text=[img]\"/></span></div>\r\n");
      out.write("                                                    <div class=\"large-10 columns\"><p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit</p></div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("\r\n");
      out.write("                                                <div class=\"row\">\r\n");
      out.write("                                                    <div class=\"large-2 columns small-3\"><span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"Nama User\"><img src=\"http://placehold.it/50x50&text=[img]\"/></span></div>\r\n");
      out.write("                                                    <div class=\"large-10 columns\"><p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit</p></div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </dd>\r\n");
      out.write("                                    </dl>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"jarak\"></div>\r\n");
      out.write("                            <div class=\"row panel radius\">\r\n");
      out.write("                                <div class=\"large-2 columns small-3\"><img src=\"http://placehold.it/80x80&text=[img]\"/></div>\r\n");
      out.write("                                <div class=\"large-10 columns\">\r\n");
      out.write("                                    <section>\r\n");
      out.write("                                        <header><h1 class=\"title\">Judul Postingan</h1></header>\r\n");
      out.write("                                        <span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"Gambar\"><img src=\"http://zurb.com/university/assets/courses/foundation-sass.png\" width=\"480\" height=\"320\" />\r\n");
      out.write("                                        </span>\r\n");
      out.write("                                        <hr/>\r\n");
      out.write("                                        <p>#photos, #gambar, #bagus, #keren, #testes</p>\r\n");
      out.write("                                        <ul class=\"inline-list\">\r\n");
      out.write("                                            <li><a href=\"\"><i class=\"liked step fi-heart size-36\"></i></a></li>\r\n");
      out.write("                                            <li><a href=\"\"><i class=\"step fi-comment size-36\"></i></a></li>\r\n");
      out.write("                                        </ul>\r\n");
      out.write("                                    </section>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"jarak\"></div>\r\n");
      out.write("                            <div class=\"row panel radius\">\r\n");
      out.write("                                <div class=\"large-2 columns small-3\"><img src=\"http://placehold.it/80x80&text=[img]\"/></div>\r\n");
      out.write("                                <div class=\"large-10 columns\">\r\n");
      out.write("                                    <section>\r\n");
      out.write("                                        <header><h1 class=\"title\">Judul Postingan</h1></header>\r\n");
      out.write("                                        <p> Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong.</p>\r\n");
      out.write("                                        <ul class=\"inline-list\">\r\n");
      out.write("                                            <li><a href=\"\"><i class=\"step fi-heart size-36\"></i></a></li>\r\n");
      out.write("                                            <li><a href=\"\"><i class=\"step fi-comment size-36\"></i></a></li>\r\n");
      out.write("                                        </ul>\r\n");
      out.write("                                    </section>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"jarak\"></div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <!-- menu timeline profile end -->\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <a href=\"#\" class=\"button totop radius\"><i class=\"fi-arrow-up size-48\"></i></a>\r\n");
      out.write("        <script src=\"assets/js/vendor/jquery.js\"></script>\r\n");
      out.write("        <script src=\"assets/js/foundation.min.js\"></script> \r\n");
      out.write("        <!--<script src=\"http://cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/js/foundation.min.js\" ></script>-->\r\n");
      out.write("        <script src=\"assets/js/script.js\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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
