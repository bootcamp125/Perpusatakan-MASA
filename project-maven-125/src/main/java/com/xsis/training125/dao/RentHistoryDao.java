package com.xsis.training125.dao;

import java.util.List;

import com.xsis.training125.model.RentHistory;

public interface RentHistoryDao {

	List<RentHistory> getAllHistories();

	void save(RentHistory rentHistory);


}
