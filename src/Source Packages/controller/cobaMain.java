/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static com.sun.xml.bind.util.CalendarConv.formatter;
import static controller.ControllerDB.ambiluser;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import model.Comments;
import model.Posts;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author giansebastian
 */
public class cobaMain {

    public static void loginDBweb(HttpClient client) {
        JSONObject respons = new JSONObject();
        System.out.println("masuk login");
        String username = "sukorenomw@gmail.com";
        String password = "asdfasdf";

        // System.out.println(usernames+passwords);
        try {
            HttpPost httpPost = new HttpPost("http://192.168.43.97:8000/api/auth/");
            String json = "";
            JSONObject jsonObject = new JSONObject();
            jsonObject.accumulate("email", username);
            jsonObject.accumulate("password", password);
            json = jsonObject.toString();
            StringEntity se = new StringEntity(json);
            httpPost.setEntity(se);
            httpPost.setHeader("Accept", "application/json");
            httpPost.setHeader("Content-type", "application/json");
            HttpResponse httpResponse = client.execute(httpPost);
            InputStream inputStream = httpResponse.getEntity().getContent();
            String result = "";
            if (inputStream != null) {
                result = convertInputStreamToString(inputStream);
            } else {
                result = "Did not work!";
            }
            respons = new JSONObject(result);
//            System.out.println(respons);
            //System.out.println(respons.getJSONObject("user").get("id"));
        } catch (Exception e) {
            System.err.println(e.getLocalizedMessage());
        } finally {
//            controllPost();
        }

    }

    public static void main(String[] args) {
        HttpClient client = new DefaultHttpClient();
        ControllerDB db = new ControllerDB(client);
        loginDBweb(client);
        JSONObject obj = (db.controllPost());
//        JSONObject timeline = obj.getJSONObject("timeline");
        System.out.println(((JSONObject) obj.getJSONArray("timeline").get(0)).get("is_link"));
        JSONArray tl = obj.getJSONArray("timeline");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

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
            Posts po = new Posts(db.ambiluser(((JSONObject) tl.get(i)).getInt("userid")), title, content, regisDate, tag, isVideo, islink, isQuote);
            for (int j = 0; j < comment.length(); j++) {
                Date regisDates = new Date();
                try {

                    regisDate = formatter.parse(regisDateStr);
//                        System.out.println(datess);
//                        System.out.println(formatter.format(datess));

                } catch (ParseException e) {
                    e.printStackTrace();
                }
                String contents = ((JSONObject) comment.get(j)).getString("content");
                System.out.println("UserID:" + ((JSONObject) comment.get(j)).get("userid"));
                Comments com = new Comments(po, ambiluser(((JSONObject) comment.get(j)).getInt("userid")), contents, regisDates);
                arrcom.add(com);
                System.out.println("User:" + com.getUsers().getName());
            }

            Posts pos = new Posts(ambiluser(((JSONObject) tl.get(i)).getInt("userid")), title, content, regisDate, tag, isVideo, islink, isQuote, image, arrcom);
            System.out.println("------");

        }
//        int id=((JSONObject)
//        ((JSONObject)obj.getJSONArray("timeline").get(0)).getJSONArray("comments").get(0)).getInt("userid");
//        JSONObject user1=db.ambiluser(id);

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
