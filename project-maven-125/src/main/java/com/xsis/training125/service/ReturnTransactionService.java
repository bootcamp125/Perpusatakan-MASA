package com.xsis.training125.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.EmployeeDao;
import com.xsis.training125.dao.ReturnTransactionDao;
import com.xsis.training125.model.ReturnTransaction;

@Transactional
@Service
public class ReturnTransactionService {

	@Autowired
	EmployeeDao employeeDao;
	@Autowired
	ReturnTransactionDao returnTransactionDao;

	public void save(ReturnTransaction returnTransaction) {
		returnTransactionDao.save(returnTransaction);
	}

	public List<ReturnTransaction> getAllReturnTransactions() {
		return returnTransactionDao.getAllReturnTransactions();
	}

}
