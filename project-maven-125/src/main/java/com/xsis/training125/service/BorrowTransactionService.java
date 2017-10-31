package com.xsis.training125.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.BorrowTransactionDao;
import com.xsis.training125.model.BorrowTransaction;

@Transactional
@Service
public class BorrowTransactionService {
	
	@Autowired
	BorrowTransactionDao borrowTransactionDao;
	
	public void save(BorrowTransaction borrowTransaction) {
		borrowTransactionDao.save(borrowTransaction);
	}
	
}
