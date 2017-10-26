package com.xsis.training125.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/hallo")
public class Hello {
	
	@RequestMapping
	public String index(){
		return "hallo";
	}

}
