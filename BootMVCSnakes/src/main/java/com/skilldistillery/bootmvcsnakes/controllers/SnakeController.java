package com.skilldistillery.bootmvcsnakes.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.bootmvcsnakes.data.SnakeDAO;
import com.skilldistillery.jpasnakes.entities.Snake;

@Controller
public class SnakeController {
	@Autowired
	SnakeDAO dao;

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String index(Model model, @ModelAttribute("result")String result) {
		if(result != null) {
			model.addAttribute("result", result);
		}
		model.addAttribute("allSnakes", dao.getAllSnakes());
		model.addAttribute("allSpecies", dao.getAllSpecies());
		return "index";
	}

	@RequestMapping(path = "getSnakeById.do", method = RequestMethod.GET)
	public String getSnakeById(Model model, @ModelAttribute("id")Integer id) {
		String result = null;
		Snake snake = dao.getSnakeById(id);
		
		if(snake == null) {
			result = "No snake found with ID " + id;
			model.addAttribute("result", result);
			model.addAttribute("allSnakes", dao.getAllSnakes());
			model.addAttribute("allSpecies", dao.getAllSpecies());
			return "index";
		}
			
		model.addAttribute("snake", snake);
		model.addAttribute("allSpecies", dao.getAllSpecies());
		return "snake";
	}

	@RequestMapping(path = "addSnake.do", method = RequestMethod.POST)
	public String addSnake(Snake snake, RedirectAttributes redir) {
		snake = dao.addSnake(snake);
		if(snake != null) {
			redir.addFlashAttribute("id", snake.getId());
			redir.addFlashAttribute("allSpecies", dao.getAllSpecies());
			return "redirect:getSnakeById.do";
		}else {
			redir.addFlashAttribute("result", "Failed to add record");
		}
		return "redirect:/";
	}
	
	@RequestMapping(path = "deleteSnake.do", method = RequestMethod.POST)
	public String deleteSnake(Snake snake) {
		if(snake != null) {
			dao.deleteSnake(snake);
		}
		return "redirect:/";
	}
	
	@RequestMapping(path = "modifySnake.do", method = RequestMethod.POST)
	public String modifySnake(Snake snake, RedirectAttributes redir) {
		String result = null;
		
		if(snake != null) {
			if(dao.modifySnake(snake)) {
				result = "Update successfull";
			}else {
				result = "Update failed";
			}
		}
		redir.addFlashAttribute("result", result);
		return "redirect:getSnakeById.do?id=" + snake.getId();
	}
}
