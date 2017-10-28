package com.xsis.training125.dao;

import java.util.List;

import com.xsis.training125.model.Publisher;

public interface PublisherDao {

	List<Publisher> getAllPublisher();

	void save(Publisher publisher);

	Publisher getPublisherById(int id);

	void update(Publisher publisher);

	void delete(int id);

}
