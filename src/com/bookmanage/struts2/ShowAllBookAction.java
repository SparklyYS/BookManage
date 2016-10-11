package com.bookmanage.struts2;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class ShowAllBookAction extends ActionSupport {
	private List<Book> BookList = new ArrayList<Book>();
	
	public void setBookList(List<Book> BookList){
		this.BookList = BookList;
	}
	
	public List<Book> getBookList(){
		return BookList;
	}

	public String ShowAllBook(){
		   String ret = ERROR;
		   Connection conn = null;
		   try{
//			   String URL = "jdbc:mysql://localhost/bookdb?useUnicode=true&characterEncoding=utf-8";
			   String DBurl = "jdbc:mysql://qkrcptcukjiq.rds.sae.sina.com.cn:10404/bookdb";
			   HttpServletRequest request = ServletActionContext.getRequest();
			   request.setCharacterEncoding("utf-8");
			   Class.forName("com.mysql.jdbc.Driver").newInstance();
			   conn = DriverManager.getConnection(DBurl, "bookdb", "ys526067723");
//			   conn = DriverManager.getConnection(URL, "root", "zhi");
			   String Booksql = "select * from book";
			   String Authorsql = "select * from Author where AuthorID = ?";
			   PreparedStatement BookPs = conn.prepareStatement(Booksql);
			   PreparedStatement AuthorPs = conn.prepareStatement(Authorsql);
			   ResultSet rSet = BookPs.executeQuery();
			   while(rSet.next()){
				   String ISBN = rSet.getString("ISBN");
				   String Title = rSet.getString("Title");
				   String AuthorID = rSet.getString("AuthorID");
				   String Publisher = rSet.getString("Publisher");
				   Date PublishDate = rSet.getDate("PublishDate");
				   double Price = rSet.getDouble("Price");
				   AuthorPs.setString(1, AuthorID);
				   ResultSet rs = AuthorPs.executeQuery();
				   String AuthorName = "";
				   if(rs.next()){
					   AuthorName = rs.getString("Name");
				   }
				   BookList.add(new Book(ISBN, Title, AuthorID, AuthorName, Publisher, PublishDate, Price));
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
