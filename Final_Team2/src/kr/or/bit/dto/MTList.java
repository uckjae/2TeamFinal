package kr.or.bit.dto;

public class MTList {
	private int tLidx;
	private String id;
	private String tLName;

	public MTList() { }

	public MTList(int tLidx, String id, String tLName) {
		super();
		this.tLidx = tLidx;
		this.id = id;
		this.tLName = tLName;
	}

	public int gettLidx() {
		return tLidx;
	}

	public void settLidx(int tLidx) {
		this.tLidx = tLidx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String gettLName() {
		return tLName;
	}

	public void settLName(String tLName) {
		this.tLName = tLName;
	}

	@Override
	public String toString() {
		return "MTList [tLidx=" + tLidx + ", id=" + id + ", tLName=" + tLName + "]";
	}

}
