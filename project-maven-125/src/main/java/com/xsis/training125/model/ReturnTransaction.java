package com.xsis.training125.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "RETURN TRANSACTION")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@id")
public class ReturnTransaction {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@OneToOne(fetch = FetchType.LAZY, mappedBy="return_transaction")
	private Employee employee;
	@OneToOne(fetch = FetchType.LAZY, mappedBy="return_transaction")
	private Customer customer;
	@OneToMany(fetch = FetchType.LAZY, mappedBy="return_transaction")
	private List<Book> books;
	private Date returnDate;
	
	public ReturnTransaction() {}

	public ReturnTransaction(int id, Employee employee, Customer customer, List<Book> books, Date returnDate) {
		super();
		this.id = id;
		this.employee = employee;
		this.customer = customer;
		this.books = books;
		this.returnDate = returnDate;
	}

	
}
