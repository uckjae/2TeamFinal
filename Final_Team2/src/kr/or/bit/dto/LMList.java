package kr.or.bit.dto;

public class LMList {
	private int mCIdx;
	private String id;
	private boolean isLike;

	public LMList() {
	}
		
	public LMList(int mCIdx, String id, boolean isLike) {
		super();
		this.mCIdx = mCIdx;
		this.id = id;
		this.isLike = isLike;
	}

	public int getmCIdx() {
		return mCIdx;
	}

	public void setmCIdx(int mCIdx) {
		this.mCIdx = mCIdx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

	@Override
	public String toString() {
		return "LMList [mCIdx=" + mCIdx + ", id=" + id + ", isLike=" + isLike + "]";
	}

	
	
}
