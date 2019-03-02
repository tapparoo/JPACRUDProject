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

import com.skilldistillery.jpasnakes.data.SnakeDAO;
import com.skilldistillery.jpasnakes.data.SnakeDAOImpl;

@DisplayName("Snake Tests")
class SnakeTest {
	SnakeDAO dao;

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		SnakeDAOImpl.closeEMF();
	}

	@BeforeEach
	void setUp() throws Exception {
		dao = new SnakeDAOImpl();
	}

	@AfterEach
	void tearDown() throws Exception {
		dao = null;
	}
	
	@Test
	void test_getSnakeById_returns_correct_Snake() {
		assertEquals("Bertha", dao.getSnakeById(1).getName());
		assertEquals(157, dao.getSnakeById(1).getLengthInCM());
		assertEquals(6950, dao.getSnakeById(1).getWeightInGrams());
		
		assertNull(dao.getSnakeById(44));
	}

	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}

}
