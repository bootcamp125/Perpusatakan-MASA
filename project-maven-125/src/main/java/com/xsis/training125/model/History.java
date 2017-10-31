package com.xsis.training125.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class History {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@OneToOne
	private BorrowTransaction borrow;
	@OneToOne
	private ReturnTransaction bookReturn;
	@ManyToOne
	private Customer customer;
		
	public History() {
		
	}
	
	public History(int id, BorrowTransaction borrow, ReturnTransaction bookReturn, Customer customer) {
		super();
		this.id = id;
		this.borrow = borrow;
		this.bookReturn = bookReturn;
		this.customer = customer;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public BorrowTransaction getBorrow() {
		return borrow;
	}

	public void setBorrow(BorrowTransaction borrow) {
		this.borrow = borrow;
	}

	public ReturnTransaction getBookReturn() {
		return bookReturn;
	}

	public void setBookReturn(ReturnTransaction bookReturn) {
		this.bookReturn = bookReturn;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}	
}
