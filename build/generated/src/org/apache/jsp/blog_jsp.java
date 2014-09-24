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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("        <title>Profile Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/foundation-icons.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/foundation.css\" />\n");
      out.write("        <!--<link rel=\"stylesheet\" href=\"http://cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/css/foundation.css\" />-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/custom.css\" />\n");
      out.write("        <!--<link rel=\"stylesheet\" href=\"assets/css/normalize.css\" />-->\n");
      out.write("\n");
      out.write("        <script src=\"assets/js/vendor/modernizr.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"off-canvas-wrap\">\n");
      out.write("            <div class=\"fixed off-canvas-fixed\">\n");
      out.write("\n");
      out.write("                <nav class=\"tab-bar\">\n");
      out.write("                    <section class=\"left-small\">\n");
      out.write("                        <a class=\"left-off-canvas-toggle menu-icon\" href=\"#\"><span></span></a>\n");
      out.write("                    </section>\n");
      out.write("\n");
      out.write("                    <section class=\"middle tab-bar-section\">\n");
      out.write("                        <nav class=\"top-bar\" data-topbar role=\"navigation\">\n");
      out.write("                            <section class=\"top-bar-section\">\n");
      out.write("                                <!-- Right Nav Section -->\n");
      out.write("                                <ul class=\"right\">\n");
      out.write("                                    <li class=\"has-form\">\n");
      out.write("                                        <!--<form>-->\n");
      out.write("                                        <div class=\"large-12 column\">\n");
      out.write("                                            <div class=\"row collapse postfix-radius\">\n");
      out.write("                                                <div class=\"small-9 columns\">\n");
      out.write("                                                    <input type=\"text\" placeholder=\"Value\" class=\"radius\">\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"small-3 columns\">\n");
      out.write("                                                    <a href=\"#\" class=\"button postfix radius\">Go</a>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <!--</form>-->\n");
      out.write("                                    </li>\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fi-home size-24\"></i></a></li>\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fi-mail size-24\"></i></a></li>\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fi-torsos-male-female size-24\"></i></a></li>\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fi-widget size-24\"></i></a></li>\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fi-power size-24\"></i></a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </section>\n");
      out.write("                        </nav>\n");
      out.write("                    </section>\n");
      out.write("                </nav>\n");
      out.write("\n");
      out.write("                <!-- menu pinggir -->\n");
      out.write("                <aside class=\"left-off-canvas-menu\">\n");
      out.write("                    <ul class=\"off-canvas-list\">\n");
      out.write("                        <li><label>Menu Pinggir 1</label></li>\n");
      out.write("                        <li><a href=\"#\">Menu 1</a></li>\n");
      out.write("                        <li><a href=\"#\">Menu 2</a></li>\n");
      out.write("                        <li><a href=\"#\">Menu 3</a></li>\n");
      out.write("                        <li><a href=\"#\">Dst ..</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                    <ul class=\"off-canvas-list\">\n");
      out.write("                        <li><label>Menu Pinggir 2</label></li>\n");
      out.write("                        <li><a href=\"#\">Menu 1</a></li>\n");
      out.write("                        <li><a href=\"#\">Menu 2</a></li>\n");
      out.write("                        <li><a href=\"#\">Menu 3</a></li>\n");
      out.write("                        <li><a href=\"#\">Dst ..</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                    <ul class=\"off-canvas-list\">\n");
      out.write("                        <li><label>Menu Pinggir 3</label></li>\n");
      out.write("                        <li><a href=\"#\">Menu 1</a></li>\n");
      out.write("                        <li><a href=\"#\">Menu 2</a></li>\n");
      out.write("                        <li><a href=\"#\">Menu 3</a></li>\n");
      out.write("                        <li><a href=\"#\">Dst ..</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </aside>\n");
      out.write("                <!-- menu pinggir end -->\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"inner-wrap\">\n");
      out.write("                <a class=\"exit-off-canvas\"></a>\n");
      out.write("                <div class=\"main-section\">\n");
      out.write("                    <!-- cover foto parallax -->\n");
      out.write("                    <section class=\"parralax\" data-type=\"background\" data-bgimg=\"../img/bg.png\" data-speed=\"4\"></section>\n");
      out.write("                    <!-- cover foto end -->\n");
      out.write("                    <div class=\"jarak\">\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"row\"><h1 class=\"title text-center blogtitle\">Untitled</h1></div>\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <!-- menu profile utama -->\n");
      out.write("                        <div class=\"large-3 columns \">\n");
      out.write("                            <div class=\"panel radius\">\n");
      out.write("                                <a href=\"#\"><img src=\"http://placehold.it/300x240&text=[Foto Profil]\"/></a>\n");
      out.write("                                <h5><a href=\"#\">Nama Disni</a></h5>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- menu profil utama end -->\n");
      out.write("\n");
      out.write("                        <div class=\"large-9 columns\">\n");
      out.write("                            <div class=\"row panel radius\">\n");
      out.write("                                <div class=\"large-2 columns small-3\"><img src=\"http://placehold.it/80x80&text=[img]\"/></div>\n");
      out.write("                                <div class=\"large-10 columns\">\n");
      out.write("                                    <section>\n");
      out.write("                                        <header><h1 class=\"title\">Judul Postingan</h1></header>\n");
      out.write("                                        <p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong.</p>\n");
      out.write("                                        <ul class=\"inline-list\">\n");
      out.write("                                            <li><a href=\"\"><i class=\"step fi-heart size-36\"></i></a></li>\n");
      out.write("                                            <li><a href=\"#\" data-reveal-id=\"commentModal\"><i class=\"step fi-comment size-36\"></i></a></li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </section>\n");
      out.write("\n");
      out.write("                                    <!-- popup isi comment -->\n");
      out.write("                                    <div id=\"commentModal\" class=\"reveal-modal small\" data-reveal>\n");
      out.write("                                        <h2>Post a comment</h2>\n");
      out.write("                                        <div class=\"row\">\n");
      out.write("                                            <div class=\"large-2 columns small-3\"><span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"Nama User\"><img src=\"http://placehold.it/50x50&text=[img]\"/></span></div>\n");
      out.write("                                            <div class=\"large-8 columns\">\n");
      out.write("                                                <textarea placeholder=\"Write a comment...\" style=\"resize: none;\"></textarea>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"large-2 columns small-3\">\n");
      out.write("                                                <a href=\"#\" class=\"button\" style=\"margin-left: -30px; height: 3.15rem; width: 4rem; padding: 15px 5px 15px 5px;\">Submit</a>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <a class=\"close-reveal-modal\">&#215;</a>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <hr/>\n");
      out.write("                                    <dl class=\"accordion\" data-accordion>\n");
      out.write("                                        <dd class=\"accordion-navigation\">\n");
      out.write("                                            <a href=\"#commentView\" >View Comments</a>\n");
      out.write("                                            <div id=\"commentView\" class=\"content radius\">\n");
      out.write("                                                <h6>2 Comments</h6>\n");
      out.write("                                                <div class=\"row\">\n");
      out.write("                                                    <div class=\"large-2 columns small-3\"><span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"Nama User\"><img src=\"http://placehold.it/50x50&text=[img]\"/></span></div>\n");
      out.write("                                                    <div class=\"large-10 columns\"><p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit</p></div>\n");
      out.write("                                                </div>\n");
      out.write("\n");
      out.write("                                                <div class=\"row\">\n");
      out.write("                                                    <div class=\"large-2 columns small-3\"><span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"Nama User\"><img src=\"http://placehold.it/50x50&text=[img]\"/></span></div>\n");
      out.write("                                                    <div class=\"large-10 columns\"><p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit</p></div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </dd>\n");
      out.write("                                    </dl>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"jarak\"></div>\n");
      out.write("                            <div class=\"row panel radius\">\n");
      out.write("                                <div class=\"large-2 columns small-3\"><img src=\"http://placehold.it/80x80&text=[img]\"/></div>\n");
      out.write("                                <div class=\"large-10 columns\">\n");
      out.write("                                    <section>\n");
      out.write("                                        <header><h1 class=\"title\">Judul Postingan</h1></header>\n");
      out.write("                                        <span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"Gambar\"><img src=\"http://zurb.com/university/assets/courses/foundation-sass.png\" width=\"480\" height=\"320\" />\n");
      out.write("                                        </span>\n");
      out.write("                                        <hr/>\n");
      out.write("                                        <p>#photos, #gambar, #bagus, #keren, #testes</p>\n");
      out.write("                                        <ul class=\"inline-list\">\n");
      out.write("                                            <li><a href=\"\"><i class=\"liked step fi-heart size-36\"></i></a></li>\n");
      out.write("                                            <li><a href=\"\"><i class=\"step fi-comment size-36\"></i></a></li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </section>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"jarak\"></div>\n");
      out.write("                            <div class=\"row panel radius\">\n");
      out.write("                                <div class=\"large-2 columns small-3\"><img src=\"http://placehold.it/80x80&text=[img]\"/></div>\n");
      out.write("                                <div class=\"large-10 columns\">\n");
      out.write("                                    <section>\n");
      out.write("                                        <header><h1 class=\"title\">Judul Postingan</h1></header>\n");
      out.write("                                        <p> Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong.</p>\n");
      out.write("                                        <ul class=\"inline-list\">\n");
      out.write("                                            <li><a href=\"\"><i class=\"step fi-heart size-36\"></i></a></li>\n");
      out.write("                                            <li><a href=\"\"><i class=\"step fi-comment size-36\"></i></a></li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </section>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"jarak\"></div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- menu timeline profile end -->\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <a href=\"#\" class=\"button totop radius\"><i class=\"fi-arrow-up size-24\"></i></a>\n");
      out.write("        <script src=\"assets/js/vendor/jquery.js\"></script>\n");
      out.write("        <script src=\"assets/js/foundation.min.js\"></script> \n");
      out.write("        <!--<script src=\"http://cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/js/foundation.min.js\" ></script>-->\n");
      out.write("        <script src=\"assets/js/script.js\"></script>\n");
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
