package com.xsis.training125.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.training125.model.Employee;
import com.xsis.training125.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	//REST API -> @ResponseBody
	@Autowired
	EmployeeService employeeService;

	@RequestMapping(method=RequestMethod.GET)
	public String index(Model model){
		
		List<Employee> employees = employeeService.getAllEmployees();
		model.addAttribute("employees", employees);
		return "employee";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String savingData(@ModelAttribute Employee employee){
		employeeService.save(employee);
		return "redirect:/employee";
	}
	
	@RequestMapping(value="/save2", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void savingData2(@RequestBody Employee employee){
		employeeService.save(employee);
	}
	
	@RequestMapping(value="/empid/{id}")
	@ResponseBody
	public Employee getEmployeeById(@PathVariable int id){
		 Employee result = employeeService.getEmployeeById(id);
		 return result;
	}
	
	@RequestMapping(value="/update?data=apa", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void updateEmployee(@RequestBody Employee employee){
		employeeService.update(employee);
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable int id){
		employeeService.delete(id);
	}

	@RequestMapping(value="/allemp", method=RequestMethod.GET)
	@ResponseBody
	public List<Employee> getAllEmployees(){
		List<Employee> employees = employeeService.getAllEmployees();
		
		return employees;
	}
}
