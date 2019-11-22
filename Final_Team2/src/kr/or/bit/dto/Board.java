package kr.or.bit.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Board {
	private int bIdx;//BIDX_SEQ
	private String id;
	private String title;
	private String content;
	private Date wDate;
	private int rNum;
	private int bCode;

	public Board() { }

	public Board(int bIdx, String id, String title, String content, Date wDate, int rNum, int bCode) {
		super();
		this.bIdx = bIdx;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wDate = wDate;
		this.rNum = rNum;
		this.bCode = bCode;
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
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
		return "Board [bIdx=" + bIdx + ", id=" + id + ", title=" + title + ", content=" + content + ", wDate=" + wDate
				+ ", rNum=" + rNum + ", bCode=" + bCode + "]";
	}

	
}
