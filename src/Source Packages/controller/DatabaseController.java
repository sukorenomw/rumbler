/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.*;
import model.Users;
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
        List results = null;
        try {
            tx = session.beginTransaction();
            String sql = "SELECT * FROM users WHERE username = '"+user+"'";
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(Users.class);
            results = query.list();
            /*for (Iterator itr = results.iterator(); itr.hasNext();) {
                Users usr = (Users) itr.next();
                System.out.println("user id = "+usr.getUserId() + "\nname : " + usr.getName());
            }*/
            tx.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return results;
    }
    public void inputOperation(){
        
    }
    public void deleteOperation(){
        
    }
    public void updateOperation(){
        
    }
}
