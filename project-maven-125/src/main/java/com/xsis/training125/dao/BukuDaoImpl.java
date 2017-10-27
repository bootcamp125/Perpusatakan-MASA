package com.xsis.training125.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.Buku;

@Repository
@SuppressWarnings("unchecked")
public class BukuDaoImpl implements BukuDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Buku buku) {
		Session session = sessionFactory.getCurrentSession();
		session.save(buku);
		session.flush();
	}
	
	public List<Buku> getAllBuku() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Buku";
		List<Buku> buku = session.createQuery(hql).list();
		if (buku.isEmpty()) {
			return null;
		}
		return buku;
	}
	
	public Buku getBukuById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Buku buku = session.get(Buku.class, id);
		return buku;
	}
	
	public void update(Buku buku) {
		Session session = sessionFactory.getCurrentSession();
		session.update(buku);
		session.flush();
	}
	
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Buku buku = new Buku();
		buku.setId(id);
		buku.setIsbn("isbn");
		session.delete(buku);
		session.flush();
	}
}
