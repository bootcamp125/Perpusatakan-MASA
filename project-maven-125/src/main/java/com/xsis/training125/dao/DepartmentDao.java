package com.xsis.training125.dao;

import java.util.List;

import com.xsis.training125.model.Department;

public interface DepartmentDao {

	void save(Department department);

	List<Department> getAllDepartment();

}
