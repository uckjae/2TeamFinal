package kr.or.bit.dto;

public class MTL {
	private int tlidx;
	private String id;
	private String tlname;

	public MTL() { }

	public MTL(int tlidx, String id, String tlname) {
		super();
		this.tlidx = tlidx;
		this.id = id;
		this.tlname = tlname;
	}

	public int getTlidx() {
		return tlidx;
	}

	public void setTlidx(int tlidx) {
		this.tlidx = tlidx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTlname() {
		return tlname;
	}

	public void setTlname(String tlname) {
		this.tlname = tlname;
	}

	@Override
	public String toString() {
		return "MTL [tlidx=" + tlidx + ", id=" + id + ", tlname=" + tlname + "]";
	}

}
