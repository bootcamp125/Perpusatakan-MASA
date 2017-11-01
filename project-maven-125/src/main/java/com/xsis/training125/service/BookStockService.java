package com.xsis.training125.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.BookStockDao;

@Transactional
@Service
public class BookStockService {
	
	@Autowired
	BookStockDao bookStockDao;

}
