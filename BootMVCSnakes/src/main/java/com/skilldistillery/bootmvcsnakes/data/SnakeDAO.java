package com.skilldistillery.bootmvcsnakes.data;

import java.util.List;

import com.skilldistillery.jpasnakes.entities.Snake;
import com.skilldistillery.jpasnakes.entities.Species;

public interface SnakeDAO {
	Snake getSnakeById(int id);
	Species getSpeciesById(int id);
	List<Snake> getAllSnakes();
	List<Snake> getSnakesBySpeciesAsString(String option) ;
	List<Species> getAllSpecies();
	Snake addSnake(Snake snake);
	boolean deleteSnake(Snake snake);
	boolean modifySnake(Snake snake);
}
