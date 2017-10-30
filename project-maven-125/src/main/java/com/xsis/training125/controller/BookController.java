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

import com.xsis.training125.model.Book;
import com.xsis.training125.model.Publisher;
import com.xsis.training125.service.BookService;
import com.xsis.training125.service.PublisherService;

@Controller
@RequestMapping("/book")
public class BookController {

	@Autowired
	BookService bookService;
	@Autowired
	PublisherService publisherService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
		List<Book> books = bookService.getAllBook();
		model.addAttribute("books", books);

		List<Publisher> publishers = publisherService.getAllPublisher();
		model.addAttribute("publishers", publishers);

		return "book";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute Book book) {
		bookService.save(book);
		return "redirect:/book";
	}

	@RequestMapping(value = "/edit/{id}")
	@ResponseBody
	public Book getbookById(@PathVariable int id) {
		Book result = bookService.getBookById(id);
		return result;
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Book book) {
		bookService.update(book);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable int id) {
		bookService.delete(id);
	}
}
