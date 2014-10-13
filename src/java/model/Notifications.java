package model;
// Generated Sep 28, 2014 2:53:00 PM by Hibernate Tools 3.6.0



/**
 * Notifications generated by hbm2java
 */
public class Notifications  implements java.io.Serializable {


     private Integer notificationId;
     private Users usersByFromUserId;
     private Users usersByUserId;
     private Posts posts;

    public Notifications() {
    }

    public Notifications(Users usersByFromUserId, Users usersByUserId, Posts posts) {
       this.usersByFromUserId = usersByFromUserId;
       this.usersByUserId = usersByUserId;
       this.posts = posts;
    }
   
    public Integer getNotificationId() {
        return this.notificationId;
    }
    
    public void setNotificationId(Integer notificationId) {
        this.notificationId = notificationId;
    }
    public Users getUsersByFromUserId() {
        return this.usersByFromUserId;
    }
    
    public void setUsersByFromUserId(Users usersByFromUserId) {
        this.usersByFromUserId = usersByFromUserId;
    }
    public Users getUsersByUserId() {
        return this.usersByUserId;
    }
    
    public void setUsersByUserId(Users usersByUserId) {
        this.usersByUserId = usersByUserId;
    }
    public Posts getPosts() {
        return this.posts;
    }
    
    public void setPosts(Posts posts) {
        this.posts = posts;
    }




}

