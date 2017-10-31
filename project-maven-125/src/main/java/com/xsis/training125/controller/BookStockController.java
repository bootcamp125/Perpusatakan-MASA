package com.xsis.training125.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xsis.training125.model.Book;
import com.xsis.training125.model.BookStock;
import com.xsis.training125.service.BookService;
import com.xsis.training125.service.BookStockService;

@Controller
@RequestMapping("/bookstock")
public class BookStockController {
	
	@Autowired
	BookStockService bookStockService;
	@Autowired
	BookService bookService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
		List<Book> books = bookService.getAllBook();
		model.addAttribute("books", books);
		return "bookstock";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public String save(@ModelAttribute BookStock stock) {
		bookStockService.save(stock);
		return "redirect:/book";
	}
}
