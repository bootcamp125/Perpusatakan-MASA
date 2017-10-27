package com.xsis.training125.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.Customer;
import com.xsis.training125.model.Employee;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	SessionFactory sessionFactory;

	public void save(Customer customer) {

		Session session = sessionFactory.getCurrentSession();
		session.save(customer);
		session.flush();
	}

	@Override
	public List<Customer> getAllCustomers() {

		Session session = sessionFactory.getCurrentSession();
		String myHQL = "from Customer";
		List<Customer> customers = session.createQuery(myHQL).list();
		if (customers.isEmpty()) {
			return null;
		}
		return customers;
	}

	@Override
	public Customer getCustomerById(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		Customer customer = session.get(Customer.class, id);
		return customer;
	}

	@Override
	public void update(Customer customer) {
		Session session = sessionFactory.getCurrentSession();
		session.update(customer);
		session.flush();

	}

	@Override
	public void delete(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		Customer customer = new Customer();
		customer.setId(id);
		customer.setName("abc");
		
		session.delete(customer);
		session.flush();

	}
}
