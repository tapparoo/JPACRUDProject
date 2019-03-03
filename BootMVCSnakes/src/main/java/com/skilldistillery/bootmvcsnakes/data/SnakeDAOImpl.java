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
	public Integer addSnake(Snake snake) {
		em.persist(snake);
		em.flush();
		return 1;
	}
	
	@Override
	public boolean deleteSnake(Snake snake) {
		em.remove(snake);
		return true;
	}

	@Override
	public boolean modifySnake(Snake snake) {
		Snake managed = em.find(Snake.class, snake.getId());
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
		return true;
	}
}
