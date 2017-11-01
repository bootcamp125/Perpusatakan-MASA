package com.xsis.training125.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="BORROW_TRANSACTION")
public class BorrowTransaction {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Temporal(TemporalType.DATE)
	private Date borrowDate;
	@OneToOne
	@JoinColumn(name="book_transaction_id")
	private BookTransaction book;
	@ManyToOne
	private Employee employee;
	@OneToOne(mappedBy="borrowTransaction")
	private RentHistory rentHistory;
	@ManyToOne
	private Customer customer;
	
	public BorrowTransaction() { }

	public BorrowTransaction(int id, Date borrowDate, BookTransaction book, Employee employee, RentHistory rentHistory) {
		super();
		this.id = id;
		this.borrowDate = borrowDate;
		this.book = book;
		this.employee = employee;
		this.rentHistory = rentHistory;
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

	public BookTransaction getBook() {
		return book;
	}

	public void setBook(BookTransaction book) {
		this.book = book;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public RentHistory getHistory() {
		return rentHistory;
	}

	public void setHistory(RentHistory rentHistory) {
		this.rentHistory = rentHistory;
	}
}
