package com.bookmanage.struts2;

public class Author {
	private String AuthorID;
	private String Name;
	private String Age;
	private String Country;
	
	public Author(){
		
	}
	
	public Author(String AuthorID, String Name, String Age, String Country){
		this.AuthorID = AuthorID;
		this.Name = Name;
		this.Age = Age;
		this.Country = Country;
	}
	
	public boolean IsEmpty(){
		if(Name.isEmpty() == true || Age.isEmpty() == true || Country.isEmpty() == true){
			return true;
		}
		return false;
	}
	
	public void setAuthorID(String AuthorID){
		this.AuthorID = AuthorID;
	}
	
	public String getAuthorID(){
		return AuthorID;
	}
	
	public void setName(String Name){
		this.Name = Name;
	}
	
	public String getName(){
		return Name;
	}
	
	public void setAge(String Age){
		this.Age = Age;
	}
	
	public String getAge(){
		return Age;
	}
	
	public void setCountry(String Country){
		this.Country = Country;
	}
	
	public String getCountry(){
		return Country;
	}

}
