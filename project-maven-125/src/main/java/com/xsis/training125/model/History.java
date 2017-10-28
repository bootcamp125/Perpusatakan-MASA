package com.xsis.training125.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
public class History {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(name="borrow_date")
	@Temporal(TemporalType.DATE)
	private Date borrowDate;
	@Column(name="return_date")
	@Temporal(TemporalType.DATE)
	private Date returnDate;
	private int fine;
	
	public History() {
		
	}

	public History(int id, Date borrowDate, Date returnDate, int fine) {
		super();
		this.id = id;
		this.borrowDate = borrowDate;
		this.returnDate = returnDate;
		this.fine = fine;
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

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public int getFine() {
		return fine;
	}

	public void setFine(int fine) {
		this.fine = fine;
	}
}
