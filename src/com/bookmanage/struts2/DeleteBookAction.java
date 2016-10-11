package com.bookmanage.struts2;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.Date;

import javax.servlet.http.*;

import org.apache.struts2.ServletActionContext;

public class DeleteBookAction extends ActionSupport {
		private String Title;
		private String AuthorName;
		private String AuthorID;
		
		public void setTitle(String Title){
			this.Title = Title;
		}
		
		public String getTitle(){
			return Title;
		}
		
		public void setAuthorName(String AuthorName){
			this.AuthorName = AuthorName;
		}
		
		public String getAuthorName(){
			return this.AuthorName;
		}
		
		public void setAuthorID(String AuthorID){
			this.AuthorID = AuthorID;
		}
		
		public String getAuthorID(){
			return this.AuthorID;
		}
		
		public String DeleteBook(){
			String ret = ERROR;
			Connection conn = null;
			try{
				String DBurl = "jdbc:mysql://qkrcptcukjiq.rds.sae.sina.com.cn:10404/bookdb";
//				String URL = "jdbc:mysql://localhost/bookdb?useUnicode=true&characterEncoding=utf-8";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn = DriverManager.getConnection(DBurl, "bookdb", "ys526067723");
//				conn = DriverManager.getConnection(URL, "root", "zhi");
				String Searchsql = "select * from Author where AuthorID= ?";
				PreparedStatement SearchPs = conn.prepareStatement(Searchsql);
				SearchPs.setString(1, AuthorID);
				ResultSet rs = SearchPs.executeQuery();
				while(rs.next()){
					AuthorName = rs.getString("Name");
				}
				String Booksql = "Delete from book where Title = ?";
				PreparedStatement BookPs = conn.prepareStatement(Booksql);
				BookPs.setString(1, Title);
				BookPs.executeUpdate();
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
