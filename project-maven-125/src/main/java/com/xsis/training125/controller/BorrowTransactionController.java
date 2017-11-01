package com.xsis.training125.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xsis.training125.model.BorrowTransaction;
import com.xsis.training125.model.Customer;
import com.xsis.training125.service.BorrowTransactionService;
import com.xsis.training125.service.CustomerService;

@Controller
@RequestMapping("/borrow_transaction")
public class BorrowTransactionController {
	
	@Autowired
	BorrowTransactionService borrowTransactionService;
	@Autowired
	CustomerService customerService;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
		List<Customer> customers = customerService.getAllCustomers();
		model.addAttribute("customers", customers);
		return "borrowTransaction";
	}
	
	@RequestMapping(value="/save")
	public String save(@ModelAttribute BorrowTransaction borrowTransaction) {
		borrowTransactionService.save(borrowTransaction);
		return "redirect:/rent_history";
	}
}
