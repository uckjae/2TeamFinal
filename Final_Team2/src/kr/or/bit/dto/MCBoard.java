package kr.or.bit.dto;

public class MCBoard extends Board{
	private int mCidx;//MCIDX_SEQ
	private int likeNum;

	public MCBoard() {
	}

	public MCBoard(int mCidx, int bIdx, int likeNum) {
		super();
		this.mCidx = mCidx;
		this.likeNum = likeNum;
	}

	public int getmCidx() {
		return mCidx;
	}

	public void setmCidx(int mCidx) {
		this.mCidx = mCidx;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	@Override
	public String toString() {
		return "MCBoard [mCidx=" + mCidx + ", likeNum=" + likeNum + "]";
	}

	
}
