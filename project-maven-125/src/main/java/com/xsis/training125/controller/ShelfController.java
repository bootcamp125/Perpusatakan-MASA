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

import com.xsis.training125.model.Shelf;
import com.xsis.training125.service.ShelfService;

@Controller
@RequestMapping("/shelf")
public class ShelfController {

	@Autowired
	ShelfService shelfService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {

		List<Shelf> shelfs = shelfService.getAllShelfs();
		model.addAttribute("shelfs", shelfs);
		return "shelf";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String savingData(@ModelAttribute Shelf shelf) {
		shelfService.save(shelf);
		return "redirect:/shelf";
	}

	@RequestMapping(value = "/empid/{id}")
	@ResponseBody
	public Shelf getShelfById(@PathVariable int id) {
		Shelf result = shelfService.getShelfById(id);
		return result;
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void updateShelf(@RequestBody Shelf shelf) {
		shelfService.update(shelf);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable int id) {
		shelfService.delete(id);
	}

	@RequestMapping(value = "/allemp", method = RequestMethod.GET)
	@ResponseBody
	public List<Shelf> getAllShelfs() {
		List<Shelf> shelfs = shelfService.getAllShelfs();

		return shelfs;
	}
}
