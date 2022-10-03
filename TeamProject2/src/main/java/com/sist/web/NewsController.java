package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewsController {

	
	@GetMapping("news/news.do")
	public String news_news() {
		return "news/news";
	}
}
