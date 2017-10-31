package com.xsis.training125.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.xsis.training125.model.ReturnTransaction;
import com.xsis.training125.service.ReturnTransactionService;


@Controller
@RequestMapping("/returnTransaction")
public class ReturnTransactionController {

	@Autowired
	ReturnTransactionService returnTransactionService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {

		List<ReturnTransaction> returnTransactions = returnTransactionService.getAllReturnTransactions();
		model.addAttribute("returnTransactions", returnTransactions);
		return "returnTransaction";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String savingData(@ModelAttribute ReturnTransaction returnTransaction) {
		returnTransactionService.save(returnTransaction);
		return "redirect:/returnTransaction";
	}

}
