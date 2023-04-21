package com.edu.main;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model)  throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		
		return "main";
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Locale locale, Model model)  throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "main";
	}
	
}