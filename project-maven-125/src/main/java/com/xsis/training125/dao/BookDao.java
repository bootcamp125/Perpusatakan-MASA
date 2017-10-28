package com.xsis.training125.dao;

import java.util.List;

import com.xsis.training125.model.Book;

public interface BookDao {
	
	public void save(Book book);

	public List<Book> getAllBook();

	public Book getBookById(int id);

	public void update(Book book);

	public void delete(int id);
}
