package model;
// Generated Oct 7, 2014 11:51:27 AM by Hibernate Tools 4.3.1



/**
 * Notifications generated by hbm2java
 */
public class Notifications  implements java.io.Serializable {


     private Integer notificationId;
     private Posts posts;
     private Users usersByUserId;
     private Users usersByFromUserId;

    public Notifications() {
    }

    public Notifications(Posts posts, Users usersByUserId, Users usersByFromUserId) {
       this.posts = posts;
       this.usersByUserId = usersByUserId;
       this.usersByFromUserId = usersByFromUserId;
    }
   
    public Integer getNotificationId() {
        return this.notificationId;
    }
    
    public void setNotificationId(Integer notificationId) {
        this.notificationId = notificationId;
    }
    public Posts getPosts() {
        return this.posts;
    }
    
    public void setPosts(Posts posts) {
        this.posts = posts;
    }
    public Users getUsersByUserId() {
        return this.usersByUserId;
    }
    
    public void setUsersByUserId(Users usersByUserId) {
        this.usersByUserId = usersByUserId;
    }
    public Users getUsersByFromUserId() {
        return this.usersByFromUserId;
    }
    
    public void setUsersByFromUserId(Users usersByFromUserId) {
        this.usersByFromUserId = usersByFromUserId;
    }




}


