package kr.or.bit.dto;

import java.util.Date;

public class Board {
	private int bIndx;
	private String id;
	private String title;
	private String content;
	private Date wDate;
	private int rNum;
	private int bCode;

	public Board() { }

	public Board(int bindx, String id, String title, String content, Date wDate, int rNum, int bCode) {
		super();
		this.bIndx = bindx;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wDate = wDate;
		this.rNum = rNum;
		this.bCode = bCode;
	}

	public int getbIndx() {
		return bIndx;
	}

	public void setbIndx(int bIndx) {
		this.bIndx = bIndx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getwDate() {
		return wDate;
	}

	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getbCode() {
		return bCode;
	}

	public void setbCode(int bCode) {
		this.bCode = bCode;
	}

	@Override
	public String toString() {
		return "Board [bIndx=" + bIndx + ", id=" + id + ", title=" + title + ", content=" + content + ", wDate=" + wDate
				+ ", rNum=" + rNum + ", bCode=" + bCode + "]";
	}

	
}
