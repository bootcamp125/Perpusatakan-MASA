package com.xsis.training125.model;

public class BookTransaction {
	
	private History history;
	private Book book;
	
	public BookTransaction() { }

	public BookTransaction(History history, Book book) {
		super();
		this.history = history;
		this.book = book;
	}

	public History getHistory() {
		return history;
	}

	public void setHistory(History history) {
		this.history = history;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
}
