package com.xsis.training125.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training125.model.Department;

@Repository
public class DepartmentDaoImpl implements DepartmentDao{

	@Autowired
	SessionFactory sessionFactory;
	public void save(Department department) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(department);
		session.flush();
	}
	public List<Department> getAllDepartment() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Department";
		List<Department> listDept = session.createQuery(hql).list();
		
		if(listDept.isEmpty()){
			return null;
		}
		return listDept;
	}

}
