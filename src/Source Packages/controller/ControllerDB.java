/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.sun.media.jai.remote.JAIServerConfigurationSpi;
import static controller.ServController.convertInputStreamToString;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import model.Comments;
import model.Posts;
import model.Users;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.AbstractHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author giansebastian
 */
public class ControllerDB {

    public ControllerDB() {
    }
    public static HttpClient httpClient = new DefaultHttpClient();
    public static ArrayList<Posts> postclient = new ArrayList<>();
    public static String urlstatic = "http://192.168.1.11:8000/api/";

    public static ArrayList homePost() {
        JSONObject obj = controllPost();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        ArrayList<Posts> post = new ArrayList<>();
        //System.out.println(obj.getJSONArray("timeline").length());
        int a = 0;
//        while (obj.getJSONArray("timeline").get(a) != null) {
//            
//        }
        JSONArray tl = obj.getJSONArray("timeline");
        for (int i = 0; i < tl.length(); i++) {
//            System.out.println(((JSONObject) tl.get(i)).get("id"));
//            System.out.println("----");
            JSONArray comment = ((JSONObject) tl.get(i)).getJSONArray("comments");
            String title = ((JSONObject) tl.get(i)).getString("title");
            String content = ((JSONObject) tl.get(i)).getString("content");
            String tag = ((JSONObject) tl.get(i)).getString("tag");
            String regisDateStr = ((JSONObject) tl.get(i)).get("created_at").toString();
            Date regisDate = new Date();
            int isVideo = ((JSONObject) tl.get(i)).getInt("is_video");
            int isQuote = ((JSONObject) tl.get(i)).getInt("is_quote");
            int islink = ((JSONObject) tl.get(i)).getInt("is_link");
            ArrayList<Comments> arrcom = new ArrayList<Comments>(0);
            String image = ((JSONObject) tl.get(i)).getString("image");
            try {

                regisDate = formatter.parse(regisDateStr);
//                        System.out.println(datess);
//                        System.out.println(formatter.format(datess));

            } catch (ParseException e) {
                e.printStackTrace();
            }
            Posts po = new Posts(ambiluser(((JSONObject) tl.get(i)).getInt("userid")), title, content, regisDate, tag, isVideo, islink, isQuote);
            for (int j = 0; j < comment.length(); j++) {
//                System.out.println(((JSONObject) comment.get(j)).get("content"));
                Date regisDates = new Date();
                try {

                    regisDate = formatter.parse(regisDateStr);
//                        System.out.println(datess);
//                        System.out.println(formatter.format(datess));

                } catch (ParseException e) {
                    e.printStackTrace();
                }
                String contents = ((JSONObject) comment.get(j)).getString("content");
//                System.out.println(((JSONObject) comment.get(j)).get("userid"));
                Comments com = new Comments(po, ambiluser(((JSONObject) comment.get(j)).getInt("userid")), contents, regisDates, ((JSONObject) comment.get(j)).getInt("id"));
                arrcom.add(com);
                //  Comments com=new Comments()
            }

            Posts pos = new Posts(ambiluser(((JSONObject) tl.get(i)).getInt("userid")), title, content, regisDate, tag, isVideo, islink, isQuote, image, arrcom, ((JSONObject) tl.get(i)).getInt("id"));
//            System.out.println("------");
            post.add(pos);
        }
        postclient = post;
        return post;
    }

    public static ArrayList<Comments> arryComent(int postid) {
        ArrayList<Comments> com = new ArrayList<>();
        postclient = homePost();
        com = (ArrayList<Comments>) postclient.get(postid).getCommentses();
        return com;
    }

    public static JSONObject controllPost() {
        System.out.println("masuk postcontrol");
        JSONObject respons = new JSONObject();
        try {
            HttpGet httpGet = new HttpGet(urlstatic + "timeline");

            httpGet.setHeader("Accept", "application/json");
            httpGet.setHeader("Content-type", "application/json");
            HttpResponse httpResponse = httpClient.execute(httpGet);
            InputStream inputStream = httpResponse.getEntity().getContent();
            String result = "";
            if (inputStream != null) {
                result = convertInputStreamToString(inputStream);
            } else {
                result = "Did not work!";
            }
//            System.out.println(result);
            respons = new JSONObject(result);
        } catch (Exception e) {
            System.err.println(e.getLocalizedMessage());
        }
        //System.out.println(respons);
//        System.out.println(respons);
//                    String encodedURL = response.encodeRedirectURL("login.jsp");
//                    response.sendRedirect(encodedURL
//        System.out.println(respons);
        return respons;
    }

    public static int isLiked(int userid, int postid) {
        System.out.println("a" + userid + postid);
        int a = 1;
        return a;
    }

