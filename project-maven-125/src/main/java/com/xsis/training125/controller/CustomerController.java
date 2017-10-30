package com.xsis.training125.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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

	@RequestMapping(value = "/empid/{id}")
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

	@InitBinder
	private void dateBinder(WebDataBinder binder) {
		// The date format to parse or output your dates
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		// Create a new CustomDateEditor
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
		// Register it as custom editor for the Date type
		binder.registerCustomEditor(Date.class, editor);
	}
}
