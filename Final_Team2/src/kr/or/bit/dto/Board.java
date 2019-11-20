package kr.or.bit.dto;

import java.util.Date;

public class Board {
	private int bindx;
	private String id;
	private String title;
	private String content;
	private Date wdate;
	private int rnum;
	private int bcode;

	public Board() { }

	public Board(int bindx, String id, String title, String content, Date wdate, int rnum, int bcode) {
		super();
		this.bindx = bindx;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.rnum = rnum;
		this.bcode = bcode;
	}

	public int getBindx() {
		return bindx;
	}

	public void setBindx(int bindx) {
		this.bindx = bindx;
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

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getBcode() {
		return bcode;
	}

	public void setBcode(int bcode) {
		this.bcode = bcode;
	}

	@Override
	public String toString() {
		return "Board [bindx=" + bindx + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", rnum=" + rnum + ", bcode=" + bcode + "]";
	}
}
