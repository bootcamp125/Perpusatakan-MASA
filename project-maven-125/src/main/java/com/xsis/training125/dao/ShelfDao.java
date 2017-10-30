package com.xsis.training125.dao;

import java.util.List;

import com.xsis.training125.model.Shelf;

public interface ShelfDao {

	public void save(Shelf shelf);

	public List<Shelf> getAllShelfs();

	public Shelf getShelfById(int id);

	public void update(Shelf customer);

	public void delete(int id);

}
