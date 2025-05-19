package pk.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import pk.model.Cart;
import pk.util.DBconnection;

public class CartC {
	public static boolean addCart(int customerId,int productId,int qty,double total) {
		boolean x=false;
	   
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBconnection.getConnection();
            String sql="INSERT INTO cart( customerID, productID, cqty, total)VALUES(?,?,?,?)";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, customerId);
            pstmt.setInt(2, productId);
            pstmt.setInt(3, qty);
            pstmt.setDouble(4, total);
            int rowslnserted =pstmt.executeUpdate();
            if(rowslnserted>0) {
            	x=true;
            }
        }
        catch(SQLException e){
        	e.printStackTrace();
        }finally {
        	try {
        	if(pstmt != null)pstmt.close();
        	if(con!= null)con.close();
        	}catch(SQLException e) {
        		e.printStackTrace();
        	}
        }
   	return x;
	}

	public static boolean removeCart( int cartId) {
		// TODO Auto-generated method stub
		boolean y=false;
		Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBconnection.getConnection();

        	String sql="DELETE FROM cart WHERE  cartID= ? ";
        	pstmt=con.prepareStatement(sql);
        
        	pstmt.setInt(1, cartId);
        	
        	 int rowslnserted =pstmt.executeUpdate();
             if(rowslnserted>0) {
             	y=true;
             }
         }
         catch(SQLException e){
         	e.printStackTrace();
         }finally {
         	try {
         	if(pstmt != null)pstmt.close();
         	if(con!= null)con.close();
         	}catch(SQLException e) {
         		e.printStackTrace();
         	}
         }
		return y;
	}
	public static ArrayList<Cart> getCartItem(int customerId){
		ArrayList<Cart> list=new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
		try {
            con = DBconnection.getConnection();
            String sql = "SELECT  ci.cartID, ci.productID, ci.cqty, ci.total, p.name, p.price, p.image, p.qty " + 
                    "FROM cart ci " + 
                    "JOIN product p ON ci.productID = p.productID " + 
                    "WHERE ci.customerID = ? ";

            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, customerId);
            rs=pstmt.executeQuery();
            
            while(rs.next()) {
            	Cart c=new Cart();
        			c.setCartID(rs.getInt("cartID"));
            		c.setProductID(rs.getInt("productID"));
            		c.setQty(rs.getInt("cqty")); 
            		c.setTotal(rs.getDouble("total"));
            		c.setProductName(rs.getString("name"));
            		c.setProductPrice(rs.getDouble("price"));
            		c.setProductimage(rs.getBytes("image"));
            		c.setProductQty(rs.getInt("qty"));
            		list.add(c);
            }
            
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return list;
	}

	public static boolean updateCart(int cartId,int qty,double total) {
		// TODO Auto-generated method stub
		boolean z=false;
		Connection con = null;
        PreparedStatement pstmt = null;
		
		try {																				                                                                        													
	        con = DBconnection.getConnection();
	       String sql="UPDATE cart SET cqty = ? ,total = ?"+" WHERE cartID = ?  ";
		pstmt=con.prepareStatement(sql);
		
		pstmt.setInt(1, qty);
		pstmt.setDouble(2, total);
		pstmt.setInt(3, cartId);
	
		
		
		
		 int rowslnserted =pstmt.executeUpdate();
         if(rowslnserted>0) {
         	z=true;
         }
     }
     catch(SQLException e){
     	e.printStackTrace();
     }finally {
     	try {
     	if(pstmt != null)pstmt.close();
     	if(con!= null)con.close();
     	}catch(SQLException e) {
     		e.printStackTrace();
     	}
     }
		return z;
	}

	public static boolean addOrder( int qty, Timestamp date, double total,String status, int cartId,int customerId) {
	    boolean o = false;
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        con = DBconnection.getConnection();
            String sql = "INSERT INTO `order` (qty, date, total, status, cartID, customerID) VALUES (?, ?, ?, ?, ?, ?)";

	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, qty);
	        pstmt.setTimestamp(2, date);
	        pstmt.setDouble(3, total);
	        pstmt.setString(4, status);
	        pstmt.setInt(5, cartId);
	        pstmt.setInt(6, customerId);
	        
	        int rowsInserted = pstmt.executeUpdate();
	        if(rowsInserted > 0) {
	            o = true;
	        }
	    }
	    catch(SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if(pstmt != null) pstmt.close();
	            if(con != null) con.close();
	        } catch(SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return o; 
	}
	
}
