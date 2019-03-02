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
	
	private String name, morph;
	@Column(name="image_url")
	private String imageURL;
	
	@Column(name="purchased_from")
	private String purchasedFrom;
	
	@Column(name="length_in_cm")
	private double lengthInCM;
	
	@Column(name="weight_in_grams")
	private double weightInGrams;

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

	@Override
	public String toString() {
		return "Snake [id=" + id + ", name=" + name + ", morph=" + morph + ", imageURL=" + imageURL + ", purchasedFrom="
				+ purchasedFrom + ", lengthInCM=" + lengthInCM + ", weightInGrams=" + weightInGrams + "]";
	}
}

