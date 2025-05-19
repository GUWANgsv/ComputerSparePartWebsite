package pk.model;


import java.sql.Timestamp;

public class Order {
	private int orderID;
	private int qty;	
	private Timestamp date;
	private double total;
	private String status;
	private int cartID;
	private int customerID ;
	private String name;
	
	public Order() {
		super();
	}

	public Order(int orderID, int qty, Timestamp date, double total, String status, int cartID, int customerID) {
		super();
		this.orderID = orderID;
		this.qty = qty;
		this.date=date;
		this.total = total;
		this.status = status;
		this.cartID = cartID;
		this.customerID = customerID;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCartID() {
		return cartID;
	}
	public void setCartID(int cartID) {
		this.cartID = cartID;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}
}
