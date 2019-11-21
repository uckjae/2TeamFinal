package kr.or.bit.dto;

public class QnABoard {
	private int qIdx; //QIDX_SEQ
	private int bIdx;
	private boolean isPublic;
	
	public QnABoard() { }
	public QnABoard(int qIdx, int bIdx, boolean isPublic) {
		super();
		this.qIdx = qIdx;
		this.bIdx = bIdx;
		this.isPublic = isPublic;
	}
	
	public int getqIdx() {
		return qIdx;
	}
	
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	
	public int getbIdx() {
		return bIdx;
	}
	
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	
	public boolean isPublic() {
		return isPublic;
	}
	
	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}
}
