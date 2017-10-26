
package com.xsis.training125.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.training125.model.Department;
import com.xsis.training125.service.DepartmentService;

@Controller
@RequestMapping("/department")
public class DepartmentController {

	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Department department){
		departmentService.save(department);
	}
	
	@RequestMapping(value = "/alldept", method=RequestMethod.GET)
	@ResponseBody
	public List<Department> getAllDepartment(){
		List<Department> listDepartment = departmentService.getAllDepartment();
		return listDepartment;
	}
	
	/*@RequestMapping(value="/dept", method=RequestMethod.GET)
	public List<Department> getAllDepartment(){
		return 
	}*/
}
