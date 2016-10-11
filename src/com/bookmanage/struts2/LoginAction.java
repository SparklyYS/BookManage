package com.bookmanage.struts2;

import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	   private String Username;
	   private String Password;
	   
	   private String message;
	   
	   public void setUsername(String Username){
		   this.Username = Username;
	   }
	   
	   public String getUsername(){
		   return Username;
	   }
	   
	   public void setPassword(String Password){
		   this.Password = Password;
	   }
	   
	   public String getPassword(){
		   return Password;
	   }
	   
	   public void setMessage(String message){
		   this.message = message;
	   }
	   
	   public String getMessage(){
		   return message;
	   }
	   
	   public String login() {
	      String ret = ERROR;	
	      Connection conn = null;
	      try {
	    	 String DBurl = "jdbc:mysql://qkrcptcukjiq.rds.sae.sina.com.cn:10404/bookdb";
//	    	 String URL = "jdbc:mysql://localhost/bookdb?useUnicode=true&characterEncoding=utf-8";
			 Class.forName("com.mysql.jdbc.Driver").newInstance();
			 conn = DriverManager.getConnection(DBurl, "bookdb", "ys526067723");
//			 conn = DriverManager.getConnection(URL, "root", "zhi");
	         String sql = "select * from UserData where";
	         sql+=" username = ? and password = ?";
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setString(1, Username);
	         ps.setString(2, Password);
	         ResultSet rs = ps.executeQuery();
	         while (rs.next()) {
	            message = "你以" + Username + "的账号登陆成功";
	            ret = SUCCESS;
	         }
	      } catch (Exception e) {
	         ret = ERROR;
	      } finally {
	         if (conn != null) {
	            try {
	               conn.close();
	            } catch (Exception e) {
	            }
	         }
	      }
	      return ret;
	   }
}
