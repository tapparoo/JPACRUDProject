package com.skilldistillery.jpasnakes.data;

import com.skilldistillery.jpasnakes.entities.Species;

public interface SpeciesDAO {
	Species getSpeciesById(int id);
}
