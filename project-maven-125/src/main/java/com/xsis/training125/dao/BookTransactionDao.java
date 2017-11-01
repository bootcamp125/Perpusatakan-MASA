package com.xsis.training125.dao;

import java.util.List;

import com.xsis.training125.model.BookTransaction;
import com.xsis.training125.model.Employee;

public interface BookTransactionDao {
	
	public void save(BookTransaction bookTransaction);

	public List<BookTransaction> getAllBookTransactions();

}
