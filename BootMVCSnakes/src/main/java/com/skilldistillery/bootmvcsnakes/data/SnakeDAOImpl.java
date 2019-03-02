package com.skilldistillery.bootmvcsnakes.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpasnakes.entities.Snake;
import com.skilldistillery.jpasnakes.entities.Species;

@Transactional
@Service
public class SnakeDAOImpl implements SnakeDAO {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Snake getSnakeById(int id) {
		return em.find(Snake.class, id);
	}

	@Override
	public Species getSpeciesById(int id) {
		return em.find(Species.class, id);
	}
	
	@Override
	public List<Snake> getAllSnakes(){
		String query = "SELECT snake FROM Snake snake";
		List<Snake> list = em.createQuery(query, Snake.class).getResultList();
		return list;
	}
}
