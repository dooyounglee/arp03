package com.kh.arp.FAQ.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FAQContoller {
	

@RequestMapping("flist.ad")
public String faqListForm() {
	
	return "FAQ/FAQListForm";
}
@RequestMapping("finsertForm.ad")
public String faqInsertForm() {
	return "FAQ/insertFAQForm";
}

	
	

}
