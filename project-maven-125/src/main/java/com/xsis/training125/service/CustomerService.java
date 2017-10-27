package com.xsis.training125.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.CustomerDao;
import com.xsis.training125.model.Customer;

@Transactional
@Service
public class CustomerService{
	
	@Autowired
	CustomerDao customerDao;
	
	public void save(Customer customer){
		customerDao.save(customer);
	}

	public List<Customer> getAllCustomers() {
		return customerDao.getAllCustomers();
	}

	public Customer getCustomerById(int id) {
		return customerDao.getCustomerById(id);
	}

	public void update(Customer customer) {
		customerDao.update(customer);
	}

	public void delete(int id) {
		customerDao.delete(id);
	}

}
