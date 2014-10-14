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

    public List selectOperator(Session session,String user) {
        Transaction tx = null;
        List res = null;
        try {
            tx = session.beginTransaction();
            String hql = "FROM Users u WHERE u.username = '"+user+"'";
            Query qry = session.createQuery(hql);
            res = qry.list();
            for (Iterator itr = res.iterator(); itr.hasNext();) {
                Users usr = (Users) itr.next();
                System.out.println("user id = "+usr.getUserId() + "\nname : " + usr.getName()+" ppost = "+usr.getPostses().size());
                for(Posts obj : usr.getPostses()){
                    System.out.println("title = "+((Posts)obj).getTitle());
                }
            }
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return res;
    }
    public void inputOperation(){
        
    }
    public void deleteOperation(){
        
    }
    public void updateOperation(){
        
    }
    public List selectPosts(Session session,int user) {
        Transaction tx = null;
        List<Posts> res = null;
        try {
            tx = session.beginTransaction();
            String sql = "select * from posts where user_id = "+user+" OR user_id in (select follower_id from followers where user_id = "+user+")";
            Query qry = session.createSQLQuery(sql).addEntity(Posts.class);
            res = qry.list();
            for (Posts entity : res) {
                System.out.println("data = "+entity.getTitle());
            }
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return res;
    }
}
