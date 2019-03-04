package com.skilldistillery.bootmvcsnakes;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@EntityScan("com.skilldistillery.jpasnakes")
@SpringBootApplication
public class BootMvcSnakesApplication extends SpringBootServletInitializer {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(BootMvcSnakesApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(BootMvcSnakesApplication.class, args);
	}

}
