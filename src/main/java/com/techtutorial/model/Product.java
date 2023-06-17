package com.techtutorial.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class Product {
private int id;
private String name;
private String category;
private Double price;
private String image;

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
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public Double getPrice() {
	return price;
}
public void setPrice(Double price) {
	this.price = price;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
@Override
public String toString() {
	return "Product [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + ", image=" + image
			+ "]";
}

}
