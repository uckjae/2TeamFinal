package kr.or.bit.dto;

public class MCBoard {
	private int mCidx;//MCIDX_SEQ
	private int bIdx;
	private int likeNum;

	public MCBoard() {
	}

	public MCBoard(int mCidx, int bIdx, int likeNum) {
		super();
		this.mCidx = mCidx;
		this.bIdx = bIdx;
		this.likeNum = likeNum;
	}

	public int getmCidx() {
		return mCidx;
	}

	public void setmCidx(int mCidx) {
		this.mCidx = mCidx;
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	@Override
	public String toString() {
		return "MCBoard [mCidx=" + mCidx + ", bIdx=" + bIdx + ", likeNum=" + likeNum + "]";
	}

	
}
