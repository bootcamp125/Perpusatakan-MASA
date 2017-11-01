package com.xsis.training125.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.BookDao;
import com.xsis.training125.dao.BookStockDao;
import com.xsis.training125.model.Book;
import com.xsis.training125.model.BookStock;

@Transactional
@Service
public class BookService {
	
	@Autowired
	BookDao bookDao;
	@Autowired
	BookStockDao bookStockDao;
	
	public List<Book> getAllBook() {
		return bookDao.getAllBook();
	}
	
	public void save(Book book) {
		
		BookStock bookStock = book.getBookStock();
		bookStockDao.save(bookStock);
		
		book.setBookStock(bookStock);
		bookDao.save(book);
	}

	public Book getBookById(int id) {
		return bookDao.getBookById(id);
	}

	public void update(Book book) {
		
		BookStock bookStock = book.getBookStock();
		
		bookDao.update(book);
		bookStockDao.update(bookStock);
	}

	public void delete(int id) {
		bookDao.delete(id);
	}
}
