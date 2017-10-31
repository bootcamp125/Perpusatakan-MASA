package com.xsis.training125.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.RentHistory;

@Repository
@SuppressWarnings("unchecked")
public class RentHistoryDaoImpl implements RentHistoryDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<RentHistory> getAllHistories() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from RentHistory";
		List<RentHistory> rentHistory = session.createQuery(hql).list();
		if (rentHistory.isEmpty()) {
			return null;
		}
		return rentHistory;
	}
	
	@Override
	public void save(RentHistory rentHistory) {
		Session session = sessionFactory.getCurrentSession();
		session.save(rentHistory);
		session.flush();
	}
}
