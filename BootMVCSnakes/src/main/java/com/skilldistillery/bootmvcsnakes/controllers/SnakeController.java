package com.skilldistillery.bootmvcsnakes.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.bootmvcsnakes.data.SnakeDAO;
import com.skilldistillery.jpasnakes.entities.Snake;

@Controller
public class SnakeController {
	@Autowired
	SnakeDAO dao;

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("allSnakes", dao.getAllSnakes());
		return "index";
	}

	@RequestMapping(path = "getSnakeById.do", method = RequestMethod.GET)
	public String getSnakeById(Model model, int id) {
		Snake snake = dao.getSnakeById(id);
		model.addAttribute("snake", snake);
		if (snake != null) {
			model.addAttribute("species", dao.getSpeciesById(snake.getSpeciesId()));
		}
		return "snake";
	}
}
