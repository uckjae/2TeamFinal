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

	public int getbIdx() {
		return bIdx;
	}

	public boolean isTop() {
		return isTop;
	}

	@Override
	public String toString() {
		return "NoticeBoard [nIdx=" + nIdx + ", bIdx=" + bIdx + ", isTop=" + isTop + "]";
	}
		
}
