package com.skilldistillery.snakes.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Species {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name, species;
	
	@Column(name="default_image_url")
	private String defaultImageURL;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public String getDefaultImageURL() {
		return defaultImageURL;
	}

	public void setDefaultImageURL(String defaultImageURL) {
		this.defaultImageURL = defaultImageURL;
	}

	@Override
	public String toString() {
		return "Species [id=" + id + ", name=" + name + ", species=" + species + ", defaultImageURL=" + defaultImageURL
				+ "]";
	}
}

