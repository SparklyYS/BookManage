package com.bookmanage.struts2;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.mysql.jdbc.Driver;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.crypto.provider.RSACipher;

import javafx.scene.control.TableView.ResizeFeatures;


public class EditBookAction extends ActionSupport{
	private String ISBN;
	private String TitleName;
	private String AuthorName;
	private String Publisher;
	private String PublishDate;
	private String Price;
	private String AuthorID;
	
	public void setISBN(String ISBN){
		this.ISBN = ISBN;
	}
	
	public String getISBN(){
		return ISBN;
	}
	
	public void setTitleName(String TitleName){
		this.TitleName = TitleName;
	}
	
	public String getTitleName(){
		return TitleName;
	}
	
	public void setAuthorName(String AuthorName){
		this.AuthorName = AuthorName;
	}
	
	public String getAuthorName(){
		return AuthorName;
	}
	
	public void setPublisher(String Publisher){
		this.Publisher = Publisher;
	}
	
	public String getPublihser(){
		return Publisher;
	}
	
	public void setPublishDate(String PublishDate){
		this.PublishDate = PublishDate;
	}
	
	public String getPublishDate(){
		return PublishDate;
	}
	
	public void setPrice(String Price){
		this.Price = Price;
	}
	
	public String getPrice(){
		return Price;
	}
	
	public void setAuthorID(String AuthorID){
		this.AuthorID = AuthorID;
	}
	
	public String getAuthorID(){
		return AuthorID;
	}
	
	public String EditBook(){
		String ret = ERROR;
		Connection conn = null;
		try{
			String DBurl = "jdbc:mysql://qkrcptcukjiq.rds.sae.sina.com.cn:10404/bookdb";
//			String URL = "jdbc:mysql://localhost/bookdb?useUnicode=true&characterEncoding=utf-8";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(DBurl, "bookdb", "ys526067723");
//			conn = DriverManager.getConnection(URL, "root", "zhi");
			String Searchsql = "select * from Author where Name= ?";
			PreparedStatement SearchPs = conn.prepareStatement(Searchsql);
			SearchPs.setString(1, AuthorName);
			ResultSet resultSet = SearchPs.executeQuery();
			if(resultSet.next()){
				AuthorID = resultSet.getString("AuthorID");
			}
			String Booksql = "Delete from book where ISBN = ?";
			PreparedStatement BookPs = conn.prepareStatement(Booksql);
			BookPs.setString(1, ISBN);
			BookPs.executeUpdate();
			String Insertsql = "insert into book value(?, ?, ?, ?, ?, ?)";
			PreparedStatement InsertPs = conn.prepareStatement(Insertsql);
			InsertPs.setString(1, ISBN);
			InsertPs.setString(2, TitleName);
			InsertPs.setString(3, AuthorID);
			InsertPs.setString(4, Publisher);
			InsertPs.setString(5, PublishDate);
			InsertPs.setDouble(6, Double.parseDouble(Price));
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
