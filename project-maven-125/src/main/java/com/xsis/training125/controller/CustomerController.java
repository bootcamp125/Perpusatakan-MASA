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

import com.xsis.training125.model.Customer;
import com.xsis.training125.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	// REST API -> @ResponseBody
	@Autowired
	CustomerService customerService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {

		List<Customer> customers = customerService.getAllCustomers();
		model.addAttribute("customers", customers);
		return "customer";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String savingData(@ModelAttribute Customer customer) {
		customerService.save(customer);
		return "redirect:/customer";
	}

	/*
	 * @RequestMapping(value = "/save2", method = RequestMethod.POST)
	 * 
	 * @ResponseStatus(HttpStatus.CREATED) public void savingData2(@RequestBody
	 * Customer customer) { customerService.save(customer); }
	 */

	@RequestMapping(value = "/edit/{id}")
	@ResponseBody
	public Customer getCustomerById(@PathVariable int id) {
		Customer result = customerService.getCustomerById(id);
		return result;
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void updateCustomer(@RequestBody Customer customer) {
		customerService.update(customer);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable int id) {
		customerService.delete(id);
	}

	@RequestMapping(value = "/allemp", method = RequestMethod.GET)
	@ResponseBody
	public List<Customer> getAllCustomers() {
		List<Customer> customers = customerService.getAllCustomers();

		return customers;
	}

}
