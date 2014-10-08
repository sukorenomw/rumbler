/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Posts;
import model.Users;
import org.hibernate.SessionFactory;

/**
 *
 * @author Epen
 */
public class ServController extends HttpServlet {

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
        switch (userPath) {
            case "/ServLogin":
                System.out.println(userPath);
                String username = request.getParameter("login");
                String password = request.getParameter("password");
                try {
                    factory = util.HibernateUtil.getSessionFactory();
                } catch (Throwable ex) {
                    System.err.println("Failed to create sessionFactory object." + ex);
                    throw new ExceptionInInitializerError(ex);
                }
                DatabaseController dbc = new DatabaseController();
                List results = dbc.selectOperator(factory.openSession(), username);
                try {
                    for (Iterator itr = results.iterator(); itr.hasNext();) {
                        Users usr = (Users) itr.next();
                        ModelStatic.useRumbler = usr;
                        if (username.equals(usr.getUsername()) && password.equals(usr.getPassword())) {
                            HttpSession session = request.getSession();
                            for (Posts obj : ModelStatic.useRumbler.getPostses()) {
                                System.out.println("title = " + ((Posts)obj).getTitle());
                            }
                            session.setAttribute("user", usr.getName());
                            String encodedURL = response.encodeRedirectURL("index.jsp");
                            response.sendRedirect(encodedURL);
                        } else {
                            String encodedURL = response.encodeRedirectURL("login.jsp?login=failed");
                            response.sendRedirect(encodedURL);
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "/ServSignUp":
                System.out.println(userPath);
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

}
