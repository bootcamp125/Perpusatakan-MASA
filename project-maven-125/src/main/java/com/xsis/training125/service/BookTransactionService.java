package com.xsis.training125.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.BookDao;
import com.xsis.training125.dao.BookTransactionDao;
import com.xsis.training125.model.BookTransaction;


@Transactional
@Service
public class BookTransactionService{
	
	@Autowired
	BookTransactionDao bookTransactionDao;
	@Autowired
	BookDao bookDao;
	
	public void save(BookTransaction bookTransaction){
		bookTransactionDao.save(bookTransaction);
	}

	public List<BookTransaction> getAllBookTransactions() {
		return bookTransactionDao.getAllBookTransactions();
	}

}
