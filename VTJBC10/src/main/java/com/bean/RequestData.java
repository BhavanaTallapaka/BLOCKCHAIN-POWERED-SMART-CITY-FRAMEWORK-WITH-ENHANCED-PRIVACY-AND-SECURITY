package com.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RequestData {
	
	private String Fid;
	private String fileNAme;
	private String uid;
	private String status;
	
	
	
	public RequestData() {
		super();
	}
	
	
	public RequestData(ResultSet rs) throws SQLException {
		super();
		//Fid = this.fid;
		this.Fid=rs.getString(1);
		this.fileNAme = rs.getString(2);
		this.uid = rs.getString(3);
		this.status = rs.getString(4);
	}


	public String getFid() {
		return Fid;
	}
	public void setFid(String fid) {
		Fid = fid;
	}
	public String getFileNAme() {
		return fileNAme;
	}
	public void setFileNAme(String fileNAme) {
		this.fileNAme = fileNAme;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
