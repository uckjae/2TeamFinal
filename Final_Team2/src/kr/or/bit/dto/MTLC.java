package kr.or.bit.dto;

import java.util.Date;

public class MTLC {
	private int tlcidx;
	private int tlidx;
	private String spotname;
	private String image;
	private Date spotdate;
	private String spotaddr;
	private String spotlink;

	public MTLC() {
	}

	public MTLC(int tlcidx, int tlidx, String spotname, String image, Date spotdate, String spotaddr, String spotlink) {
		super();
		this.tlcidx = tlcidx;
		this.tlidx = tlidx;
		this.spotname = spotname;
		this.image = image;
		this.spotdate = spotdate;
		this.spotaddr = spotaddr;
		this.spotlink = spotlink;
	}

	public int getTlcidx() {
		return tlcidx;
	}

	public void setTlcidx(int tlcidx) {
		this.tlcidx = tlcidx;
	}

	public int getTlidx() {
		return tlidx;
	}

	public void setTlidx(int tlidx) {
		this.tlidx = tlidx;
	}

	public String getSpotname() {
		return spotname;
	}

	public void setSpotname(String spotname) {
		this.spotname = spotname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getSpotdate() {
		return spotdate;
	}

	public void setSpotdate(Date spotdate) {
		this.spotdate = spotdate;
	}

	public String getSpotaddr() {
		return spotaddr;
	}

	public void setSpotaddr(String spotaddr) {
		this.spotaddr = spotaddr;
	}

	public String getSpotlink() {
		return spotlink;
	}

	public void setSpotlink(String spotlink) {
		this.spotlink = spotlink;
	}

	@Override
	public String toString() {
		return "MTLC [tlcidx=" + tlcidx + ", tlidx=" + tlidx + ", spotname=" + spotname + ", image=" + image
				+ ", spotdate=" + spotdate + ", spotaddr=" + spotaddr + ", spotlink=" + spotlink + "]";
	}

}
