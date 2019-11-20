package kr.or.bit.dto;

public class NoticeBoard extends Board {
	private int nidx;
	private int bidx;
	private boolean isStop;

	public NoticeBoard() {
	}

	public NoticeBoard(int nidx, int bidx, boolean isStop) {
		super();
		this.nidx = nidx;
		this.bidx = bidx;
		this.isStop = isStop;
	}

	public int getNidx() {
		return nidx;
	}

	public void setNidx(int nidx) {
		this.nidx = nidx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public boolean isStop() {
		return isStop;
	}

	public void setStop(boolean isStop) {
		this.isStop = isStop;
	}

	@Override
	public String toString() {
		return "NoticeBoard [nidx=" + nidx + ", bidx=" + bidx + ", isStop=" + isStop + "]";
	}

}
