package com.xsis.training125.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.ShelfDao;
import com.xsis.training125.model.Shelf;

@Transactional
@Service
public class ShelfService {
	
	@Autowired
	ShelfDao shelfDao;
	
	public void save(Shelf shelf){
		shelfDao.save(shelf);
	}

	public List<Shelf> getAllShelfs() {
		return shelfDao.getAllShelfs();
	}

	public Shelf getShelfById(int id) {
		return shelfDao.getShelfById(id);
	}

	public void update(Shelf shelf) {
		shelfDao.update(shelf);
	}

	public void delete(int id) {
		shelfDao.delete(id);
	}

}
