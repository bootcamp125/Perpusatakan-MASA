package com.xsis.training125.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.BookStockDao;
import com.xsis.training125.model.BookStock;

@Transactional
@Service
public class BookStockService {
	
	@Autowired
	BookStockDao bookStockDao;
	
	public void save(BookStock stock) {
		bookStockDao.save(stock);
	}

}
