package com.xsis.training125.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.ReturnTransaction;

@Repository
public class ReturnTransactionDaoImpl implements ReturnTransactionDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(ReturnTransaction returnTransaction) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();
		session.save(returnTransaction);
		session.flush();
	}

	public List<ReturnTransaction> getAllReturnTransactions() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		// HQL (hibernate query language)
		String myHql = "from ReturnTransaction";
		List<ReturnTransaction> returnTransactions = session.createQuery(myHql).list();
		if(returnTransactions.isEmpty()){
			return null;
		}
		
		return returnTransactions;
	}

	public ReturnTransaction getReturnTransactionById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		ReturnTransaction returnTransaction = session.get(ReturnTransaction.class, id);
		return returnTransaction;
	}

	public void update(ReturnTransaction returnTransaction) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(returnTransaction);
		session.flush();
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		ReturnTransaction returnTransaction = new ReturnTransaction();
		returnTransaction.setId(id);
		
		session.delete(returnTransaction);
		session.flush();
	}

}