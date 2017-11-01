package com.xsis.training125.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.BookTransaction;

@Repository
public class BookTransactionDaoImpl implements BookTransactionDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public List<BookTransaction> getAllBookTransactions() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from BookTransaction";
		List<BookTransaction> bookTransactions = session.createQuery(hql).list();
		if (bookTransactions.isEmpty()) {
			return null;
		}
		return bookTransactions;
	}
	
	public void save(BookTransaction bookTransaction) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bookTransaction);
		session.flush();
	}	

}
