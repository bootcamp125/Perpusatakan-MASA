package com.xsis.training125.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.DepartmentDao;
import com.xsis.training125.model.Department;

@Transactional
@Service
public class DepartmentService {

	@Autowired
	DepartmentDao departmentDao;
	
	public void save(Department department) {
		// TODO Auto-generated method stub
		departmentDao.save(department);
	}

	public List<Department> getAllDepartment() {
		// TODO Auto-generated method stub
		return departmentDao.getAllDepartment();
	}

}
