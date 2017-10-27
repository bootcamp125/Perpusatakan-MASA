package com.xsis.training125.dao;

import java.util.List;

import com.xsis.training125.model.Customer;

public interface CustomerDao {

	public void save(Customer customer);

	public List<Customer> getAllCustomers();

	public Customer getCustomerById(int id);

	public void update(Customer customer);

	public void delete(int id);

}
