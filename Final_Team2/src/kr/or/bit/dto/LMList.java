package kr.or.bit.dto;

public class LMList {
	private int mcidx;
	private String id;
	private boolean isLike;

	public LMList() {
	}

	public LMList(int mcidx, String id, boolean isLike) {
		super();
		this.mcidx = mcidx;
		this.id = id;
		this.isLike = isLike;
	}

	public int getMcidx() {
		return mcidx;
	}

	public void setMcidx(int mcidx) {
		this.mcidx = mcidx;
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
		return "LMList [mcidx=" + mcidx + ", id=" + id + ", isLike=" + isLike + "]";
	}
}
