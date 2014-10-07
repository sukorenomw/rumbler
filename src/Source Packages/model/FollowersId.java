package model;
// Generated Oct 7, 2014 11:51:27 AM by Hibernate Tools 4.3.1



/**
 * FollowersId generated by hbm2java
 */
public class FollowersId  implements java.io.Serializable {


     private int id;
     private int userId;
     private int followerId;

    public FollowersId() {
    }

    public FollowersId(int id, int userId, int followerId) {
       this.id = id;
       this.userId = userId;
       this.followerId = followerId;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public int getUserId() {
        return this.userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public int getFollowerId() {
        return this.followerId;
    }
    
    public void setFollowerId(int followerId) {
        this.followerId = followerId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof FollowersId) ) return false;
		 FollowersId castOther = ( FollowersId ) other; 
         
		 return (this.getId()==castOther.getId())
 && (this.getUserId()==castOther.getUserId())
 && (this.getFollowerId()==castOther.getFollowerId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getId();
         result = 37 * result + this.getUserId();
         result = 37 * result + this.getFollowerId();
         return result;
   }   


}


