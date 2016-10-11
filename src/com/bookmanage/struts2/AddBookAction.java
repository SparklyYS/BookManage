package com.bookmanage.struts2;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class AddBookAction extends ActionSupport {
	public Author AuthorInfo = new Author();
	public Book BookInfo =  new Book();
	public String AuthorName;
	public String PublishDate;
	public String Price;
	
	public void setPrice(String Price){
		this.Price = Price;
	}
	
	public String getPrice(){
		return Price;
	}
	
	public void setAuthorName(String AuthorName){
		this.AuthorName = AuthorName;
	}
	
	public String getAuthorName(){
		return AuthorName;
	}
	
	public void setPublishDate(String PublishDate){
		this.PublishDate = PublishDate;
	}
	
	public String getPublishDate(){
		return PublishDate;
	}
	
	public void setAuthor(Author AuthorInfo){
		this.AuthorInfo = AuthorInfo;
	}
	
	public Author getAuthor(){
		return AuthorInfo; 
	}
	
	public void setBook(Book BookInfo){
		this.BookInfo = BookInfo;
	}
	
	public Book getBook(){
		return BookInfo;
	}
	
	public String AddBook(){
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
			ResultSet rs = SearchPs.executeQuery();
			String AuthorID = "";
			if(rs.next()){
				AuthorID = rs.getString("AuthorID");
			}else{
				if(AuthorInfo.IsEmpty() == true){
					return "NoAuthorExist";
				}
				Statement statement = conn.createStatement();
				ResultSet resultSet = statement.executeQuery("select count(*) as rowCount from Author");
				resultSet.next();
				int rowCount = resultSet.getInt("rowCount");
				rowCount++;
				AuthorID = String.valueOf(rowCount);
				String Authorsql = "insert into Author value(?, ?, ?, ?)";
				PreparedStatement AuthorPs = conn.prepareStatement(Authorsql);
				AuthorPs.setString(1, AuthorID);
				AuthorPs.setString(2, AuthorInfo.getName());
				AuthorPs.setString(3, AuthorInfo.getAge());
				AuthorPs.setString(4, AuthorInfo.getCountry());
				AuthorPs.executeUpdate();
			}
			String Insertsql = "insert into book value(?, ?, ?, ?, ?, ?)";
			PreparedStatement InsertPs = conn.prepareStatement(Insertsql);
			InsertPs.setString(1, BookInfo.getISBN());
			InsertPs.setString(2, BookInfo.getTitle());
			InsertPs.setString(3, AuthorID);
			InsertPs.setString(4, BookInfo.getPublisher());
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
