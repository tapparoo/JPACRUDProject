package com.skilldistillery.snakes.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Snake {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name, genus, species, morph, image;
	
	@Column(name="purchased_from")
	private String purchasedFrom;
	
	@Column(name="length_in_cm")
	private double lengthInCM;
	
	@Column(name="weight_in_grams")
	private double weightInGrams;
	
	public Snake() {}

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

	public String getGenus() {
		return genus;
	}

	public void setGenus(String genus) {
		this.genus = genus;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public String getMorph() {
		return morph;
	}

	public void setMorph(String morph) {
		this.morph = morph;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPurchasedFrom() {
		return purchasedFrom;
	}

	public void setPurchasedFrom(String purchasedFrom) {
		this.purchasedFrom = purchasedFrom;
	}

	public double getLengthInCM() {
		return lengthInCM;
	}

	public void setLengthInCM(double lengthInCM) {
		this.lengthInCM = lengthInCM;
	}

	public double getWeightInGrams() {
		return weightInGrams;
	}

	public void setWeightInGrams(double weightInGrams) {
		this.weightInGrams = weightInGrams;
	}

	@Override
	public String toString() {
		return "Snake [id=" + id + ", name=" + name + ", genus=" + genus + ", species=" + species + ", morph=" + morph
				+ ", image=" + image + ", purchasedFrom=" + purchasedFrom + ", lengthInCM=" + lengthInCM
				+ ", weightInGrams=" + weightInGrams + "]";
	}
}