    public static Users ambiluser(int iduser) {
        //System.out.println("ID user:" + iduser);
        JSONObject res = new JSONObject();
//        res=controllPost();
        JSONObject respons = new JSONObject();
        try {
            HttpGet get = new HttpGet(urlstatic + "users/" + iduser);
            HttpClient httpClients = new DefaultHttpClient();
            get.setHeader("Accept", "application/json");
            get.setHeader("Content-type", "application/json");
            HttpResponse httpResponse;
            httpResponse = httpClients.execute(get);
            InputStream inputStream = httpResponse.getEntity().getContent();
            String result = "";
            if (inputStream != null) {
                result = convertInputStreamToString(inputStream);
//                System.out.println("ga null");
            } else {
                result = "Did not work!";
            }
            // System.out.println(result);
            respons = new JSONObject(result);
        } catch (IOException ex) {
            Logger.getLogger(ControllerDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        Users usr = new Users();
        // System.out.println(respons);
        String name = ((JSONObject) respons.get("users")).getString("name");
        String path = ((JSONObject) respons.get("users")).getString("picture_path");
        int userid=((JSONObject) respons.get("users")).getInt("id");
        usr.setName(name);
        usr.setPicturePath(path);
        usr.setUserId(userid);
        return usr;
    }

    public static List listpost() {
        List<Posts> a = null;
        JSONObject obj = new JSONObject();
        return a;
    }

    private static String convertInputStreamToString(InputStream inputStream) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
        String line = "";
        String result = "";
        while ((line = bufferedReader.readLine()) != null) {
            result += line;
        }

        inputStream.close();
        return result;

    }

//    public static void print(List a) {
//        System.out.println(((Posts) a.get(0)).getContent());
//    }
//
//    public static void printarr(ArrayList a) {
//        System.out.println(((Posts) a.get(0)).getContent());
//    }
//
    public static void printpich(String a) {
        System.out.println(a);
    }

//    public static void printInt(int a) {
//        System.out.println(a);
//    }
//
//    public static void prints(List a) {
//        System.out.println(((Comments) a.get(0)).getContent());
//    }

    public static ArrayList selectUsers(String user) throws IOException {
        JSONArray respons;
        ArrayList<Users> users = new ArrayList<>();
        HttpGet get = new HttpGet(ControllerDB.urlstatic + "users/search/" + user);
        HttpClient httpClients = new DefaultHttpClient();
        get.setHeader("Accept", "application/json");
        get.setHeader("Content-type", "application/json");
        HttpResponse httpResponse;
        httpResponse = httpClients.execute(get);
        InputStream inputStream = httpResponse.getEntity().getContent();
        String result = "";
        if (inputStream != null) {
            result = convertInputStreamToString(inputStream);
//                System.out.println("ga null");
        } else {
            result = "Did not work!";
        }
//         System.out.println(result);
        JSONObject respon = new JSONObject(result);
        respons = new JSONArray();
        respons = respon.getJSONArray("users");
       // System.out.println(((JSONObject) respons.get(0)).get("name"));
        for (int b = 0; b < respons.length(); b++) {
            Users usr = new Users();
            usr.setPicturePath(((JSONObject) respons.get(0)).getString("picture_path"));
            usr.setName(((JSONObject) respons.get(0)).getString("name"));
            usr.setUserId(((JSONObject) respons.get(0)).getInt("id"));
           // System.out.println("ISI ARRAY:" + usr);
            users.add(usr);
        }
        return users;
    }
    public static ArrayList randUsrs() throws IOException{
        ArrayList<Users> randuser=new ArrayList();
        
        HttpGet get = new HttpGet(ControllerDB.urlstatic + "users/random");
        HttpClient httpClients = new DefaultHttpClient();
        get.setHeader("Accept", "application/json");
        get.setHeader("Content-type", "application/json");
        HttpResponse httpResponse;
        httpResponse = httpClients.execute(get);
        InputStream inputStream = httpResponse.getEntity().getContent();
        String result = "";
        if (inputStream != null) {
            result = convertInputStreamToString(inputStream);
//                System.out.println("ga null");
        } else {
            result = "Did not work!";
        }
//         System.out.println(result);
        JSONObject respon = new JSONObject(result);
        JSONArray respons = new JSONArray();
        respons = respon.getJSONArray("users");
       // System.out.println(((JSONObject) respons.get(0)).get("name"));
        for (int b = 0; b < respons.length(); b++) {
            Users usr = new Users();
            String picpath=((JSONObject) respons.get(b)).getString("picture_path");
            usr.setPicturePath(picpath);
            String name=((JSONObject) respons.get(b)).getString("name");
            usr.setName(name);
            int useridn=((JSONObject) respons.get(b)).getInt("id");
            usr.setUserId(useridn);
            System.out.println("ISI name:"+name);
            System.out.println("ISI picturepath:"+picpath);
            System.out.println("ISI id:"+useridn);
            
            randuser.add(usr);
        }
        System.out.println(randuser.get(0).getName()+"hahaha");
        return randuser;
    }
    public static void printUser(Users u) {
        System.out.println(u.getName());
        System.out.println(u.getPicturePath());
    }

}
