package kr.or.bit.dto;

public class Photo {
	private int photoid;
	private int bidx;
	private String photoname;

	public Photo() {
	}

	public Photo(int photoid, int bidx, String photoname) {
		super();
		this.photoid = photoid;
		this.bidx = bidx;
		this.photoname = photoname;
	}

	public int getPhotoid() {
		return photoid;
	}

	public void setPhotoid(int photoid) {
		this.photoid = photoid;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public String getPhotoname() {
		return photoname;
	}

	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}

	@Override
	public String toString() {
		return "Photo [photoid=" + photoid + ", bidx=" + bidx + ", photoname=" + photoname + "]";
	}

}
