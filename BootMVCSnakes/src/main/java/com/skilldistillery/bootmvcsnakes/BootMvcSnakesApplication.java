package com.skilldistillery.bootmvcsnakes;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@EntityScan("com.skilldistillery.jpasnakes")
@SpringBootApplication
public class BootMvcSnakesApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootMvcSnakesApplication.class, args);
	}

}
