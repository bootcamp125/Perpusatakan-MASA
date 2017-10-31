package com.xsis.training125.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.ReturnTransactionDao;
import com.xsis.training125.model.ReturnTransaction;

@Transactional
@Service
public class ReturnTransactionService {

	@Autowired
	ReturnTransactionDao returntransactionDao;

	public void save(ReturnTransaction returntransaction) {
		returntransactionDao.save(returntransaction);
	}

	public List<ReturnTransaction> getAllReturnTransactions() {
		return returntransactionDao.getAllReturnTransactions();
	}

	public ReturnTransaction getReturnTransactionById(int id) {
		return returntransactionDao.getReturnTransactionById(id);
	}

	public void update(ReturnTransaction returntransaction) {
		returntransactionDao.update(returntransaction);
	}

	public void delete(int id) {
		returntransactionDao.delete(id);
	}

}
