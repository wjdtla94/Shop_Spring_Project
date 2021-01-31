package com.spring.model;

import java.sql.Timestamp;

public class ReplyVO {
	private int repNum;
	private int gdsNum;
	private String userId;
	private String repCon;
	private Timestamp repDate;
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRepCon() {
		return repCon;
	}
	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}
	public Timestamp getRepDate() {
		return repDate;
	}
	public void setRepDate(Timestamp repDate) {
		this.repDate = repDate;
	}
	
	
	

}
