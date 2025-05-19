package pk.model;

public class Admin {
	private int adminID;
	private String email;
	private String password;
	
	public Admin(int adminID, String email, String password) {
		super();
		this.adminID = adminID;
		this.email = email;
		this.password = password;
	}

	public int getAdminID() {
		return adminID;
	}

	public void setAdminID(int adminID) {
		this.adminID = adminID;
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
