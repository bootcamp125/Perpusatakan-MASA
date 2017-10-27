package com.xsis.training125.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.BukuDao;
import com.xsis.training125.model.Buku;

@Transactional
@Service
public class BukuService {
	
	@Autowired
	BukuDao bukuDao;
	
	public List<Buku> getAllBuku() {
		return bukuDao.getAllBuku();
	}
	
	public void save(Buku buku) {
		bukuDao.save(buku);
	}

	public Buku getBukuById(int id) {
		return bukuDao.getBukuById(id);
	}

	public void update(Buku buku) {
		bukuDao.update(buku);
	}

	public void delete(int id) {
		bukuDao.delete(id);
	}
}
