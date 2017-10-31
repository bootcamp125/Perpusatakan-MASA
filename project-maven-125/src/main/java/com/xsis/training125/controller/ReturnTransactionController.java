package com.xsis.training125.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

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

	@RequestMapping(value = "/edit/{id}")
	@ResponseBody
	public ReturnTransaction getReturnTransactionById(@PathVariable int id) {
		ReturnTransaction result = returntransactionService.getReturnTransactionById(id);
		return result;
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void updateReturnTransaction(@RequestBody ReturnTransaction returntransaction) {
		returntransactionService.update(returntransaction);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable int id) {
		returntransactionService.delete(id);
	}

	@RequestMapping(value = "/allemp", method = RequestMethod.GET)
	@ResponseBody
	public List<ReturnTransaction> getAllReturnTransactions() {
		List<ReturnTransaction> returntransactions = returntransactionService.getAllReturnTransactions();

		return returntransactions;
	}
}
