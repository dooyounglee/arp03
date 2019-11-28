package com.kh.arp.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebsocketController {

	@RequestMapping("/test.ws")
	public ModelAndView testWS(ModelAndView mv) {
		mv.setViewName("qna/websocket");
		return mv;
	}
}
