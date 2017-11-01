package com.xsis.training125.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xsis.training125.model.BorrowTransaction;
import com.xsis.training125.model.Customer;
import com.xsis.training125.model.Employee;
import com.xsis.training125.service.BorrowTransactionService;
import com.xsis.training125.service.CustomerService;
import com.xsis.training125.service.EmployeeService;

@Controller
@RequestMapping("/borrow_transaction")
public class BorrowTransactionController {
	
	@Autowired
	BorrowTransactionService borrowTransactionService;
	@Autowired
	CustomerService customerService;
	@Autowired
	EmployeeService employeeService;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
		List<Customer> customers = customerService.getAllCustomers();
		model.addAttribute("customers", customers);
		
		List<Employee> employees = employeeService.getAllEmployees();
		model.addAttribute("employees", employees);
		return "borrowTransaction";
	}
	
	@RequestMapping(value="/save")
	@ResponseBody
	public BorrowTransaction save(@ModelAttribute BorrowTransaction borrowTransaction) {
		//borrowTransactionService.save(borrowTransaction);
		return borrowTransaction;
	}
}
