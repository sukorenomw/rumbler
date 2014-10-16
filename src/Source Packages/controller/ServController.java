/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Posts;
import model.Users;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.SessionFactory;

/**
 *
 * @author Epen
 */
public class ServController extends HttpServlet {

    private static final String DATA_DIRECTORY = "web/assets/img/PostPic";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2048;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 2048;

    //ModelStatic ms = new ModelStatic();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        switch (userPath) {
            case "/ServLogOut":
                System.out.println(userPath);
                HttpSession session = request.getSession();
                session.removeAttribute("user");
                session.invalidate();
                String encodedURL = response.encodeRedirectURL("login.jsp");
                response.sendRedirect(encodedURL);
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        SessionFactory factory;
        Integer usrCount = 0;
        DatabaseController dbc = new DatabaseController();
        List results = null;
        String username = "";
        String password = "";
        String email = "";
        String date = "";
        String blog = "";
        String name = "";
        switch (userPath) {
            case "/infiniteScroll":
                response.setContentType("text/html;charset=UTF-8");

                List<Posts> res = null;
                try {
                    factory = util.HibernateUtil.getSessionFactory();
                } catch (Throwable ex) {
                    System.err.println("Failed to create sessionFactory object." + ex);
                    throw new ExceptionInInitializerError(ex);
                }
                res = dbc.selectPosts(factory.openSession(), ModelStatic.useRumbler.getUserId());
                try (PrintWriter out = response.getWriter()) {
//                    for (Posts entity : res) {
//                        out.print("data = " + entity.getContent());
//                    }
                    out.print("<div class=\"row\" style=\"display:none;\">");
                    out.print("<div class=\"large-2 columns small-3 profpict\"><img class=\"radius\" src=\"http://placehold.it/80x80&text=[img]\"/></div>");
                    out.print("<div class=\"large-10 columns bubble radius\">");
                    out.print("<section>");
                    out.print("<p class=\"size-14\"><a href=\"#\">username</a></p>");
                    out.print("<header><h3 class=\"title\">content Post</h3></header>");
                    out.print("<p>title</p>");
                    out.print("<span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"Gambar\"><img src=\"\" width=\"480\" height=\"320\" /></span>");
                    out.print("<hr/>");
                    out.print("<p>#tag,#tagdisini</p>");
                    out.print("<ul class=\"inline-list\">\n"
                            + "                                    <li><a href=\"#\"><i class=\"step fi-heart size-36\"></i></a></li>\n"
                            + "                                    <li><a href=\"#\" data-reveal-id=\"commentModal\"><i class=\"step fi-comment size-36\"></i></a></li>\n"
                            + "                                </ul>");
                    out.print("</section>");
                    out.print("<dl class=\"accordion radius\" data-accordion>");
                    out.print("<dd class=\"accordion-navigation\">");
                    out.print("<a href=\"#commentView\" >View Comments</a>");
                    out.print("<div id=\"commentView\" class=\"content radius\">");
                    out.print("<h6>2 Comments</h6>");
                    out.print("<div class=\"row\">");
                    out.print("<div class=\"large-2 columns small-3\"><span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"<%  %>\"><img src=\"http://placehold.it/50x50&text=[img]\"/></span></div>");
                    out.print("<div class=\"large-10 columns\"><p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit</p></div>");
                    out.print("</div>");

                    out.print("<div class=\"row\">");
                    out.print("<div class=\"large-2 columns small-3\"><span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"Nama User\"><img src=\"http://placehold.it/50x50&text=[img]\"/></span></div>");
                    out.print("<div class=\"large-10 columns\"><p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit</p></div>");

                    out.print("</div>");
                    out.print("</div>");
                    out.print("</dd>");
                    out.print("</dl>");
                    out.print("</div>");
                    out.print("</div>");
                    out.print("<div class=\"jarak\"></div>");
                }

                break;

            case "/ServLogin":
                System.out.println(userPath);
                username = request.getParameter("login");
                 {
                    try {
                        password = dbc.MD5(request.getParameter("password"));
                    } catch (NoSuchAlgorithmException ex) {
                        Logger.getLogger(ServController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                try {
                    factory = util.HibernateUtil.getSessionFactory();
                } catch (Throwable ex) {
                    System.err.println("Failed to create sessionFactory object." + ex);
                    throw new ExceptionInInitializerError(ex);
                }
                results = dbc.selectOperator(factory.openSession(), username);
                try {
                    for (Iterator itr = results.iterator(); itr.hasNext();) {
                        Users usr = (Users) itr.next();
                        ModelStatic.useRumbler = usr;
                        if (username.equals(usr.getUsername()) && password.equals(usr.getPassword())) {
                            HttpSession session = request.getSession();
                            session.setAttribute("user", usr.getName());
                            String encodedURL = response.encodeRedirectURL("index.jsp");
                            response.sendRedirect(encodedURL);
                        } else {
                            errorLogin(request, response, username);
                        }
                        usrCount++;
                    }
                    if (usrCount <= 0) {
                        errorLogin(request, response, username);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "/ServSignUp":
                System.out.println(userPath);
                username = request.getParameter("username");
                password = request.getParameter("password");
                email = request.getParameter("email");
                try {
                    factory = util.HibernateUtil.getSessionFactory();
                } catch (Throwable ex) {
                    System.err.println("Failed to create sessionFactory object." + ex);
                    throw new ExceptionInInitializerError(ex);
                }
                dbc.inputOperation(factory.openSession(), username, password, email, "signup");
                String encodedURL = response.encodeRedirectURL("login.jsp");
                response.sendRedirect(encodedURL);

                break;
            case "/UploadFile":
                System.out.println("-------");
                UploadMultiPartVoid(request, response, "image");
                break;
            case "/PostText":
                String title = request.getParameter("post-title");
                String text = request.getParameter("post-content");
                String hastag = request.getParameter("post-tag");
                System.out.println("Title:" + title + "\nText:" + text + "\nHashTag:" + hastag);
                break;
            case "/UploadVideo":
                UploadMultiPartVoid(request, response, "video");
                break;
            case "/settingGeneral":
                System.out.println(userPath);
                try {
                    factory = util.HibernateUtil.getSessionFactory();
                } catch (Throwable ex) {
                    System.err.println("Failed to create sessionFactory object." + ex);
                    throw new ExceptionInInitializerError(ex);
                }
                 {
                    try {
                        password = request.getParameter("password") == null ? ModelStatic.useRumbler.getPassword() : dbc.MD5(request.getParameter("password"));
                    } catch (NoSuchAlgorithmException ex) {
                        Logger.getLogger(ServController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                email = request.getParameter("email");
                date = request.getParameter("date");
                blog = request.getParameter("blog");
                name = request.getParameter("name");
                dbc.updateOperation(factory.openSession(), password, email, date, blog, name, "settingG", ModelStatic.useRumbler.getUserId());
                break;

        }
        /* // use RequestDispatcher to forward request internally
         String url = "/WEB-INF/view" + userPath + ".jsp";

         try {
         request.getRequestDispatcher(url).forward(request, response);
         } catch (Exception ex) {
         ex.printStackTrace();
         }*/
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void UploadMultiPartVoid(HttpServletRequest request, HttpServletResponse response, String jenis) throws ServletException {
        System.out.println("--------- upload multipart void");
        DiskFileItemFactory factorys = new DiskFileItemFactory();
        factorys.setSizeThreshold(MAX_MEMORY_SIZE);
        factorys.setRepository(new File(System.getProperty("java.io.tmpdir")));
        String urlPath = getServletContext().getRealPath("").substring(0, getServletContext().getRealPath("").indexOf("build"));
        String uploadFolder = urlPath + DATA_DIRECTORY;
//        System.out.println("uploadFolder:" + uploadFolder);
        ServletFileUpload upload = new ServletFileUpload(factorys);

        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            System.out.println("Name file:" + ((FileItem) items.get(0)).getName());
            while (iter.hasNext()) {
                System.out.println("masuk ke while");
                FileItem item = (FileItem) iter.next();
                System.out.println("Size:" + item.getSize());
                if (!item.isFormField() && item.getSize() > 0) {
                    String fileName = new File(item.getName()).getName();
                    String time = fileName.substring(fileName.indexOf(".") + 1, fileName.length());
                    System.out.println("masuk ke if pertama");
                    if (jenis.equalsIgnoreCase("image")) {
                        if (time.equalsIgnoreCase("jpg") || time.equalsIgnoreCase("png") || time.equalsIgnoreCase("jpeg") || time.equalsIgnoreCase("gif")) {
                            System.out.println("FileName:" + fileName + "\nuploadFolder:" + uploadFolder);
                            String filePath = uploadFolder + File.separator + fileName;
                            File uploadedFile = new File(filePath);
                            System.out.println(filePath);
                            item.write(uploadedFile);

                        }
                    }
                    if (jenis.equalsIgnoreCase("video")) {
                        if (time.equalsIgnoreCase("avi") || time.equalsIgnoreCase("mkv") || time.equalsIgnoreCase("mp4")) {
                            System.out.println("FileName:" + fileName + "\nuploadFolder:" + uploadFolder);
                            String filePath = uploadFolder + File.separator + fileName;
                            File uploadedFile = new File(filePath);
                            System.out.println(filePath);
                            item.write(uploadedFile);
                            getServletContext().getRequestDispatcher("/login.jsp").forward(
                                    request, response);
                        }
                    }
                }
                if (item.isFormField() && item.getSize() > 0) {
                    String text1 = item.getString();
                    System.out.println("Text1:" + text1);
                }
            }
            getServletContext().getRequestDispatcher("/login.jsp").forward(
                    request, response);
        } catch (FileUploadException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    protected void errorLogin(HttpServletRequest request, HttpServletResponse response, String username)
            throws ServletException, IOException {
        request.setAttribute("login", "failed");
        request.setAttribute("userVal", username);
        RequestDispatcher reqDispatcher = request.getRequestDispatcher("login.jsp");
        reqDispatcher.forward(request, response);
    }
}
