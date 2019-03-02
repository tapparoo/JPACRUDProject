package com.skilldistillery.jpasnakes.test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpasnakes.data.SpeciesDAO;
import com.skilldistillery.jpasnakes.data.SpeciesDAOImpl;

@DisplayName("Species Tests")
class SpeciesTest {
	SpeciesDAO dao;

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		SpeciesDAOImpl.closeEMF();
	}

	@BeforeEach
	void setUp() throws Exception {
		dao = new SpeciesDAOImpl();
	}

	@AfterEach
	void tearDown() throws Exception {
		dao = null;
	}
	
	@Test
	void test_getSpeciesById_returns_correct_Species() {
		assertEquals("Ball Python", dao.getSpeciesById(5).getName());
		assertEquals("Python regius", dao.getSpeciesById(5).getSpecies());
		
		assertNull(dao.getSpeciesById(44));
	}

	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}

}
