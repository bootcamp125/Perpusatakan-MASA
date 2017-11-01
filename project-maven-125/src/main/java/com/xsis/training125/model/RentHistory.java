package com.xsis.training125.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="RENT_HISTORY")
public class RentHistory {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Temporal(TemporalType.DATE)
	@Column(name="due_date")
	private Date dueDate;
	private int fine;
	@OneToOne
	@JoinColumn(name="BORROW_TRANSACTION_ID")
	private BorrowTransaction borrowTransaction;
	@OneToOne
	@JoinColumn(name="RETURN_TRANSACTION_ID")
	private ReturnTransaction returnTransaction;
	
	public RentHistory() {
		
	}

	public RentHistory(int id, Date dueDate, int fine, BorrowTransaction borrowTransaction,
			ReturnTransaction returnTransaction) {
		super();
		this.id = id;
		this.dueDate = dueDate;
		this.fine = fine;
		this.borrowTransaction = borrowTransaction;
		this.returnTransaction = returnTransaction;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public BorrowTransaction getBorrowTransaction() {
		return borrowTransaction;
	}

	public void setBorrowTransaction(BorrowTransaction borrowTransaction) {
		this.borrowTransaction = borrowTransaction;
	}

	public ReturnTransaction getReturnTransaction() {
		return returnTransaction;
	}

	public void setReturnTransaction(ReturnTransaction returnTransaction) {
		this.returnTransaction = returnTransaction;
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
