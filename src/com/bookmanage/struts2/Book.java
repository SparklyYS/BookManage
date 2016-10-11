package com.bookmanage.struts2;
import java.util.*;

public class Book {
	private String ISBN;
	private String Title;
	private String AuthorID;
	private String Publisher;
	private Date PublishDate;
	private double Price;
	private String AuthorName;
	
	public Book(){
		
	}
	
	public Book(String ISBN, String Title, String AuthorID, String Publisher, Date PublishDate, double Price){
		this.ISBN = ISBN;
		this.Title = Title;
		this.AuthorID = AuthorID;
		this.Publisher = Publisher;
		this.PublishDate = PublishDate;
		this.Price = Price;
	}
	
	public Book(String ISBN, String Title, String AuthorID, String AuthorName, String Publisher, Date PublishDate, double Price){
		this.ISBN = ISBN;
		this.Title = Title;
		this.AuthorID = AuthorID;
		this.AuthorName = AuthorName;
		this.Publisher = Publisher;
		this.PublishDate = PublishDate;
		this.Price = Price;
	}
	
	public void setAuthorName(String AuthorName){
		this.AuthorName = AuthorName;
	}
	
	public String getAuthorName(){
		return AuthorName;
	}
	
	public void setISBN(String ISBN){
		this.ISBN = ISBN;
	}
	
	public String getISBN(){
		return ISBN;
	}
	
	public void setTitle(String Title){
		this.Title = Title;
	}
	
	public String getTitle(){
		return Title;
	}
	
	public void setAuthorID(String AuthorID){
		this.AuthorID = AuthorID;
	}
	
	public String getAuthorID(){
		return AuthorID;
	}
	
	public void setPublisher(String Publisher){
		this.Publisher = Publisher;
	}
	
	public String getPublisher(){
		return Publisher;
	}
	
	public void setPublishDate(Date PublishDate){
		this.PublishDate = PublishDate;
	}
	
	public Date getPublishDate(){
		return PublishDate;
	}
	
	public void setPrice(double Price){
		this.Price = Price;
	}
	
	public double getPrice(){
		return Price;
	}
}
