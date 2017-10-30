package com.xsis.training125.model;

public class BookStock {
	
	private Book book;
	private int stock;
	
	public BookStock() { }

	public BookStock(Book book, int stock) {
		super();
		this.book = book;
		this.stock = stock;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
}
