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

import com.xsis.training125.model.Publisher;
import com.xsis.training125.service.PublisherService;

@Controller
@RequestMapping("/publisher")
public class PublisherController {
	
	@Autowired
	PublisherService publisherService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
		List<Publisher> publisher = publisherService.getAllPublisher();
		model.addAttribute("publisher", publisher);
		return "publisher";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public String save(@ModelAttribute Publisher publisher) {
		publisherService.save(publisher);
		return "redirect:/publisher";
	}
	
	@RequestMapping(value="/edit/{id}")
	@ResponseBody
	public Publisher getPublisherById(@PathVariable int id) {
		return publisherService.getPublisherById(id);
	}
	
	@RequestMapping(value="/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Publisher publisher) {
		publisherService.update(publisher);
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable int id) {
		publisherService.delete(id);
	}
}
