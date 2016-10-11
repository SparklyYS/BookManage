package com.bookmanage.struts2;

import com.mysql.fabric.xmlrpc.base.Param;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;

public class RegistAction extends ActionSupport {
	   private String Username;
	   private String Password;
	   private String ConfirmPassword;
	   private String EmailAddress;
	   
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
	   
	   public void setConfirmPassword(String ConfirmPassword){
		   this.ConfirmPassword = ConfirmPassword;
	   }
	   
	   public String getConfirmPassword(){
		   return ConfirmPassword;
	   }
	   
	   public void setEmailAddress(String EmailAddress){
		   this.EmailAddress = EmailAddress;
	   }
	   
	   public String getEmailAddress(){
		   return EmailAddress;
	   }
	   
	   public String regist(){
		   String ret = ERROR;
		   Connection conn = null;
		   if(ConfirmPassword.equals(Password) == false){
			   return "PasswordError";
		   }
		   try{
//			   String URL = "jdbc:mysql://localhost/bookdb?useUnicode=true&characterEncoding=utf-8";
			   String DBurl = "jdbc:mysql://qkrcptcukjiq.rds.sae.sina.com.cn:10404/bookdb";
			   Class.forName("com.mysql.jdbc.Driver").newInstance();
			   conn = DriverManager.getConnection(DBurl, "bookdb", "ys526067723");
//			   conn = DriverManager.getConnection(URL, "root", "zhi");
			   String Searchsql = "select * from UserData where Username= ?";
			   PreparedStatement SearchPs = conn.prepareStatement(Searchsql);
			   SearchPs.setString(1, Username);
			   ResultSet rs = SearchPs.executeQuery();
			   if(rs.next()){
				   return "RegistError";
			   }
			   String Insertsql = "insert into UserData value(?, ?, ?)";
			   PreparedStatement InsertPs = conn.prepareStatement(Insertsql);
			   InsertPs.setString(1, Username);
			   InsertPs.setString(2, Password);
			   InsertPs.setString(3, EmailAddress);
			   InsertPs.executeUpdate();
			   ret = SUCCESS;
		   }catch(Exception e){
			   ret = ERROR;
		   }finally {
			if(conn != null){
				try{
					conn.close();
				}catch (Exception e) {
				}
			}
		   }
		   return ret;
	   }
	   
}
