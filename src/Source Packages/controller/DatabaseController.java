/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.*;
import model.Posts;
import model.Users;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Epen
 */
public class DatabaseController {

    public List selectOperator(Session session, String user) {
        Transaction tx = null;
        List res = null;
        try {
            tx = session.beginTransaction();
            String hql = "FROM Users u WHERE u.username = '" + user + "'";
            Query qry = session.createQuery(hql);
            res = qry.list();
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
                    qry.setParameter("password", password);
                    qry.executeUpdate();
                    break;
            }
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
    }

    public void deleteOperation() {

    }

    public void updateOperation() {

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
}
