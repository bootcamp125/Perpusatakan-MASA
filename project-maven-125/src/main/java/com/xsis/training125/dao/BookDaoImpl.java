package com.xsis.training125.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.Book;

@Repository
@SuppressWarnings("unchecked")
public class BookDaoImpl implements BookDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Book book) {
		Session session = sessionFactory.getCurrentSession();
		session.save(book);
		session.flush();
	}
	
	public List<Book> getAllBook() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Book";
		List<Book> book = session.createQuery(hql).list();
		if (book.isEmpty()) {
			return null;
		}
		return book;
	}
	
	public Book getBookById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Book book = session.get(Book.class, id);
		return book;
	}
	
	public void update(Book book) {
		Session session = sessionFactory.getCurrentSession();
		session.update(book);
		session.flush();
	}
	
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Book book = new Book();
		book.setId(id);
		book.setIsbn("isbn");
		session.delete(book);
		session.flush();
	}
}
