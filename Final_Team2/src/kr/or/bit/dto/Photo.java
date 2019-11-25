package kr.or.bit.dto;

public class Photo{
	private int photoId;//PHTOID_SEQ
	private int bIdx;
	private String photoName;

	public Photo() {
	}

	public Photo(int photoId, int bIdx, String photoName) {
		super();
		this.photoId = photoId;
		this.bIdx = bIdx;
		this.photoName = photoName;
	}

	public int getPhotoId() {
		return photoId;
	}

	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	@Override
	public String toString() {
		return "Photo [photoId=" + photoId + ", bIdx=" + bIdx + ", photoName=" + photoName + "]";
	}
		
}
