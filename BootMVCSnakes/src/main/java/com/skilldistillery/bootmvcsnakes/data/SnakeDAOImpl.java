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

	@Override
	public List<Species> getAllSpecies(){
		String query = "SELECT species FROM Species species";
		List<Species> list = em.createQuery(query, Species.class).getResultList();
		return list;
	}

	@Override
	public Snake addSnake(Snake snake) {
		em.persist(snake);
		em.flush();
		return snake;
	}
	
	
	@Override
	public boolean deleteSnake(Snake snake) {
		Snake managed = em.find(Snake.class, snake.getId());
		
		if(managed == null) {
			return false;
		}
		
		em.remove(managed);
		
		if(em.find(Snake.class, snake.getId()) != null) {
			return false;
		}
		return true;
	}

	@Override
	public boolean modifySnake(Snake snake) {
		Snake managed = em.find(Snake.class, snake.getId());
		
		if(managed == null) {
			return false;
		}
		
		try {
			managed.setDateOfBirth(snake.getDateOfBirth().toString());
			managed.setImageURL(snake.getImageURL());
			managed.setLengthInCM(snake.getLengthInCM());
			managed.setMorph(snake.getMorph());
			managed.setName(snake.getName());
			managed.setPurchasedFrom(snake.getPurchasedFrom());
			managed.setSpeciesId(snake.getSpeciesId());
			managed.setWeightInGrams(snake.getWeightInGrams());
			em.persist(managed);
			em.flush();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
