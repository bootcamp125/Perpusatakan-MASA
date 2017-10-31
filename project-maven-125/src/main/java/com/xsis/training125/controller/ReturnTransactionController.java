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
@RequestMapping("/returntransaction")
public class ReturnTransactionController {

	@Autowired
	ReturnTransactionService returntransactionService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {

		List<ReturnTransaction> returntransactions = returntransactionService.getAllReturnTransactions();
		model.addAttribute("returntransactions", returntransactions);
		return "returntransaction";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String savingData(@ModelAttribute ReturnTransaction returntransaction) {
		returntransactionService.save(returntransaction);
		return "redirect:/returntransaction";
	}

}
