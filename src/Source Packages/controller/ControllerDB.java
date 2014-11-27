/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
    
    public ControllerDB(HttpClient clients) {
        this.httpClient = clients;
    }
    public static HttpClient httpClient = new DefaultHttpClient();
    
    public static ArrayList homePost() {
        JSONObject obj = controllPost();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        ArrayList<Posts> post = new ArrayList<>();
        System.out.println(obj.getJSONArray("timeline").length());
        int a = 0;
//        while (obj.getJSONArray("timeline").get(a) != null) {
//            
//        }
        JSONArray tl = obj.getJSONArray("timeline");
        for (int i = 0; i < tl.length(); i++) {
            System.out.println(((JSONObject) tl.get(i)).get("id"));
            System.out.println("----");
            JSONArray comment = ((JSONObject) tl.get(i)).getJSONArray("comments");
            String title = ((JSONObject) tl.get(i)).getString("title");
            String content = ((JSONObject) tl.get(i)).getString("content");
            String tag = ((JSONObject) tl.get(i)).getString("tag");
            String regisDateStr = ((JSONObject) tl.get(i)).get("created_at").toString();
            Date regisDate = new Date();
            int isVideo = ((JSONObject) tl.get(i)).getInt("is_video");
            int isQuote = ((JSONObject) tl.get(i)).getInt("is_quote");
            int islink = ((JSONObject) tl.get(i)).getInt("is_link");
            Set<Comments> arrcom = new HashSet<Comments>(0);
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
                System.out.println(((JSONObject) comment.get(j)).get("content"));
                Date regisDates = new Date();
                try {
                    
                    regisDate = formatter.parse(regisDateStr);
//                        System.out.println(datess);
//                        System.out.println(formatter.format(datess));

                } catch (ParseException e) {
                    e.printStackTrace();
                }
                String contents = ((JSONObject) comment.get(j)).getString("content");
                System.out.println(((JSONObject) comment.get(j)).get("userid"));
                Comments com = new Comments(po, ambiluser(((JSONObject) comment.get(j)).getInt("userid")), contents, regisDates);
                arrcom.add(com);
                //  Comments com=new Comments()
            }
            
            Posts pos = new Posts(ambiluser(((JSONObject) tl.get(i)).getInt("userid")), title, content, regisDate, tag, isVideo, islink, isQuote, image, arrcom);
            System.out.println("------");
            post.add(pos);
        }
        
        return post;
    }
    
    public static JSONObject controllPost() {
        System.out.println("masuk postcontrol");
        JSONObject respons = new JSONObject();
        try {
            HttpGet httpGet = new HttpGet("http://192.168.43.97:8000/api/timeline");
            
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

//        System.out.println(respons);
//                    String encodedURL = response.encodeRedirectURL("login.jsp");
//                    response.sendRedirect(encodedURL
        return respons;
    }
    
    public static Users ambiluser(int iduser) {
        JSONObject res = new JSONObject();
//        res=controllPost();
        JSONObject respons = new JSONObject();
        try {
            HttpGet get = new HttpGet("http://192.168.43.97:8000/api/users/" + iduser);
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
        String name = ((JSONObject) respons.get("users")).getString("name");
        String path = ((JSONObject) respons.get("users")).getString("picture_path");
        usr.setName(name);
        usr.setPicturePath(path);
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
    
}
