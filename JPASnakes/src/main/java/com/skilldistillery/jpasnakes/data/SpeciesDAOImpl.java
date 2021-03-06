package com.skilldistillery.jpasnakes.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;

import com.skilldistillery.jpasnakes.entities.Species;

public class SpeciesDAOImpl implements SpeciesDAO {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("snakeEntities");
	
	public static void closeEMF() {
		emf.close();
	}
	
	@Override
	public Species getSpeciesById(int id) {
		EntityManager em = emf.createEntityManager();
		String query = "SELECT species FROM Species species WHERE species.id = :id";
		Species species = null;
		
		try {
			species = em.createQuery(query, Species.class).setParameter("id", id).getSingleResult();
		}catch(NoResultException e) {
		}
		
		em.close();
		return species;
	}
}
