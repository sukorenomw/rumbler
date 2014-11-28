/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.InputStreamEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
//import org.hibernate.SessionFactory;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Epen
 */
public class ServController extends HttpServlet {

    private static final String DATA_DIRECTORY = "web/assets/img/PostPic";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2048;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 2048;
//    public static HttpClient httpclient = new DefaultHttpClient();
//    public static ControllerDB controllerDB=new ControllerDB(httpclient);
    public static int n = 10;
    public static List listz;
    public InputStream inputStream = null;
    public String result = "";
    public JSONObject respon = new JSONObject();

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
        RequestDispatcher reqDispatcher;
        switch (userPath) {
            case "/ServLogOut":
                System.out.println(userPath);
                HttpPost del = new HttpPost(ControllerDB.urlstatic + "auth/logout");
                System.out.println("testse logout");
                JSONObject jsonObject = new JSONObject();
//                jsonObject.accumulate("email", "sukorenomukti");
//                jsonObject.accumulate("password", password);

                String json = jsonObject.toString();
                StringEntity se = new StringEntity(json);
                del.setEntity(se);
                System.out.println("masuk log out");
                del.setHeader("Accept", "application/json");
                del.setHeader("Content-type", "application/json");
                HttpResponse httpResponse = ControllerDB.httpClient.execute(del);
                InputStream inputStream = httpResponse.getEntity().getContent();
                String result = "";
                if (inputStream != null) {
                    result = convertInputStreamToString(inputStream);
                } else {
                    result = "Did not work!";
                }
                System.out.println("masa sih");
                //System.out.println(result);
                JSONObject responz = new JSONObject(result);
                System.out.println(responz.toString());
                System.out.println("masuk servlogout");
                String encodedURL = response.encodeRedirectURL("login.jsp");
                response.sendRedirect(encodedURL);
                break;
            case "/FriendsBlog":
                System.out.println("bangsat friends blog :" + request.getParameter("user_id"));
                if (request.getParameter("user_id") == null) {
                    request.setAttribute("userId", ModelStatic.useRumbler.getUserId());
                } else {
                    request.setAttribute("userId", request.getParameter("user_id"));
                }
                reqDispatcher = request.getRequestDispatcher("blog.jsp");
                reqDispatcher.forward(request, response);
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
    public static String blog = "";
    public static String password = "";
    public static String email = "";
    public static String date = "";
    public static String name = "";
    public static String pathDB = "";
    public static ModelStatic modelstatic = new ModelStatic();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        RequestDispatcher reqDispatcher;
//        SessionFactory factory;
        Integer usrCount = 0;
//        DatabaseController dbc = new DatabaseController();
        List results = null;
        String username = "";
        String password = "";
        String email = "";
        String date = "";
        String blog = "";
        String name = "";
        switch (userPath) {
            case "/LikeAction":
                String act = request.getParameter("action");
                Integer userid = Integer.valueOf(request.getParameter("userid"));
                Integer postid = Integer.valueOf(request.getParameter("postid"));

                if (act.equals("like")) {
                    System.out.println("masuk ke like");
//                    dbc.likePost(factory.openSession(), userid, postid);
                    HttpPost lhttpPost = new HttpPost(ControllerDB.urlstatic + "like");
                    String ljson = "";
                    JSONObject ljsonObject = new JSONObject();
                    ljsonObject.accumulate("postid", postid);

                    ljson = ljsonObject.toString();
                    StringEntity lse = new StringEntity(ljson);
                    lhttpPost.setEntity(lse);

                    lhttpPost.setHeader("Accept", "application/json");
                    lhttpPost.setHeader("Content-type", "application/json");

                    HttpResponse lhttpResponse = ControllerDB.httpClient.execute(lhttpPost);
                    inputStream = lhttpResponse.getEntity().getContent();

                    if (inputStream != null) {
                        result = convertInputStreamToString(inputStream);
                    } else {
                        result = "Did not work!";
                    }

                    respon = new JSONObject(result);
                    System.out.println(respon);
                } else {
                    System.out.println("unlike");
                    HttpPost lhttpPost = new HttpPost(ControllerDB.urlstatic + "like/remove");
                    String ljson = "";
                    JSONObject ljsonObject = new JSONObject();
                    ljsonObject.accumulate("postid", postid);

                    ljson = ljsonObject.toString();
                    StringEntity lse = new StringEntity(ljson);
                    lhttpPost.setEntity(lse);

                    lhttpPost.setHeader("Accept", "application/json");
                    lhttpPost.setHeader("Content-type", "application/json");

                    HttpResponse lhttpResponse = ControllerDB.httpClient.execute(lhttpPost);
                    inputStream = lhttpResponse.getEntity().getContent();

                    if (inputStream != null) {
                        result = convertInputStreamToString(inputStream);
                    } else {
                        result = "Did not work!";
                    }

                    respon = new JSONObject(result);
                    System.out.println(respon);
//                    dbc.unlikePost(factory.openSession(), userid, postid);
                }
                break;
            case "/ReloadFollower":
//                try (PrintWriter out = response.getWriter()) {
//                    out.print("<h3 class=\"title\">Followers</h3>");
//                    out.print("<p class=\"size-12\">The lists of your followers</p>");
//                    out.print("<hr/>");
//                    try {
//                        factory = util.HibernateUtil.getSessionFactory();
//                    } catch (Throwable ex) {
//                        System.err.println("Failed to create sessionFactory object." + ex);
//                        throw new ExceptionInInitializerError(ex);
//                    }
//                    List followers = dbc.selectFollowers(factory.openSession(), ModelStatic.useRumbler.getUserId());
//                    for (Iterator itr = followers.iterator(); itr.hasNext();) {
//                        Users flw = (Users) itr.next();
//                        out.print("<div class=\"row\">");
//                        out.print("<div class=\"small-8\">");
//                        out.print("<div class=\"row\">");
//                        out.print("<div class=\"small-5 push-1 columns\">");
//                        out.print("<div class=\"columns profpict\"><img class=\"radius\" src=\"" + flw.getPicturePath() + "\"/></div>");
//                        out.print("</div>");
//                        out.print("<div class=\"small-7 columns\">");
//                        out.print("<p><a href=\"FriendsBlog?user_id=" + flw.getUserId() + "\">" + flw.getName() + "</a></p>");
//                        out.print("<a href=\"#\" class='unfollow' data-unfol=\"" + flw.getUserId() + "\" data-user=\"" + ModelStatic.useRumbler.getUserId() + "\"><span class=\"label radius success medium\">Following</span></a>"
//                        );
//                        out.print("</div>");
//                        out.print("</div>");
//                        out.print("</div>");
//                        out.print("</div>");
//                        out.print("<hr/>");
//                    }
//                }
                break;
            case "/ReloadRecommend":
//                System.out.println("reloadrecommend");
//                try {
//                    factory = util.HibernateUtil.getSessionFactory();
//                } catch (Throwable ex) {
//                    System.err.println("Failed to create sessionFactory object." + ex);
//                    throw new ExceptionInInitializerError(ex);
//                }
//                List randUser = dbc.selectRandomUsers(factory.openSession(), ModelStatic.useRumbler.getUserId());
//                try (PrintWriter out = response.getWriter()) {
//                    out.print("<p>Recommended Blogs</p>\n"
//                            + "                        <hr/>\n"
//                            + "                        <input type=\"hidden\" id=\"hidden\" data-user=\"" + ModelStatic.useRumbler.getUserId() + "\"/>");
//                }
//                for (Iterator itr = randUser.iterator(); itr.hasNext();) {
//                    Users usr = (Users) itr.next();
//                    try (PrintWriter out = response.getWriter()) {
//
//                        out.print("<a href=\"FriendsBlog?user_id=" + usr.getUserId() + "\"><img class=\"radius left\" src=\"" + usr.getPicturePath() + "\" height=\"40\" width=\"40\"/>\n"
//                                + "                                <p class=\"left blogname\">" + usr.getUsername() + " </p></a>\n"
//                                + "                            <a href=\"#\"><span class=\"left\"><i class=\"fi-plus size-28 followTo\" data-user=\"" + usr.getUserId() + "\"></i></span></a>\n"
//                                + "                            <hr class=\"hr-child\"/>");
//                    }
//
//                }
                break;

            case "/FollowTo":
                System.out.println("follow to");
                Integer followTo = Integer.valueOf(request.getParameter("followTo"));
                Integer userId = Integer.valueOf(request.getParameter("userid"));
                System.out.println(followTo + " " + userId);

                HttpPost flwhttpPost = new HttpPost(ControllerDB.urlstatic + "people");
                String flwjson = "";
                JSONObject flwjsonObject = new JSONObject();
                flwjsonObject.accumulate("followTo", followTo);

                flwjson = flwjsonObject.toString();
                StringEntity flwse = new StringEntity(flwjson);
                flwhttpPost.setEntity(flwse);

                flwhttpPost.setHeader("Accept", "application/json");
                flwhttpPost.setHeader("Content-type", "application/json");

                HttpResponse flwhttpResponse = ControllerDB.httpClient.execute(flwhttpPost);
                inputStream = flwhttpResponse.getEntity().getContent();

                if (inputStream != null) {
                    result = convertInputStreamToString(inputStream);
                } else {
                    result = "Did not work!";
                }

                respon = new JSONObject(result);
                System.out.println(respon);
//                try {
//                    factory = util.HibernateUtil.getSessionFactory();
//                } catch (Throwable ex) {
//                    System.err.println("Failed to create sessionFactory object." + ex);
//                    throw new ExceptionInInitializerError(ex);
//                }
//                dbc.followTo(factory.openSession(), userId, followTo);
                try (PrintWriter out = response.getWriter()) {
                    out.print(respon.get("nama").toString());
                }
                break;

            case "/Unfollow":
                System.out.println("unfollow");
                Integer unfollow = Integer.valueOf(request.getParameter("unfollow"));
                Integer myId = Integer.valueOf(request.getParameter("userid"));
//                try {
//                    factory = util.HibernateUtil.getSessionFactory();
//                } catch (Throwable ex) {
//                    System.err.println("Failed to create sessionFactory object." + ex);
//                    throw new ExceptionInInitializerError(ex);
//                }
//                dbc.unfollowUser(factory.openSession(), myId, unfollow);
//                try (PrintWriter out = response.getWriter()) {
//                    out.print(dbc.selectFriendsName(factory.openSession(), unfollow));
//                }
                HttpPost uflwhttpPost = new HttpPost(ControllerDB.urlstatic + "people/remove");
                String uflwjson = "";
                JSONObject uflwjsonObject = new JSONObject();
                uflwjsonObject.accumulate("followTo", unfollow);

                uflwjson = uflwjsonObject.toString();
                StringEntity uflwse = new StringEntity(uflwjson);
                uflwhttpPost.setEntity(uflwse);

                uflwhttpPost.setHeader("Accept", "application/json");
                uflwhttpPost.setHeader("Content-type", "application/json");

                HttpResponse uflwhttpResponse = ControllerDB.httpClient.execute(uflwhttpPost);
                inputStream = uflwhttpResponse.getEntity().getContent();

                if (inputStream != null) {
                    result = convertInputStreamToString(inputStream);
                } else {
                    result = "Did not work!";
                }

                respon = new JSONObject(result);
                System.out.println(respon);
//                try {
//                    factory = util.HibernateUtil.getSessionFactory();
//                } catch (Throwable ex) {
//                    System.err.println("Failed to create sessionFactory object." + ex);
//                    throw new ExceptionInInitializerError(ex);
//                }
//                dbc.followTo(factory.openSession(), userId, followTo);
                try (PrintWriter out = response.getWriter()) {
                    out.print(respon.get("nama").toString());
                }
                break;
            case "/infiniteScroll":
//                response.setContentType("text/html;charset=UTF-8");
//
//                List<Posts> res = null;
//                try {
//                    factory = util.HibernateUtil.getSessionFactory();
//                } catch (Throwable ex) {
//                    System.err.println("Failed to create sessionFactory object." + ex);
//                    throw new ExceptionInInitializerError(ex);
//                }
//                res = dbc.selectPosts(factory.openSession(), ModelStatic.useRumbler.getUserId());
//                ArrayList<Posts> arr = new ArrayList<Posts>();
//                String pic = "";
//                try (PrintWriter out = response.getWriter()) {
//                    for (Posts entity : res) {
//                        arr.add(entity);
//                    }
//                    for (int i = n; i < n + 3; i++) {
//                        List<Users> res12 = dbc.selectOperator(factory.openSession(), (arr.get(i).getUsers().getUserId()));
//                        for (Users entity1 : res12) {
//                            pic = entity1.getPicturePath();
//                        }
//                        out.print("<div class=\"row\" style=\"display:none;\">");
//                        out.print("<div class=\"large-2 columns small-3 profpict\"><img class=\"radius\" src=\"" + pic + "\"/></div>");
//                        out.print("<div class=\"large-10 columns bubble radius\">");
//                        out.print("<section>");
//                        out.print("<p class=\"size-14\"><a href=\"FriendsBlog?user_id=" + arr.get(i).getUsers().getUserId() + "\">" + dbc.selectFriendsName(factory.openSession(), arr.get(i).getUsers().getUserId()) + "</a></p>");
//                        if (arr.get(i).getTitle() != null) {
//                            out.print("<header><h3 class=\"title\">" + arr.get(i).getTitle() + "</h3></header>");
//                        }
//                        if (arr.get(i).getContent() != null) {
//                            out.print("<p>" + arr.get(i).getContent() + "</p>");
//
//                        }
//                        if (!arr.get(i).getImage().equals("no image")) {
//                            out.print("<span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"Gambar\"><img src=\"" + arr.get(i).getImage() + "\" width=\"480\" height=\"320\" /></span>");
//
//                        }
//                        out.print("<hr/>");
//                        if (arr.get(i).getTag() != null) {
//                            out.print("<p>" + arr.get(i).getTag() + "</p>");
//                        }
//                        out.print("<ul class=\"inline-list\">\n"
//                                + "                                    <li><a href=\"#\"><i class=\"step fi-heart size-36\"></i></a></li>\n"
//                                + "                                    <li><a href=\"#\" data-reveal-id=\"commentModal\"><i class=\"step fi-comment size-36\"></i></a></li>\n"
//                                + "                                </ul>");
//                        out.print("</section>");
//                        out.print("<dl class=\"accordion radius\" data-accordion>");
//                        out.print("<dd class=\"accordion-navigation\">");
//                        out.print("<a href=\"#commentView" + arr.get(i).getPostId() + "\" >View Comments</a>");
//                        out.print("<div id=\"commentView" + arr.get(i).getPostId() + "\" class=\"content radius\">");
//                        out.print("<h6>2 Comments</h6>");
//                        out.print("<div class=\"row\">");
//                        out.print("<div class=\"large-2 columns small-3\"><span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"<%  %>\"><img src=\"http://placehold.it/50x50&text=[img]\"/></span></div>");
//                        out.print("<div class=\"large-10 columns\"><p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit</p></div>");
//                        out.print("</div>");
//
//                        out.print("<div class=\"row\">");
//                        out.print("<div class=\"large-2 columns small-3\"><span data-tooltip aria-haspopup=\"true\" class=\"has-tip radius tip-left\" title=\"Nama User\"><img src=\"http://placehold.it/50x50&text=[img]\"/></span></div>");
//                        out.print("<div class=\"large-10 columns\"><p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit</p></div>");
//
//                        out.print("</div>");
//                        out.print("</div>");
//                        out.print("</dd>");
//                        out.print("</dl>");
//                        out.print("</div>");
//                        out.print("</div>");
//                        out.print("<div class=\"jarak\"></div>");
//                    }
//                }
//                n += 3;
                break;

            case "/ServLogin":
                System.out.println(userPath);
                username = request.getParameter("login");
                password = request.getParameter("password");
//                try {
//                    password = dbc.MD5(request.getParameter("password"));
//                } catch (NoSuchAlgorithmException ex) {
//                    Logger.getLogger(ServController.class.getName()).log(Level.SEVERE, null, ex);
//                }
//                try {
//                    factory = util.HibernateUtil.getSessionFactory();
//                } catch (Throwable ex) {
//                    System.err.println("Failed to create sessionFactory object." + ex);
//                    throw new ExceptionInInitializerError(ex);
//                }
//                results = dbc.selectOperator(factory.openSession(), username);
//                try {
//                    for (Iterator itr = results.iterator(); itr.hasNext();) {
//                        Users usr = (Users) itr.next();
//                        ModelStatic.useRumbler = usr;
//                        if (username.equals(usr.getUsername()) && password.equals(usr.getPassword())) {
//                            HttpSession session = request.getSession();
//                            session.setAttribute("user", usr.getName());
//                            String encodedURL = response.encodeRedirectURL("index.jsp");
//                            response.sendRedirect(encodedURL);
//                        } else {
//                            errorLogin(request, response, username);
//                        }
//                        usrCount++;
//                    }
//                    if (usrCount <= 0) {
//                        errorLogin(request, response, username);
//                    }
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
                try {
                    HttpPost httpPost = new HttpPost(ControllerDB.urlstatic + "auth/");
                    String json = "";
                    JSONObject jsonObject = new JSONObject();

                    jsonObject.accumulate("email", username);
                    jsonObject.accumulate("password", password);

                    json = jsonObject.toString();
                    StringEntity se = new StringEntity(json);
                    httpPost.setEntity(se);

                    httpPost.setHeader("Accept", "application/json");
                    httpPost.setHeader("Content-type", "application/json");

                    HttpResponse httpResponse = ControllerDB.httpClient.execute(httpPost);

                    inputStream = httpResponse.getEntity().getContent();

                    if (inputStream != null) {
                        result = convertInputStreamToString(inputStream);
                    } else {
                        result = "Did not work!";
                    }

                    respon = new JSONObject(result);
                    //System.out.println(respon);
                } catch (Exception e) {
                    System.err.println(e.getLocalizedMessage());
                }
                //System.out.println("masuk\n\n\n aa");
                if (respon.get("status").equals("failed")) {
                    request.setAttribute("userVal", username);
                    request.setAttribute("reason", respon.get("reason"));
                    System.out.println("gagal");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
                    dispatcher.forward(request, response);
                } else {
                    JSONObject user = respon.getJSONObject("user");
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String dateInString = user.get("birthday").toString();
                    String regisDateStr = user.get("created_at").toString();
                    Date birthdate = new Date();
                    Date regisDate = new Date();
                    try {

                        birthdate = formatter.parse(dateInString);
                        regisDate = formatter.parse(regisDateStr);
//                        System.out.println(datess);
//                        System.out.println(formatter.format(datess));

                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    System.out.println("ayo ke index");
                    ModelStatic.useRumbler = new Users(user.get("name").toString(), user.get("username").toString(),
                            user.get("email").toString(), birthdate, user.get("password").toString(), user.get("description").toString(),
                            user.get("blog_title").toString(), regisDate, new Date(), user.get("picture_path").toString(), user.getInt("id"));

                    String encodedURL = response.encodeRedirectURL("index.jsp");
                    response.sendRedirect(encodedURL);
//                    try (PrintWriter out = response.getWriter()) {
//                        out.print(respon.getJSONObject("user"));
//                        out.println(ModelStatic.useRumbler.getName());
//                    }
//                    ModelStatic.useRumbler = gson.fromJson(respon.getJSONObject("user").toString(), ModelStatic.useRumbler.getClass());

                }

                break;

            case "/ServSignUp":
                System.out.println(userPath);
                username = request.getParameter("username");
                password = request.getParameter("password");
                email = request.getParameter("email");

                try {
                    HttpClient httpclient = ControllerDB.httpClient;
                    HttpPost httpPost = new HttpPost("http://localhost:8000/api/users/");
                    String json = "";
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.accumulate("username", username);
                    jsonObject.accumulate("password", password);
                    jsonObject.accumulate("email", email);

                    json = jsonObject.toString();
                    StringEntity se = new StringEntity(json);
                    httpPost.setEntity(se);

                    httpPost.setHeader("Accept", "application/json");
                    httpPost.setHeader("Content-type", "application/json");

                    HttpResponse httpResponse = httpclient.execute(httpPost);

                    inputStream = httpResponse.getEntity().getContent();

                    if (inputStream != null) {
                        result = convertInputStreamToString(inputStream);
                    } else {
                        result = "Did not work!";
                    }

                    respon = new JSONObject(result);

                } catch (Exception e) {
                    System.err.println(e.getLocalizedMessage());
                }

                if (respon.get("status").equals("failed")) {
                    JSONArray reason = respon.getJSONArray("reason");
                    String realReason = "";
                    for (int i = 0; i < reason.length(); i++) {
                        realReason += reason.get(i) + "<br>";
                    }
                    request.setAttribute("reason", realReason);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/signup.jsp");
                    dispatcher.forward(request, response);
                } else {
                    String encodedURL = response.encodeRedirectURL("login.jsp");
                    response.sendRedirect(encodedURL);
                }
                //print response from json
//                try (PrintWriter out = response.getWriter()) {
//                    out.print("status : "+respon.get("status")+"\nreason : "+respon.get("reason"));
//                }
//                String encodedURL = response.encodeRedirectURL("login.jsp");
//                response.sendRedirect(encodedURL);

                break;
            case "/UploadFile":
                if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
                    UploadMultiPartVoid(request, response, "image");
                }
                synchronized (this) {
                    try {
                        wait(1000);
                    } catch (InterruptedException e) {

                    }
                }
                String encodedURL1 = response.encodeRedirectURL("index.jsp");
                response.sendRedirect(encodedURL1);
                break;
            case "/PostLink":
                String ltitle = request.getParameter("post-title");

                //HttpPost httpPost = new HttpPost("http://localhost:8000/api/posts/");
                HttpPost lhttpPost = new HttpPost(ControllerDB.urlstatic + "post/link");
                String ljson = "";
                JSONObject ljsonObject = new JSONObject();
                ljsonObject.accumulate("content", ltitle);

                ljson = ljsonObject.toString();
                StringEntity lse = new StringEntity(ljson);
                lhttpPost.setEntity(lse);

                lhttpPost.setHeader("Accept", "application/json");
                lhttpPost.setHeader("Content-type", "application/json");

                HttpResponse lhttpResponse = ControllerDB.httpClient.execute(lhttpPost);
                inputStream = lhttpResponse.getEntity().getContent();

                if (inputStream != null) {
                    result = convertInputStreamToString(inputStream);
                } else {
                    result = "Did not work!";
                }

                respon = new JSONObject(result);
                System.out.println(respon);

                String lencodedURL2 = response.encodeRedirectURL("index.jsp");
                response.sendRedirect(lencodedURL2);
                break;
            case "/PostQuote":
                String qtitle = request.getParameter("post-title");
                String qtext = request.getParameter("post-content");
                String qfrom = request.getParameter("post-tag");
                //HttpPost httpPost = new HttpPost("http://localhost:8000/api/posts/");
                HttpPost qhttpPost = new HttpPost(ControllerDB.urlstatic + "post/quote");
                String qjson = "";
                JSONObject qjsonObject = new JSONObject();
                qjsonObject.accumulate("quote", qtext);
                qjsonObject.accumulate("title", qtitle);
                qjsonObject.accumulate("from", qfrom);

                qjson = qjsonObject.toString();
                StringEntity qse = new StringEntity(qjson);
                qhttpPost.setEntity(qse);

                qhttpPost.setHeader("Accept", "application/json");
                qhttpPost.setHeader("Content-type", "application/json");

                HttpResponse qhttpResponse = ControllerDB.httpClient.execute(qhttpPost);
                inputStream = qhttpResponse.getEntity().getContent();

                if (inputStream != null) {
                    result = convertInputStreamToString(inputStream);
                } else {
                    result = "Did not work!";
                }

                respon = new JSONObject(result);
                System.out.println(respon);

                String encodedURL2 = response.encodeRedirectURL("index.jsp");
                response.sendRedirect(encodedURL2);
                break;
            case "/PostText":

                String title = request.getParameter("post-title");
                String text = request.getParameter("post-content");
                String hastag = request.getParameter("post-tag");
                //HttpPost httpPost = new HttpPost("http://localhost:8000/api/posts/");
                HttpPost httpPost = new HttpPost(ControllerDB.urlstatic + "posts/");
                String json = "";
                JSONObject jsonObject = new JSONObject();
                jsonObject.accumulate("content", text);
                jsonObject.accumulate("title", title);
                jsonObject.accumulate("tag", hastag);

                json = jsonObject.toString();
                StringEntity se = new StringEntity(json);
                httpPost.setEntity(se);

                httpPost.setHeader("Accept", "application/json");
                httpPost.setHeader("Content-type", "application/json");

                HttpResponse httpResponse = ControllerDB.httpClient.execute(httpPost);
                inputStream = httpResponse.getEntity().getContent();

                if (inputStream != null) {
                    result = convertInputStreamToString(inputStream);
                } else {
                    result = "Did not work!";
                }

                respon = new JSONObject(result);
                System.out.println(respon);

                String qencodedURL2 = response.encodeRedirectURL("index.jsp");
                response.sendRedirect(qencodedURL2);
                break;
            case "/UploadVideo":
                UploadMultiPartVoid(request, response, "video");
                response.sendRedirect("index.jsp");
                break;
            case "/settingGeneral": {
                try {

                    String text1 = "";
                    String fileName = "";
                    int count = 0;
                    UploadSeting(request, response);
                    System.out.println(listz.size());
//                    System.out.println(userPath);
//                    try {
//                        factory = util.HibernateUtil.getSessionFactory();
//                    } catch (Throwable ex) {
//                        System.err.println("Failed to create sessionFactory object." + ex);
//                        throw new ExceptionInInitializerError(ex);
//                    }

                    email = this.email;
                    date = this.date;
                    blog = this.blog;
                    name = this.name;
                    password = this.password;//== "" ? ModelStatic.useRumbler.getPassword() : dbc.MD5(this.password);
                    Date dates = new Date();
                    System.out.println(email + date + blog + name + dates);
                    try {
                        dates = new SimpleDateFormat("MMMM dd, yyyy").parse(date);
                        System.out.println(dates);
                    } catch (ParseException ex) {
                        Logger.getLogger(ServController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    System.out.println("beres");
                    String path = this.pathDB == "" ? "assets/img/ProfPic/default.png" : this.pathDB;
//                    dbc.updateOperation(factory.openSession(), password, email, dates, blog, name, ModelStatic.useRumbler.getUserId(), path);
                    response.sendRedirect("setting.jsp");
                } catch (FileUploadException ex) {
                    Logger.getLogger(ServController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(ServController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;
            case "/settingNotif":
//                System.out.println(userPath);
//                try {
//                    factory = util.HibernateUtil.getSessionFactory();
//                } catch (Throwable ex) {
//                    System.err.println("Failed to create sessionFactory object." + ex);
//                    throw new ExceptionInInitializerError(ex);
//                }
//
//                int like = request.getParameter("likesNotif") == null ? 0 : 1;
//                int comN = request.getParameter("commentsNotif") == null ? 0 : 1;
//                int fol = request.getParameter("followerNotif") == null ? 0 : 1;
//                Date dates2 = new Date();
//                dbc.updateOperation(factory.openSession(), like, comN, fol, ModelStatic.useRumbler.getUserId());
//                reqDispatcher = request.getRequestDispatcher("setting.jsp");
//                reqDispatcher.forward(request, response);
//                break;
            case "/commentHandle":
                int post_id = Integer.parseInt(request.getParameter("post_id"));
                int userPost = Integer.parseInt(request.getParameter("user_id"));
                String content = request.getParameter("commentContent");

                HttpPost chttpPost = new HttpPost(ControllerDB.urlstatic + "comments/");
                String cjson = "";
                JSONObject cjsonObject = new JSONObject();
                cjsonObject.accumulate("content", content);
                cjsonObject.accumulate("postid", post_id);

                cjson = cjsonObject.toString();
                StringEntity cse = new StringEntity(cjson);
                chttpPost.setEntity(cse);

                chttpPost.setHeader("Accept", "application/json");
                chttpPost.setHeader("Content-type", "application/json");

                HttpResponse chttpResponse = ControllerDB.httpClient.execute(chttpPost);
                inputStream = chttpResponse.getEntity().getContent();

                if (inputStream != null) {
                    result = convertInputStreamToString(inputStream);
                } else {
                    result = "Did not work!";
                }

                respon = new JSONObject(result);
                System.out.println(respon);

                response.sendRedirect("index.jsp");
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

    public static String convertInputStreamToString(InputStream inputStream) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
        String line = "";
        String result = "";
        while ((line = bufferedReader.readLine()) != null) {
            result += line;
        }

        inputStream.close();
        return result;

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
        String path = "\\assets\\img\\PostPic\\";
        String text1 = "";
        String fileName = "";

        System.out.println("--------- upload multipart void " + jenis);
        DiskFileItemFactory factorys = new DiskFileItemFactory();
        factorys.setSizeThreshold(MAX_MEMORY_SIZE);
        factorys.setRepository(new File(System.getProperty("java.io.tmpdir")));
        String urlPath = getServletContext().getRealPath("").substring(0, getServletContext().getRealPath("").indexOf("build"));
        String uploadFolder = urlPath + DATA_DIRECTORY;
// System.out.println("uploadFolder:" + uploadFolder);
        ServletFileUpload upload = new ServletFileUpload(factorys);

        upload.setSizeMax(MAX_REQUEST_SIZE);
//<<<<<<< HEAD
//// SessionFactory factory;
//// DatabaseController dbc = new DatabaseController();
//// try {
//// factory = util.HibernateUtil.getSessionFactory();
//// } catch (Throwable ex) {
//// System.err.println("Failed to create sessionFactory object." + ex);
//// throw new ExceptionInInitializerError(ex);
//// }
//=======
//>>>>>>> 888f570e36592a6aa6e5486d5edeff1096f18758
        try {
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            System.out.println("Name file:" + ((FileItem) items.get(0)).getName());
            while (iter.hasNext()) {
                System.out.println("masuk ke while");
                FileItem item = (FileItem) iter.next();
                System.out.println("Size:" + item.getSize());
                if (!item.isFormField() && item.getSize() > 0) {
                    fileName = new File(item.getName()).getName();
                    String time = fileName.substring(fileName.indexOf(".") + 1, fileName.length());
// System.out.println("masuk ke if pertama");
                    if (jenis.equalsIgnoreCase("image")) {
                        if (time.equalsIgnoreCase("jpg") || time.equalsIgnoreCase("png") || time.equalsIgnoreCase("jpeg") || time.equalsIgnoreCase("gif")) {
                            System.out.println("FileName:" + fileName + "\nuploadFolder:" + uploadFolder);
                            String filePath = uploadFolder + File.separator + fileName;
                            File uploadedFile = new File(filePath);
                            System.out.println(filePath);
                            item.write(uploadedFile);

                        }
                    } else if (jenis.equalsIgnoreCase("video")) {
                        if (time.equalsIgnoreCase("webm") || time.equalsIgnoreCase("avi") || time.equalsIgnoreCase("mkv") || time.equalsIgnoreCase("mp4")) {
                            System.out.println("FileName:" + fileName + "\nuploadFolder:" + uploadFolder);
                            String filePath = uploadFolder + File.separator + fileName;
                            File uploadedFile = new File(filePath);
                            System.out.println(filePath);
                            item.write(uploadedFile);
                        }
                    }
                } else if (item.isFormField() && item.getSize() > 0) {
                    text1 = item.getString();
                    System.out.println("hashtag:" + text1);
                }
            }
            HttpPost httppost;
            if (jenis.equals("image")) {
                httppost = new HttpPost(ControllerDB.urlstatic + "post/image/");
            } else {
                httppost = new HttpPost(ControllerDB.urlstatic + "post/video/");
            }
            FileBody fileContent = new FileBody(new File(uploadFolder + File.separator + fileName));
            MultipartEntity reqEntity = new MultipartEntity();
            reqEntity.addPart("file", fileContent);

            StringBody comment = new StringBody(text1);
            reqEntity.addPart("hashtag", comment);
            httppost.setEntity(reqEntity);
            HttpResponse responses = ControllerDB.httpClient.execute(httppost);
            HttpEntity resEntity = responses.getEntity();
            InputStream inputStream = resEntity.getContent();
            if (inputStream == null) {
                System.out.println("gagal");
            } else {
                System.out.println("sukses");
                System.out.println(ServController.convertInputStreamToString(inputStream));
            }
        } catch (FileUploadException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void UploadSeting(HttpServletRequest request, HttpServletResponse response) throws ServletException, FileUploadException, Exception {
        String path = "web/assets/img/ProfPic";
        String text1 = "";
        String fileName = "";
        String path1 = "assets/img/ProfPic";
        System.out.println("--------- upload multipart void Setting");
        DiskFileItemFactory factorys = new DiskFileItemFactory();
        factorys.setSizeThreshold(MAX_MEMORY_SIZE);
        factorys.setRepository(new File(System.getProperty("java.io.tmpdir")));
        String urlPath = getServletContext().getRealPath("").substring(0, getServletContext().getRealPath("").indexOf("build"));
        String uploadFolder = urlPath + path;
        ServletFileUpload upload = new ServletFileUpload(factorys);

        upload.setSizeMax(MAX_REQUEST_SIZE);
        List items = upload.parseRequest(request);
        this.listz = items;
        int count = 0;
        Iterator iters = listz.iterator();
        while (iters.hasNext()) {
            System.out.println("masuk ke while");
            FileItem item = (FileItem) iters.next();
            System.out.println("Size:" + item.getSize());
            if (item.isFormField() && item.getSize() > 0) {
                text1 = item.getString();
                switch (count) {
                    case 0:
                        this.email = text1;
                        System.out.println("Email:" + this.email);
                        break;
                    case 1:
                        this.password = text1;
                        System.out.println("Password:" + this.password);
                        break;
                    case 2:
                        this.name = text1;
                        System.out.println("Name:" + this.name);
                        break;
                    case 3:
                        this.blog = text1;
                        System.out.println("Blog:" + this.blog);
                        break;
                    case 4:
                        this.date = text1;
                        System.out.println("Date:" + this.date);
                        break;
                }
                count++;
//                System.out.println("hashtag:" + text1);
            } else if (!item.isFormField() && item.getSize() > 0) {
                fileName = new File(item.getName()).getName();
                String time = fileName.substring(fileName.indexOf(".") + 1, fileName.length());
                System.out.println("masuk ke if pertama");
                if (time.equalsIgnoreCase("jpg") || time.equalsIgnoreCase("png") || time.equalsIgnoreCase("jpeg") || time.equalsIgnoreCase("gif")) {
                    System.out.println("FileName:" + fileName + "\nuploadFolder:" + uploadFolder);
                    this.pathDB = path1 + File.separator + fileName;
                    System.out.println("Path DB:" + this.pathDB);
                    String filePath = uploadFolder + File.separator + fileName;
                    File uploadedFile = new File(filePath);
                    System.out.println(filePath);
                    item.write(uploadedFile);
                }
            } else if (item.isFormField() && item.getSize() == 0) {
                count++;
            }
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
