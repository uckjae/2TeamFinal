package kr.or.bit.dto;

public class NoticeBoard extends Board {
	private int nIdx;//NIDX_SEQ
	private int bIdx;
	private boolean isTop;

	public NoticeBoard() {
	}

	public NoticeBoard(int nIdx, int bIdx, boolean isTop) {
		super();
		this.nIdx = nIdx;
		this.bIdx = bIdx;
		this.isTop = isTop;
	}

	

	public int getnIdx() {
		return nIdx;
	}

	public void setnIdx(int nIdx) {
		this.nIdx = nIdx;
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}

	public boolean getIsTop() {
		return isTop;
	}

	public void setTop(boolean isTop) {
		this.isTop = isTop;
	}

	@Override
	public String toString() {
		return "NoticeBoard [nIdx=" + nIdx + ", bIdx=" + bIdx + ", isTop=" + isTop + "]";
	}
		
}
