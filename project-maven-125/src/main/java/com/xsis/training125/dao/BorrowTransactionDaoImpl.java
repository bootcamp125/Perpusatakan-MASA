package com.xsis.training125.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.BorrowTransaction;
import com.xsis.training125.model.RentHistory;
import com.xsis.training125.service.RentHistoryService;

@Repository
public class BorrowTransactionDaoImpl implements BorrowTransactionDao {
	
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	RentHistoryService rentHistoryService;
	
	public void save(BorrowTransaction borrowTransaction) {
		Session session = sessionFactory.getCurrentSession();
		int idPeminjaman = (int) session.save(borrowTransaction);
		borrowTransaction.setId(idPeminjaman);
		
		
		session.flush();
	}
}
