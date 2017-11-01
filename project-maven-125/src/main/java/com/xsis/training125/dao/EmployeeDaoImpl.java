package com.xsis.training125.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public List<Employee> getAllEmployees() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee";
		List<Employee> employee = session.createQuery(hql).list();
		if (employee.isEmpty()) {
			return null;
		}
		return employee;
	}
	
	public void save(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		session.save(employee);
		session.flush();
	}
	
	public Employee getEmployeeById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Employee employee = session.get(Employee.class, id);
		return employee;
	}
	
	public void update(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		session.update(employee);
		session.flush();
	}
	
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Employee employee = new Employee();
		employee.setId(id);
		employee.setName("name");
		session.delete(employee);
		session.flush();
	}

}
