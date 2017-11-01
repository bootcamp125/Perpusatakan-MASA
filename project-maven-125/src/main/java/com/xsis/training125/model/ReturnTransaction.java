package com.xsis.training125.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "RETURN_TRANSACTION")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@id")
public class ReturnTransaction {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Temporal(TemporalType.DATE)
	private Date returnDate;
	@ManyToOne
	private Employee employee;
	@OneToOne(mappedBy="returnTransaction")
	private RentHistory rentHistory;
	
	public ReturnTransaction() {}

	public ReturnTransaction(int id, Date returnDate, Employee employee, RentHistory rentHistory) {
		super();
		this.id = id;
		this.returnDate = returnDate;
		this.employee = employee;
		this.rentHistory = rentHistory;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public RentHistory getRentHistory() {
		return rentHistory;
	}

	public void setRentHistory(RentHistory rentHistory) {
		this.rentHistory = rentHistory;
	}
}
