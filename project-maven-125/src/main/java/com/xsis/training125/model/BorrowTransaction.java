package com.xsis.training125.model;

import java.util.Date;

public class BorrowTransaction {
	
	private int id;
	private Date borrowDate;
	
	public BorrowTransaction() { }
	
	public BorrowTransaction(int id, Date borrowDate) {
		super();
		this.id = id;
		this.borrowDate = borrowDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getBorrowDate() {
		return borrowDate;
	}

	public void setBorrowDate(Date borrowDate) {
		this.borrowDate = borrowDate;
	}	
}
