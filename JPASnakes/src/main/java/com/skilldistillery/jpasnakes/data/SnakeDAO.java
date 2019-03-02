package com.skilldistillery.jpasnakes.data;

import com.skilldistillery.jpasnakes.entities.Snake;

public interface SnakeDAO {
	Snake getSnakeById(int id);
}
