package com.xsis.training125.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xsis.training125.model.BorrowTransaction;
import com.xsis.training125.service.BorrowTransactionService;

@Controller
@RequestMapping("/borrow_transaction")
public class BorrowTransactionController {
	
	@Autowired
	BorrowTransactionService borrowTransactionService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "borrowTransaction";
	}
	
	@RequestMapping(value="/save")
	public String save(@ModelAttribute BorrowTransaction borrowTransaction) {
		borrowTransactionService.save(borrowTransaction);
		return "redirect:/borrowTransaction";
	}
}
