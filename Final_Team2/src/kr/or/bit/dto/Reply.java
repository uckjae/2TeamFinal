package kr.or.bit.dto;

import java.util.Date;

public class Reply {
	private int ridx;
	private int bidx;
	private String rcontent;
	private String id;
	private Date rwdate;

	public Reply() {
	}

	public Reply(int ridx, int bidx, String rcontent, String id, Date rwdate) {
		super();
		this.ridx = ridx;
		this.bidx = bidx;
		this.rcontent = rcontent;
		this.id = id;
		this.rwdate = rwdate;
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getRwdate() {
		return rwdate;
	}

	public void setRwdate(Date rwdate) {
		this.rwdate = rwdate;
	}

	@Override
	public String toString() {
		return "Reply [ridx=" + ridx + ", bidx=" + bidx + ", rcontent=" + rcontent + ", id=" + id + ", rwdate=" + rwdate
				+ "]";
	}

}
