package kr.or.bit.dto;

import java.util.Date;

public class Reply {
	private int rIdx;
	private int bIdx;
	private String rContent;
	private String id;
	private Date rWDate;

	public Reply() {
	}

	public Reply(int rIdx, int bIdx, String rContent, String id, Date rWDate) {
		super();
		this.rIdx = rIdx;
		this.bIdx = bIdx;
		this.rContent = rContent;
		this.id = id;
		this.rWDate = rWDate;
	}

	public int getrIdx() {
		return rIdx;
	}

	public void setrIdx(int rIdx) {
		this.rIdx = rIdx;
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getrWDate() {
		return rWDate;
	}

	public void setrWDate(Date rWDate) {
		this.rWDate = rWDate;
	}

	@Override
	public String toString() {
		return "Reply [rIdx=" + rIdx + ", bIdx=" + bIdx + ", rContent=" + rContent + ", id=" + id + ", rWDate=" + rWDate
				+ "]";
	}
		
}
