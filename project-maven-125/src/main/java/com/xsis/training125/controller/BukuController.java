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

import com.xsis.training125.model.Buku;
import com.xsis.training125.service.BukuService;

@Controller
@RequestMapping("/buku")
public class BukuController {
	
	@Autowired
	BukuService bukuService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String index(Model model) {
		List<Buku> buku = bukuService.getAllBuku();
		model.addAttribute("buku", buku);
		return "buku";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String save(@ModelAttribute Buku buku) {
		bukuService.save(buku);
		return "redirect:/buku";
	}
	
	@RequestMapping(value="/edit/{id}")
	@ResponseBody
	public Buku getBukuById(@PathVariable int id) {
		Buku result = bukuService.getBukuById(id);
		return result;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Buku buku) {
		bukuService.update(buku);
	}
	
	@RequestMapping(value="/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable int id) {
		bukuService.delete(id);
	}
}
