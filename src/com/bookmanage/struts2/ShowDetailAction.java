package com.bookmanage.struts2;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class ShowDetailAction extends ActionSupport {
	private String AuthorID;
	private String Title;
	private Author AuthorInfo = new Author();
	private Book BookInfo = new Book();
	
	
	public void setAuthorID(String AuthorID){
		this.AuthorID = AuthorID;
	}
	
	public String getAuthorID(){
		return AuthorID;
	}
	
	public void setTitle(String Title){
		this.Title = Title;
	}
	
	public String getTitle(){
		return Title;
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

	
	public String ShowDetail(){
		String ret = ERROR;
		Connection conn = null;
		try{
			String DBurl = "jdbc:mysql://qkrcptcukjiq.rds.sae.sina.com.cn:10404/bookdb";
//			String URL = "jdbc:mysql://localhost/bookdb?useUnicode=true&characterEncoding=utf-8";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(DBurl, "bookdb", "ys526067723");
//			conn = DriverManager.getConnection(URL, "root", "zhi");
			String Searchsql = "select * from Author where AuthorID= ?";
			PreparedStatement SearchPs = conn.prepareStatement(Searchsql);
			SearchPs.setString(1, AuthorID);
			ResultSet rs = SearchPs.executeQuery();
			while(rs.next()){
				String Name = rs.getString("Name");
				String Age = rs.getString("Age");
				String Country = rs.getString("Country");
				AuthorInfo.setName(Name);
				AuthorInfo.setAge(Age);
				AuthorInfo.setAuthorID(AuthorID);
				AuthorInfo.setCountry(Country);
			}
			String Booksql = "select * from book where Title = ?";
			PreparedStatement BookPs = conn.prepareStatement(Booksql);
			BookPs.setString(1, Title);
			ResultSet rSet = BookPs.executeQuery();
			while(rSet.next()){
				String ISBN = rSet.getString("ISBN");
				String Publisher = rSet.getString("Publisher");
				Date PublishDate = rSet.getDate("PublishDate");
				double Price = rSet.getDouble("Price");
				BookInfo.setISBN(ISBN);
				BookInfo.setAuthorID(AuthorID);
				BookInfo.setTitle(Title);
				BookInfo.setPublisher(Publisher);
				BookInfo.setPublishDate(PublishDate);
				BookInfo.setPrice(Price);
			}
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setCharacterEncoding("utf-8");
			request.setAttribute("BookInfo", BookInfo);
			request.setAttribute("AuthorInfo", AuthorInfo);
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
