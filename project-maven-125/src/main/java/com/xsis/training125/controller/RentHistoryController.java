package com.xsis.training125.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xsis.training125.model.RentHistory;
import com.xsis.training125.service.RentHistoryService;

@Controller
@RequestMapping("/rent_history")
public class RentHistoryController {
	
	@Autowired
	RentHistoryService rentHistoryService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
		List<RentHistory> rentHistories = rentHistoryService.getAllHistories();
		model.addAttribute("rentHistories", rentHistories);
		return "rentHistory";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public String save(@ModelAttribute RentHistory rentHistory) {
		rentHistoryService.save(rentHistory);
		return "redirect:/rent_history";
	}
}