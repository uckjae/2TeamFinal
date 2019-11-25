package kr.or.bit.dto;

import java.util.List;

public class FreeBoard extends Board {
	private int fIdx;//FIDX_SEQ
	private int bIdx;
	private int refer;
	private int depth;
	private int step;
	private List<Reply> replies;

	public FreeBoard() {}
	
	public FreeBoard(int fIdx, int bIdx, int refer, int depth, int step) {
		super();
		this.fIdx = fIdx;
		this.bIdx = bIdx;
		this.refer = refer;
		this.depth = depth;
		this.step = step;
	}

	public List<Reply> getReplies() {
		return replies;
	}

	public void setReplies(List<Reply> replies) {
		this.replies = replies;
	}

	public int getfIdx() {
		return fIdx;
	}

	public void setfIdx(int fIdx) {
		this.fIdx = fIdx;
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
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
		return "FreeBoard [fIdx=" + fIdx + ", bIdx=" + bIdx + ", refer=" + refer + ", depth=" + depth + ", step=" + step
				+ "]";
	}

	
}
