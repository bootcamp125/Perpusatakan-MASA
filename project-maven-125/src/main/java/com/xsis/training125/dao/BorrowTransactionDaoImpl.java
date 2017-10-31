package com.xsis.training125.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.BorrowTransaction;

@Repository
public class BorrowTransactionDaoImpl implements BorrowTransactionDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(BorrowTransaction borrowTransaction) {
		Session session = sessionFactory.getCurrentSession();
		session.save(borrowTransaction);
		session.flush();
	}
}
