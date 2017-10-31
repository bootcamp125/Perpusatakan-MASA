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
	
	public void save(ReturnTransaction returntransaction) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();
		session.save(returntransaction);
		session.flush();
	}

	public List<ReturnTransaction> getAllReturnTransactions() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		// HQL (hibernate query language)
		String myHql = "from ReturnTransaction";
		List<ReturnTransaction> returntransactions = session.createQuery(myHql).list();
		if(returntransactions.isEmpty()){
			return null;
		}
		
		return returntransactions;
	}

	public ReturnTransaction getReturnTransactionById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		ReturnTransaction returntransaction = session.get(ReturnTransaction.class, id);
		return returntransaction;
	}

	public void update(ReturnTransaction returntransaction) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(returntransaction);
		session.flush();
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		ReturnTransaction returntransaction = new ReturnTransaction();
		returntransaction.setId(id);
		
		session.delete(returntransaction);
		session.flush();
	}

}