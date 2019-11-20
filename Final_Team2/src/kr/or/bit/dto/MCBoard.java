package kr.or.bit.dto;

public class MCBoard {
	private int mcidx;
	private int bidx;
	private int likenum;

	public MCBoard() {
	}

	public MCBoard(int mcidx, int bidx, int likenum) {
		super();
		this.mcidx = mcidx;
		this.bidx = bidx;
		this.likenum = likenum;
	}

	public int getMcidx() {
		return mcidx;
	}

	public void setMcidx(int mcidx) {
		this.mcidx = mcidx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public int getLikenum() {
		return likenum;
	}

	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}

	@Override
	public String toString() {
		return "MCBoard [mcidx=" + mcidx + ", bidx=" + bidx + ", likenum=" + likenum + "]";
	}
}
