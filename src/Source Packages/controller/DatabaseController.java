/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import model.Comments;
import model.Notifications;
import model.Posts;
import model.Users;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Epen
 */
public class DatabaseController {

    public List selectOperator(Session session, String user) {
        Transaction tx = null;
        List res = null;
        String hql = "";
        try {
            tx = session.beginTransaction();
            hql = "FROM Users u WHERE u.username = '" + user + "'";
            Query qry = session.createQuery(hql);
            res = qry.list();

            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return res;
    }
//    SELECT * FROM users ORDER BY RAND() LIMIT 5 

    public List selectRandomUsers(Session session, Integer userid) {
        Transaction tx = null;
        List res = null;
        String hql = "";
        try {
            tx = session.beginTransaction();
            hql = "SELECT * FROM users WHERE user_id NOT IN (SELECT follower_id FROM followers WHERE user_id =" + userid + ") ORDER BY RAND() LIMIT 5";
            Query qry = session.createSQLQuery(hql).addEntity(Users.class);
            res = qry.list();
            for (Iterator itr = res.iterator(); itr.hasNext();) {
                Users usr = (Users) itr.next();
                System.out.println("name (randUser) : " + usr.getName());

            }
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return res;
    }

    public List selectFollowers(Session session, int userid) {
        Transaction tx = null;
        List res = null;
        String hql = "";
        try {
            tx = session.beginTransaction();
            hql = "SELECT * FROM users WHERE user_id IN (SELECT follower_id FROM followers WHERE user_id = " + userid + ")";
            Query qry = session.createSQLQuery(hql).addEntity(Users.class);
            res = qry.list();
            for (Iterator itr = res.iterator(); itr.hasNext();) {
                Users usr = (Users) itr.next();
                System.out.println("name (randUser) : " + usr.getName());

            }
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return res;
    }

    public List selectOperator(Session session, int user) {
        Transaction tx = null;
        List res = null;
        String hql = "";
        try {
            tx = session.beginTransaction();
            hql = "FROM Users u WHERE u.userId = " + user + "";
            Query qry = session.createQuery(hql);
            res = qry.list();
            System.out.println("sukses masuk");
            for (Iterator itr = res.iterator(); itr.hasNext();) {
                Users usr = (Users) itr.next();
                System.out.println("user id = " + usr.getUserId() + "\nname : " + usr.getName() + " ppost = " + usr.getPostses().size());
                for (Posts obj : usr.getPostses()) {
                    System.out.println("title = " + ((Posts) obj).getTitle());
                }
            }
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return res;
    }

    public List selectUsers(Session session, String user) {
        Transaction tx = null;
        List<Users> res = null;
        String name = "";
        try {
            tx = session.beginTransaction();
            System.out.println("test " + user);
            String sql = "Select * from users WHERE name LIKE '%" + user + "%' OR email LIKE '%" + user + "%' OR username LIKE '%" + user + "%'";
            Query qry = session.createSQLQuery(sql).addEntity(Users.class);
            res = qry.list();
            for (Users entity : res) {
                System.out.println("data 2= " + entity.getName().toString());
            }
//            for (String entity : res) {
//                System.out.println("data = " + entity);
//                name = entity;
//            }

            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return res;
    }

    public void updateOperation(Session session, String password, String email, Date date, String blog, String name, int user, String path) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;
            sql = "Update users set name = :name, email = :email,birthday = :birthday, blog_title = :blog, password = :password ,picture_path= :path where user_id = " + user;
            qry = session.createSQLQuery(sql);
            qry.setParameter("name", name);
            qry.setParameter("email", email);
            qry.setParameter("password", password);
            qry.setParameter("blog", blog);
            qry.setDate("birthday", date);
            qry.setParameter("path", path);
            qry.executeUpdate();
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void likePost(Session session, Integer userId, Integer postId) {
        Transaction tx = null;
        List res = null;
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;

            sql = "INSERT INTO likes(post_id, user_id) VALUES (:userId, :postId)";
            qry = session.createSQLQuery(sql);
            qry.setParameter("postId", postId);
            qry.setParameter("userId", userId);
            qry.executeUpdate();

            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void unlikePost(Session session, Integer userId, Integer postId) {
        Transaction tx = null;
        List res = null;
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;

            sql = "DELETE FROM likes WHERE user_id = " + userId + " AND post_id = " + postId;
            qry = session.createSQLQuery(sql);
            qry.executeUpdate();

            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void followTo(Session session, Integer userId, Integer followTo) {
        Transaction tx = null;
        List res = null;
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;

            sql = "INSERT INTO followers(user_id, follower_id) VALUES (:userId, :followTo)";
            qry = session.createSQLQuery(sql);
            qry.setParameter("userId", userId);
            qry.setParameter("followTo", followTo);
            qry.executeUpdate();

            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void unfollowUser(Session session, Integer userId, Integer unfollow) {
        Transaction tx = null;
        List res = null;
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;

            sql = "DELETE FROM followers WHERE user_id = " + userId + " AND follower_id = " + unfollow;
            qry = session.createSQLQuery(sql);
            qry.executeUpdate();

            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void inputOperation(Session session, String user, String password, String email, String kond) {
        Transaction tx = null;
        List res = null;
        String name = "";
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;
            switch (kond) {
                case "signup":
                    sql = "INSERT INTO users(username,email,password) VALUES (:user,:email,:password)";
                    qry = session.createSQLQuery(sql);
                    qry.setParameter("user", user);
                    qry.setParameter("email", email);
                    qry.setParameter("password", MD5(password));
                    qry.executeUpdate();
                    break;

            }
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void inputOperation(Session session, int user) {
        Transaction tx = null;
        List res = null;
        String name = "";
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;
            sql = "INSERT INTO settings(user_id) VALUES (:user)";
            qry = session.createSQLQuery(sql);
            qry.setParameter("user", user);
            qry.executeUpdate();
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void deleteOperation() {

    }

    public void updateOperation(Session session, int email, int date, int username, int name, int user) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;
            sql = "Update settings set realname = :name, email = :email,birthday = :birthday, username= :username where user_id = " + user;
            qry = session.createSQLQuery(sql);
            qry.setParameter("name", name);
            qry.setParameter("email", email);
            qry.setParameter("birthday", date);
            qry.setParameter("username", username);
            qry.executeUpdate();
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void updateOperation(Session session, int like, int comN, int fol, int user) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;
            sql = "Update settings set newFollower = :fol, newLikes = :like,newComment = :comN where user_id = " + user;
            qry = session.createSQLQuery(sql);
            qry.setParameter("fol", fol);
            qry.setParameter("like", like);
            qry.setParameter("comN", comN);
            qry.executeUpdate();
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void updateOperation(Session session, String password, String email, Date date, String blog, String name, int user) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;
            sql = "Update users set name = :name, email = :email,birthday = :birthday, blog_title = :blog, password = :password where user_id = " + user;
            qry = session.createSQLQuery(sql);
            qry.setParameter("name", name);
            qry.setParameter("email", email);
            qry.setParameter("password", password);
            qry.setParameter("blog", blog);
            qry.setDate("birthday", date);
            qry.executeUpdate();
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void insertOperation(Session session, String title, String text, String hastag, int user) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;
            Date dates = Calendar.getInstance().getTime();
            sql = "Insert into posts(user_id,title,content,tag,created_at,isvideo) VALUES(:user_id,:title,:content,:hashtag,:time,:vid)";
            qry = session.createSQLQuery(sql);
            qry.setParameter("user_id", user);
            qry.setParameter("title", title);
            qry.setParameter("content", text);
            qry.setParameter("hashtag", hastag);
            qry.setTimestamp("time", dates);
            qry.setParameter("vid", 0);
            qry.executeUpdate();
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void insertOperation(Session session, int post, int user, String content) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;
            Date dates = Calendar.getInstance().getTime();
            sql = "Insert into comments(user_id,post_id,content,created_at) VALUES(:user,:post,:content,:time)";
            qry = session.createSQLQuery(sql);
            qry.setParameter("user", user);
            qry.setParameter("post", post);
            qry.setParameter("content", content);
            qry.setTimestamp("time", dates);
            qry.executeUpdate();
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void insertOperation(Session session, String tag, String path, int user) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query qry;
            String sql;
            Date dates = Calendar.getInstance().getTime();
            sql = "Insert into posts(user_id,image,tag,created_at,isvideo) VALUES(:user_id,:path,:hashtag,:time,:vid)";
            qry = session.createSQLQuery(sql);
            qry.setParameter("user_id", user);
            qry.setParameter("path", path);
            qry.setParameter("hashtag", tag);
            qry.setTimestamp("time", dates);
            qry.setParameter("vid", 0);
            qry.executeUpdate();
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public String selectFriendsName(Session session, int user) {
        Transaction tx = null;
        List<String> res = null;
        String name = "";
        try {
            tx = session.beginTransaction();
            String sql = "Select name from users WHERE user_id = " + user;
            Query qry = session.createSQLQuery(sql);
            res = qry.list();
            for (String entity : res) {
                System.out.println("data = " + entity);
                name = entity;
            }

            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return name;
    }

    public String selectPicturePath(Session session, int user) {
        Transaction tx = null;
        List<String> res = null;
        String name = "";
        try {
            tx = session.beginTransaction();
            String sql = "Select picture_path from users WHERE user_id = " + user;
            Query qry = session.createSQLQuery(sql);
            res = qry.list();
            for (String entity : res) {
                System.out.println("data = " + entity);
                name = entity;
            }

            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return name;
    }
    
    public Integer isFollowing(Session session, int user1, int user2) {
        Transaction tx = null;
        List res;
        Integer ret = 0;
        try {
            tx = session.beginTransaction();
            String sql = "SELECT * FROM followers WHERE user_id = " + user1 + " AND follower_id = " + user2;
            Query qry = session.createSQLQuery(sql);
            res = qry.list();
            System.out.println("ret : " + res.size());
            ret = res.size();
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return ret;
    }

    public Integer isLiked(Session session, int user, int postid) {
        Transaction tx = null;
        List res;
        Integer ret = 0;
        try {
            tx = session.beginTransaction();
            String sql = "SELECT * FROM likes WHERE user_id = " + user + " AND post_id = " + postid;
            Query qry = session.createSQLQuery(sql);
            res = qry.list();
            System.out.println("ret : " + res.size());
            ret = res.size();
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return ret;
    }

    public List selectPosts(Session session, int user) {
        Transaction tx = null;
        List<Posts> res = null;
        try {
            tx = session.beginTransaction();
            String sql = "select * from posts where user_id = " + user + " OR user_id in (select follower_id from followers where user_id = " + user + ") ORDER BY created_at DESC";
            Query qry = session.createSQLQuery(sql).addEntity(Posts.class);
            res = qry.list();
            for (Posts entity : res) {
                System.out.println("data = " + entity.getTitle());
            }
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return res;
    }

    public void updateModelStatic(String username) {
        SessionFactory factory;
        Integer usrCount = 0;
        List results;
        try {
            factory = util.HibernateUtil.getSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
        results = selectOperator(factory.openSession(), username);
        try {
            for (Iterator itr = results.iterator(); itr.hasNext();) {
                Users usr = (Users) itr.next();
                ModelStatic.useRumbler = usr;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List selectComments(Session session, int post) {
        Transaction tx = null;
        List<Comments> res = null;
        try {
            tx = session.beginTransaction();
            String sql = "select * from comments where post_id = " + post + " ORDER BY created_at DESC";
            Query qry = session.createSQLQuery(sql).addEntity(Comments.class);
            res = qry.list();
//            for (Comments entity : res) {
//                System.out.println("data comment= " + entity.getUsers().getName());
//            }
//            ArrayList<Comments> arrCom = new ArrayList<Comments>();
//            for (Comments entity : res) {
//                arrCom.add(entity);
//            }
//            for (int i = 0; i < arrCom.size(); i++) {
//                System.out.println("data comment : "+arrCom.get(i).getUsers().getName());
//            }
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return res;
    }

    public List selecNotifs(Session session, int user) {
        Transaction tx = null;
        List<Notifications> res = null;
        try {
            tx = session.beginTransaction();
            String sql = "select * from notifications where user_id = " + user;
            //+" OR user_id in (select follower_id from followers where user_id = " + user + ") ORDER BY created_at DESC"
            Query qry = session.createSQLQuery(sql).addEntity(Notifications.class);
            res = qry.list();
//            for (Notifications entity : res) {
//                System.out.println("data = " + entity.getContent());
//            }
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return res;
    }

    public String MD5(String password) throws NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
    }
}
