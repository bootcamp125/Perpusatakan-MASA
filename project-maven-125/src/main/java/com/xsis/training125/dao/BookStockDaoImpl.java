package com.xsis.training125.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.BookStock;

@Repository
public class BookStockDaoImpl implements BookStockDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public void save(BookStock bookStock) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bookStock);
		session.flush();
	}
	
	public void update(BookStock bookStock) {
		Session session = sessionFactory.getCurrentSession();
		session.update(bookStock);
		session.flush();
	}
}
