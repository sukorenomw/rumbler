package model;
// Generated Oct 4, 2014 6:56:41 PM by Hibernate Tools 4.3.1



/**
 * Settings generated by hbm2java
 */
public class Settings  implements java.io.Serializable {


     private int userId;
     private Users users;
     private int username;
     private int realname;
     private int birthday;
     private int email;

    public Settings() {
    }

    public Settings(Users users, int username, int realname, int birthday, int email) {
       this.users = users;
       this.username = username;
       this.realname = realname;
       this.birthday = birthday;
       this.email = email;
    }
   
    public int getUserId() {
        return this.userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public int getUsername() {
        return this.username;
    }
    
    public void setUsername(int username) {
        this.username = username;
    }
    public int getRealname() {
        return this.realname;
    }
    
    public void setRealname(int realname) {
        this.realname = realname;
    }
    public int getBirthday() {
        return this.birthday;
    }
    
    public void setBirthday(int birthday) {
        this.birthday = birthday;
    }
    public int getEmail() {
        return this.email;
    }
    
    public void setEmail(int email) {
        this.email = email;
    }




}


