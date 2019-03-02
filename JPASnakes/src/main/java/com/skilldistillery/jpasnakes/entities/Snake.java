package com.skilldistillery.jpasnakes.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Snake {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="species_id")
	private int speciesId;
	
	private String name, morph;
	
	@ManyToOne
    @JoinColumn(name="species_id", insertable=false, updatable=false)
	private Species species;
	
	@Column(name="image_url")
	private String imageURL;
	
	@Column(name="purchased_from")
	private String purchasedFrom;
	
	@Column(name="length_in_cm")
	private double lengthInCM;
	
	@Column(name="weight_in_grams")
	private double weightInGrams;
	
	@Column(name="date_of_birth")
	private LocalDate dateOfBirth;

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

	public String getMorph() {
		return morph;
	}

	public void setMorph(String morph) {
		this.morph = morph;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
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
	
	public int getSpeciesId() {
		return speciesId;
	}

	public void setSpeciesId(int speciesId) {
		this.speciesId = speciesId;
	}
	

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	
	public Species getSpecies() {
		return species;
	}

	public void setSpecies(Species species) {
		this.species = species;
	}

	@Override
	public String toString() {
		return "Snake [id=" + id + ", speciesId=" + speciesId + ", name=" + name + ", morph=" + morph + ", imageURL="
				+ imageURL + ", purchasedFrom=" + purchasedFrom + ", lengthInCM=" + lengthInCM + ", weightInGrams="
				+ weightInGrams + ", dateOfBirth=" + dateOfBirth + "]";
	}
}

