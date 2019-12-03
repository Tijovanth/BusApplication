package com.tijo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Set;

public class Process {
    
	HashMap<String,HashMap<String,LinkedList<String>>> Buses = new HashMap<>();
	ArrayList<String> busList = new ArrayList<>();
	public Process(){
		Buses.put("CHENNAI-BANGALORE",new HashMap<String,LinkedList<String>>());
		busList.add("CHENNAI-BANGALORE");
	}
    
	HashMap<String,User> userDetails = new HashMap<>();
	String Name;
	public int registerValidation(String name, String password ,String email, String phoneNumber)
	{
		if(!userDetails.containsKey(email) && !email.equals("tijo@gmail.com") && !password.equals("t"))
		{
			if(phoneNumber.length() != 10)
			{
				return 1;
			}else
			{
				userDetails.put(email, new User(name,email,phoneNumber,password));
				return 2;
			}
		}else
		{
			return 3;
		}
	}
	public int loginValidation(String email, String password)
	{
		if(email.equals("tijo@gmail.com") && password.equals("t"))
		{
			return 5;
		}
		if(userDetails.isEmpty())
		{
			return 1;
		}else
		{
			if(userDetails.containsKey(email))
			{
				if(userDetails.get(email).getPassword().equals(password))
				{
					return 3;
				}else
				{
					return 4;
				}
			}else
			{
				return 2;
			}
		}
	}
	public String getUserName(String email)
	{
		Name = userDetails.get(email).getName();
		return Name;
	}
	
	public HashMap<String,LinkedList<String>> getTickets(String userEmail)
	{
		HashMap<String,LinkedList<String>> particularUserTickets= new HashMap<>();
		for(int i = 0; i < busList.size(); i++)
		{
			if(Buses.get(busList.get(i)).containsKey(userEmail))
			{
				particularUserTickets.put(busList.get(i),Buses.get(busList.get(i)).get(userEmail) );
			}
		}
		return particularUserTickets;
	}
	public Collection<LinkedList<String>> getAvailableTickets(String pickupAndDrop)
	{
		
		Collection<LinkedList<String>> availableTickets = Buses.get(pickupAndDrop).values();
		return availableTickets;
	}
	
	public void BookTickets(String location, String userEmail,String value1)
	{
			if(Buses.get(location).containsKey(userEmail))
			  {
				  Buses.get(location).get(userEmail).add(value1);
			  }else
			  {
				  Buses.get(location).put(userEmail, new LinkedList<>());
				  Buses.get(location).get(userEmail).add(value1);
			  }
	}
	public void BookTickets(String location, String userEmail,String value1, String value2)
	{
			if(Buses.get(location).containsKey(userEmail))
			  {
				  Buses.get(location).get(userEmail).add(value1);
				  Buses.get(location).get(userEmail).add(value2);
			  }else
			  {
				  Buses.get(location).put(userEmail, new LinkedList<>());
				  Buses.get(location).get(userEmail).add(value1);
				  Buses.get(location).get(userEmail).add(value2);
			  }
	}
	public void BookTickets(String location, String userEmail,String value1, String value2, String value3)
	{
		 if(Buses.get(location).containsKey(userEmail))
		  {
			  Buses.get(location).get(userEmail).add(value1);
			  Buses.get(location).get(userEmail).add(value2);
			  Buses.get(location).get(userEmail).add(value3);
			  System.out.println(Buses.get(location).get(userEmail));
		  }else
		  {
			  Buses.get(location).put(userEmail, new LinkedList<>());
			  Buses.get(location).get(userEmail).add(value1);
			  Buses.get(location).get(userEmail).add(value2);
			  Buses.get(location).get(userEmail).add(value3);
			  System.out.println(Buses.get(location).get(userEmail));
		  }
	}
}
