package kr.or.bit.dto;

import java.util.Date;

public class MTLContent {
	private int tLCidx;//TLCIDX_SEQ
	private int tLidx;
	private String spotName;
	private String image;
	private Date spotDate;
	private String spotAddr;
	private String spotLink;

	public MTLContent() {
	}

	public MTLContent(int tLCidx, int tLidx, String spotName, String image, Date spotDate, String spotAddr,
			String spotLink) {
		super();
		this.tLCidx = tLCidx;
		this.tLidx = tLidx;
		this.spotName = spotName;
		this.image = image;
		this.spotDate = spotDate;
		this.spotAddr = spotAddr;
		this.spotLink = spotLink;
	}

	public int gettLCidx() {
		return tLCidx;
	}

	public void settLCidx(int tLCidx) {
		this.tLCidx = tLCidx;
	}

	public int gettLidx() {
		return tLidx;
	}

	public void settLidx(int tLidx) {
		this.tLidx = tLidx;
	}

	public String getSpotName() {
		return spotName;
	}

	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getSpotDate() {
		return spotDate;
	}

	public void setSpotDate(Date spotDate) {
		this.spotDate = spotDate;
	}

	public String getSpotAddr() {
		return spotAddr;
	}

	public void setSpotAddr(String spotAddr) {
		this.spotAddr = spotAddr;
	}

	public String getSpotLink() {
		return spotLink;
	}

	public void setSpotLink(String spotLink) {
		this.spotLink = spotLink;
	}

	@Override
	public String toString() {
		return "MTLContent [tLCidx=" + tLCidx + ", tLidx=" + tLidx + ", spotName=" + spotName + ", image=" + image
				+ ", spotDate=" + spotDate + ", spotAddr=" + spotAddr + ", spotLink=" + spotLink + "]";
	}

	
}
