package com.simplecode.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import com.opensymphony.xwork2.Action;

public class AjaxAction implements Action 
{

	private String userName;
	private InputStream inputStream;
	
	public String ajaxMethod() 
	{
		System.out.println("ajaxMethod() is called");
		byte[] bArray;
		
		if(!userName.isEmpty())
		{
			bArray = ("Welcome " + userName).getBytes();
			inputStream = new ByteArrayInputStream(bArray);
			
		}
		else
		{
			bArray = ("User name cant be blank").getBytes();
			inputStream = new ByteArrayInputStream(bArray);
		}
		
		return SUCCESS;
	}

	public String execute() 
	{
		return SUCCESS;
	}
	
	public String getUserName() 
	{
		return userName;
	}

	public void setUserName(String userName) 
	{
		this.userName = userName;
	}

	public InputStream getInputStream() 
	{
		return inputStream;
	}
}