package com.xsis.training125.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookStockDaoImpl implements BookStockDao{

	@Autowired
	SessionFactory sessionFactory;

}
