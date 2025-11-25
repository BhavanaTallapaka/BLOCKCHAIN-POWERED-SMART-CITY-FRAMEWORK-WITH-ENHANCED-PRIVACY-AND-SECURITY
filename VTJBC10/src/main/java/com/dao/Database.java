package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.RequestData;

public class Database {

	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcities","root","root");
		return con;
	}
	
	public static int node1(String fid,String id,String data1, String enc) throws ClassNotFoundException, SQLException {

		Connection conn = Database.getConnection();
		String sql = "insert into node1 values(?,?,?,?)";

		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, fid);
		ps.setString(2, id);
		ps.setString(3, data1);
		ps.setString(4, enc);
		int i = ps.executeUpdate();
		return i;

	}public static int sendrequest(String fid,String fname,String oid) throws ClassNotFoundException, SQLException {

		Connection conn = Database.getConnection();
		String sql = "insert into searchdata values(?,?,?,?)";

		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, fid);
		ps.setString(2, fname);
		ps.setString(3, oid);
		ps.setString(4, "pending");
		

		int rs=ps.executeUpdate();
		return rs;

	}
	public static int node2(String fid,String id,String data1, String enc) throws ClassNotFoundException, SQLException {

		Connection conn = Database.getConnection();
		String sql = "insert into node2 values(?,?,?,?)";

		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, fid);
		ps.setString(2, id);
		ps.setString(3, data1);
		ps.setString(4,enc);
		int i = ps.executeUpdate();
		return i;

	}
	
	public static List<RequestData> keyView(String uid) throws ClassNotFoundException, SQLException {
		Connection conn = Database.getConnection();
		
		List<RequestData> it=new ArrayList<RequestData>();
		String sql = "select * from searchdata where uid='"+uid+"'";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			RequestData us=new RequestData(rs);
			it.add(us);
		}
		return it;
		
	}
	
	public static boolean getData(String sql) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		boolean b = false;
		Connection con = Database.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			b = rs.next();
			rs.close();
			ps.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
}
