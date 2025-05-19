package pk.model;

import java.util.Base64;

public class Cart {
	private int cartID;
	 private int qty;
	 private double total;
	 private int customerID;
	 private int productID;
	 private String productName;  // added for display purposes
	 private double productPrice; 
	 private byte[] productimage;
	 private int productQty;

		    
		public Cart() {
				super();
			}
		

		public Cart(int cartID, int qty, double total, int customerID, int productID) {
			super();
			this.cartID = cartID;
			this.qty = qty;
			this.total = total;
			this.customerID = customerID;
			this.productID = productID;
		}
		public int getCartID() {
			return cartID;
		}
		public void setCartID(int cartID) {
			this.cartID = cartID;
		}
		public int getQty() {
			return qty;
		}
		public void setQty(int qty) {
			this.qty = qty;
		}
		public double getTotal() {
			return total;
		}
		public void setTotal(double total) {
			this.total = total;
		}
		public int getCustomerID() {
			return customerID;
		}
		public void setCustomerID(int customerID) {
			this.customerID = customerID;
		}
		public int getProductID() {
			return productID;
		}
		public void setProductID(int productID) {
			this.productID = productID;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public double getProductPrice() {
			return productPrice;
		}
		public void setProductPrice(double productPrice) {
			this.productPrice = productPrice;
		}
		 public String getBase64Image(String imageType) {
		        return "data:image/" + imageType + ";base64," + Base64.getEncoder().encodeToString(this.productimage);
		    }
		public void setProductimage(byte[] productimage) {
			this.productimage = productimage;
		}


		public int getProductQty() {
			return productQty;
		}


		public void setProductQty(int productQty) {
			this.productQty = productQty;
		}
	

}
