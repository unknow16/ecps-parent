package com.fuyi.ecps.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/item")
public class EbItemController {

	@RequestMapping("/listItem.do")
	public String listItem() {
		return "item/list";
	}
}
