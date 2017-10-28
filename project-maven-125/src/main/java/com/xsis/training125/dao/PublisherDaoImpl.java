package com.xsis.training125.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.Publisher;

@Repository
@SuppressWarnings("unchecked")
public class PublisherDaoImpl implements PublisherDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public List<Publisher> getAllPublisher() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Publisher";
		List<Publisher> publisher = session.createQuery(hql).list();
		if (publisher.isEmpty()) {
			return null;
		}
		return publisher;
	}
	
	public void save(Publisher publisher) {
		Session session = sessionFactory.getCurrentSession();
		session.save(publisher);
		session.flush();
	}
	
	public Publisher getPublisherById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Publisher publisher = session.get(Publisher.class, id);
		return publisher;
	}
	
	public void update(Publisher publisher) {
		Session session = sessionFactory.getCurrentSession();
		session.update(publisher);
		session.flush();
	}
	
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Publisher publisher = new Publisher();
		publisher.setId(id);
		publisher.setName("name");
		session.delete(publisher);
		session.flush();
	}
}
