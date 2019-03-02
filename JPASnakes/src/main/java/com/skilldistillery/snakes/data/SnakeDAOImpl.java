package com.skilldistillery.snakes.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;

import com.skilldistillery.snakes.entities.Snake;

public class SnakeDAOImpl implements SnakeDAO {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPASnakes");
	
	public static void closeEMF() {
		emf.close();
	}
	
	@Override
	public Snake getSnakeById(int id) {
		EntityManager em = emf.createEntityManager();
		String query = "SELECT snake FROM Snake snake WHERE snake.id = :id";
		Snake snake = null;
		
		try {
			snake = em.createQuery(query, Snake.class).setParameter("id", id).getSingleResult();
		}catch(NoResultException e) {
		}
		
		em.close();
		return snake;
	}
}
