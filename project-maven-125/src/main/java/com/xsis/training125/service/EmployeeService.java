package com.xsis.training125.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training125.dao.EmployeeDao;
import com.xsis.training125.model.Employee;

@Transactional
@Service
public class EmployeeService{
	
	@Autowired
	EmployeeDao employeeDao;
	
	public void save(Employee employee){
		employeeDao.save(employee);
	}

	public List<Employee> getAllEmployees() {
		// TODO Auto-generated method stub
		return employeeDao.getAllEmployees();
	}

	public Employee getEmployeeById(int id) {
		// TODO Auto-generated method stub
		return employeeDao.getEmployeeById(id);
	}

	public void update(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.update(employee);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		employeeDao.delete(id);
	}


}
