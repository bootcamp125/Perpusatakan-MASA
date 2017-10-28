package com.xsis.training125.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.BookDao;
import com.xsis.training125.model.Book;

@Transactional
@Service
public class BookService {
	
	@Autowired
	BookDao bookDao;
	
	public List<Book> getAllBook() {
		return bookDao.getAllBook();
	}
	
	public void save(Book book) {
		bookDao.save(book);
	}

	public Book getBookById(int id) {
		return bookDao.getBookById(id);
	}

	public void update(Book book) {
		bookDao.update(book);
	}

	public void delete(int id) {
		bookDao.delete(id);
	}
}
