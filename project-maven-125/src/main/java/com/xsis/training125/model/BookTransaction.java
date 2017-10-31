package com.xsis.training125.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class BookTransaction {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@OneToOne(mappedBy="book")
	private BorrowTransaction borrow;
	@OneToMany(fetch=FetchType.LAZY, mappedBy="transaction")
	private List<Book> book;
	
	public BookTransaction() { }

	public BookTransaction(int id, BorrowTransaction borrow, List<Book> book) {
		super();
		this.id = id;
		this.borrow = borrow;
		this.book = book;
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

	public List<Book> getBook() {
		return book;
	}

	public void setBook(List<Book> book) {
		this.book = book;
	}	
}
