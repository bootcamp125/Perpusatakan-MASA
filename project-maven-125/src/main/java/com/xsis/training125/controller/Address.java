package com.xsis.training125.controller;

import org.springframework.stereotype.Component;

@Component
public class Address {

	private String nama;
	private String postalCode;
	
	public String getName() {
		return nama;
	}
	public void setName(String name) {
		this.nama = name;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	
}
