package com.xsis.training125.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class RentHistory {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Temporal(TemporalType.DATE)
	@Column(name="due_date")
	private Date dueDate;
	private int fine;
	@OneToOne
	private BorrowTransaction borrow;
	@OneToOne
	private ReturnTransaction bookReturn;
	@ManyToOne
	private Customer customer;
		
	public RentHistory() {
		
	}

	public RentHistory(int id, Date dueDate, int fine, BorrowTransaction borrow, ReturnTransaction bookReturn,
			Customer customer) {
		super();
		this.id = id;
		this.dueDate = dueDate;
		this.fine = fine;
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

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public int getFine() {
		return fine;
	}

	public void setFine(int fine) {
		this.fine = fine;
	}	
}
