package com.xsis.training125.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.Shelf;

@Repository
public class ShelfDaoImpl implements ShelfDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Shelf shelf) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();
		session.save(shelf);
		session.flush();
	}

	public List<Shelf> getAllShelfs() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		// HQL (hibernate query language)
		String myHql = "from Shelf";
		List<Shelf> shelfs = session.createQuery(myHql).list();
		if(shelfs.isEmpty()){
			return null;
		}
		
		return shelfs;
	}

	public Shelf getShelfById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		Shelf shelf = session.get(Shelf.class, id);
		return shelf;
	}

	public void update(Shelf shelf) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(shelf);
		session.flush();
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Shelf shelf = new Shelf();
		shelf.setId(id);
		shelf.setCategory("abc");
		
		session.delete(shelf);
		session.flush();
	}

}