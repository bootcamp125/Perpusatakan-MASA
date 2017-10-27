package com.xsis.training125.dao;

import java.util.List;

import com.xsis.training125.model.Buku;

public interface BukuDao {
	
	public void save(Buku buku);

	public List<Buku> getAllBuku();

	public Buku getBukuById(int id);

	public void update(Buku buku);

	public void delete(int id);
}
