package com.xsis.training125.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xsis.training125.model.Book;
import com.xsis.training125.model.BookTransaction;
import com.xsis.training125.service.BookService;
import com.xsis.training125.service.BookTransactionService;

@Controller
@RequestMapping("/book_transaction")
public class BookTransactionController {
	
	@Autowired
	BookTransactionService bookTransactionService;
	@Autowired
	BookService bookService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
		List<BookTransaction> bookTransactions = bookTransactionService.getAllBookTransactions();
		model.addAttribute("bookTransactions", bookTransactions);
		
		List<Book> books = bookService.getAllBook();
		model.addAttribute("books", books);

		return "bookTransaction";
	}
	
	@RequestMapping(value="/save")
	public String save(@ModelAttribute BookTransaction bookTransaction) {
		bookTransactionService.save(bookTransaction);
		return "redirect:/bookTransaction";
	}
}
