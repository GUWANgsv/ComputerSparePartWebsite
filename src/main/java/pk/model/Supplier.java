package pk.model;

public class Supplier {
	private int supplierID;
	private String email;
	private String password;
	
	public Supplier(int supplierID, String email, String password) {
		super();
		this.supplierID = supplierID;
		this.email = email;
		this.password = password;
	}

	public int getSupplierID() {
		return supplierID;
	}

	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
