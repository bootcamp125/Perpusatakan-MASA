package com.xsis.training125.dao;

import java.util.List;

import com.xsis.training125.model.ReturnTransaction;

public interface ReturnTransactionDao {

	public void save(ReturnTransaction returntransaction);
	
	public List<ReturnTransaction> getAllReturnTransactions();

}
