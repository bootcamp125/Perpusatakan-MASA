package com.xsis.training125.controller;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

public class MyBean {
	
	private String name;
	@Autowired
	private Address address;
	
	//constructor
	public MyBean(){
		System.out.println("hello java bean");
	}
	
	@PostConstruct
	public void infoName(){
		address.setName("jalan pramuka");
		System.out.println("info name : "+ this.name);
		System.out.println("info address : "+ this.address.getName());
		
		
	}
	
	public void setAddress(Address adr){
		this.address = adr;
		address.setName("jalan pramuka");
	}
	
	public void setName(String name) {
		this.name = name;
	}

}
