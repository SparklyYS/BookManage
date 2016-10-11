package com.bookmanage.struts2;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.bind.v2.runtime.Name;

import java.sql.*;
import java.util.*;
import java.util.Date;

import javax.servlet.http.*;
import org.apache.struts2.*;

public class BookSearchAction extends ActionSupport{
	private String AuthorName;
	private List<Book> BookList = new ArrayList<Book>();
	
	public void setAuthorName(String AuthorName){
		this.AuthorName = AuthorName;
	}
	
	public String getAuthorName(){
		return AuthorName;
	}
	
	public void setBookList(List<Book> BookList){
		this.BookList = BookList;
	}
	
	public List<Book> getBookList(){
		return BookList;
	}
	
	public String BookSearch(){
		   String ret = ERROR;
		   Connection conn = null;
		   try{
			   String DBurl = "jdbc:mysql://qkrcptcukjiq.rds.sae.sina.com.cn:10404/bookdb";
//				String URL = "jdbc:mysql://localhost/bookdb?useUnicode=true&characterEncoding=utf-8";
			   HttpServletRequest request = ServletActionContext.getRequest();
			   request.setCharacterEncoding("utf-8");
			   Class.forName("com.mysql.jdbc.Driver").newInstance();
			   conn = DriverManager.getConnection(DBurl, "bookdb", "ys526067723");
//			   conn = DriverManager.getConnection(URL, "root", "zhi");
			   String Searchsql = "select * from Author where Name= ?";
			   PreparedStatement SearchPs = conn.prepareStatement(Searchsql);
			   SearchPs.setString(1, AuthorName);
			   ResultSet rs = SearchPs.executeQuery();
			   String AuthorID = "";
			   if(rs.next()){
				   AuthorID = rs.getString("AuthorID");
			   }
			   String Booksql = "select * from book where AuthorID = ?";
			   PreparedStatement BookPs = conn.prepareStatement(Booksql);
			   BookPs.setString(1, AuthorID);
			   ResultSet rSet = BookPs.executeQuery();
			   while(rSet.next()){
				   String ISBN = rSet.getString("ISBN");
				   String Title = rSet.getString("Title");
				   String Publisher = rSet.getString("Publisher");
				   Date PublishDate = rSet.getDate("PublishDate");
				   double Price = rSet.getDouble("Price");
				   BookList.add(new Book(ISBN, Title, AuthorID, Publisher, PublishDate, Price));
			   }
			   request.setAttribute("BookList", BookList);
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