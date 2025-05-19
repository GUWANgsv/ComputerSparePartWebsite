package pk.model;

import java.util.Base64;

public class Product {
	private int productID;
	private String category;
	private String name;
	private String description;
	private byte[] image;
	private double price;
	private int qty;
	
	public Product() {
		super();
	}
	public Product(int productID, String category, String name, String description, byte[] image, double price,int qty) {
		super();
		this.productID = productID;
		this.category = category;
		this.name = name;
		this.description = description;
		this.image = image;
		this.price = price;
		this.qty = qty;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	   public String getBase64Image(String imageType) {
	        return "data:image/" + imageType + ";base64," + Base64.getEncoder().encodeToString(this.image);
	    }

	public void setImage(byte[] image) {
		this.image = image;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}

}
