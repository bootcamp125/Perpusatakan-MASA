package com.xsis.training125.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class Book {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(nullable=false)
	private String isbn;
	private String title;
	private String author;
	@Column(name="released_year")
	private String releasedYear;
	@ManyToOne
	private Publisher publisher;
	@ManyToOne
	private Shelf shelf;
	@OneToOne(mappedBy="book")
	private BookStock bookStock;
	@ManyToOne
	private BookTransaction transaction;
	public Book() { }

	public Book(int id, String isbn, String title, String author, String releasedYear, Publisher publisher, Shelf shelf,
			BookStock bookStock, BookTransaction transaction) {
		super();
		this.id = id;
		this.isbn = isbn;
		this.title = title;
		this.author = author;
		this.releasedYear = releasedYear;
		this.publisher = publisher;
		this.shelf = shelf;
		this.bookStock = bookStock;
		this.transaction = transaction;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getIsbn() {
		return isbn;
	}
	
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public void setReleasedYear(String releasedYear) {
		this.releasedYear = releasedYear;
	}
	
	public String getReleasedYear() {
		return releasedYear;
	}

	public Publisher getPublisher() {
		return publisher;
	}

	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}

	public Shelf getShelf() {
		return shelf;
	}

	public void setShelf(Shelf shelf) {
		this.shelf = shelf;
	}

	public BookStock getBookStock() {
		return bookStock;
	}

	public void setBookStock(BookStock bookStock) {
		this.bookStock = bookStock;
	}

	public BookTransaction getTransaction() {
		return transaction;
	}

	public void setTransaction(BookTransaction transaction) {
		this.transaction = transaction;
	}
}
