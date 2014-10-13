package model;
// Generated Sep 28, 2014 2:53:00 PM by Hibernate Tools 3.6.0


import java.util.Date;

/**
 * Comments generated by hbm2java
 */
public class Comments  implements java.io.Serializable {


     private Integer commentId;
     private Users users;
     private Posts posts;
     private String content;
     private Date createdAt;

    public Comments() {
    }

    public Comments(Users users, Posts posts, String content, Date createdAt) {
       this.users = users;
       this.posts = posts;
       this.content = content;
       this.createdAt = createdAt;
    }
   
    public Integer getCommentId() {
        return this.commentId;
    }
    
    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public Posts getPosts() {
        return this.posts;
    }
    
    public void setPosts(Posts posts) {
        this.posts = posts;
    }
    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    public Date getCreatedAt() {
        return this.createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }




}

