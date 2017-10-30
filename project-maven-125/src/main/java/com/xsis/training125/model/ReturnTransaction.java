package com.xsis.training125.model;

import java.util.Date;

public class ReturnTransaction {

	private int id;
	private Date returnDate;
	
	public ReturnTransaction() {}

	public ReturnTransaction(int id, Date returnDate) {
		super();
		this.id = id;
		this.returnDate = returnDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	
	
}
