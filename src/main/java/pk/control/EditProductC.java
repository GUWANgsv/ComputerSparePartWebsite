package pk.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pk.model.Product;
import pk.util.DBconnection;

public class EditProductC {
	 public static boolean updateProductPriceQty(int productID, double price, int qty) {
		 boolean x =false;
		 Connection con =null;
		 PreparedStatement ps=null;
		 try {
			 con=DBconnection.getConnection();
	        String sql = "UPDATE product SET price = ? , qty = ? WHERE productID = ? ";
	        	ps=con.prepareStatement(sql);	 
	       
	        	ps.setDouble(1, price);
	            ps.setInt(2, qty);
	            ps.setInt(3, productID);
	     int rowInserted=ps.executeUpdate();
	     if(rowInserted>0) {
	    	 x=true;
	     }
	    }
		 catch(SQLException e) {
			 e.printStackTrace();
		 }finally {
			 try {
				 if(ps!=null)
					 ps.close();
				 if(con!=null)
					 con.close();
				 
			 }
			 catch(SQLException e) {
				 e.printStackTrace();
			 }
		 }
			return x; 
		 }

	    public static boolean deleteProduct(int productID)  {
	   	 boolean x =false;
		 Connection con =null;
		 PreparedStatement ps=null;
		 try {
			 con=DBconnection.getConnection();
	    	String sql = "DELETE FROM product WHERE productID = ?";
	        ps=con.prepareStatement(sql);  
	    	ps.setInt(1, productID);
	            
	            int rowInserted=ps.executeUpdate();
	   	     if(rowInserted>0) {
	   	    	 x=true;
	   	     }
	   	    }
	   		 catch(SQLException e) {
	   			 e.printStackTrace();
	   		 }finally {
	   			 try {
	   				 if(ps!=null)
	   					 ps.close();
	   				 if(con!=null)
	   					 con.close();
	   				 
	   			 }
	   			 catch(SQLException e) {
	   				 e.printStackTrace();
	   			 }
	   		 }
	   			return x; 
	        
	    }
	    
 public  static ArrayList<Product> getEditItem(int productID){
	 ArrayList <Product> p1=new ArrayList<>();
	 
	 Connection con =null;
	 PreparedStatement ps=null;
	 try {
		 
		 con=DBconnection.getConnection();
		 String sql="SELECT productID,name,image,price,qty FROM product WHERE productID=?";
		 ps=con.prepareStatement(sql);
		 ps.setInt(1, productID);
		 ResultSet rs=ps.executeQuery();	
	while(rs.next()) {
		Product p2=new Product();
		p2.setProductID(rs.getInt("productID"));
		p2.setName(rs.getString("name"));
		p2.setImage(rs.getBytes("image"));
		p2.setPrice(rs.getDouble("price"));
		p2.setQty(rs.getInt("qty"));
		p1.add(p2);
	}
	 }
		 catch(SQLException e) {
			 e.printStackTrace();
	
		 }
	 return p1;
 }
}
