package kr.or.bit.dto;

public class FreeBoard extends Board {
	private int fidx;
	private int bidx;
	private int refer;
	private int depth;
	private int step;

	public FreeBoard() {
	}

	public FreeBoard(int fidx, int bidx, int refer, int depth, int step) {
		super();
		this.fidx = fidx;
		this.bidx = bidx;
		this.refer = refer;
		this.depth = depth;
		this.step = step;
	}

	public int getFidx() {
		return fidx;
	}

	public void setFidx(int fidx) {
		this.fidx = fidx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public int getRefer() {
		return refer;
	}

	public void setRefer(int refer) {
		this.refer = refer;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	@Override
	public String toString() {
		return "FreeBoard [fidx=" + fidx + ", bidx=" + bidx + ", refer=" + refer + ", depth=" + depth + ", step=" + step
				+ "]";
	}
}
