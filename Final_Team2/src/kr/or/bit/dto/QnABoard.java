package kr.or.bit.dto;

import java.util.List;

public class QnABoard extends Board {
	private int qIdx; // QIDX_SEQ
	private int bIdx;
	private boolean isPublic;
	private List<Reply> replies;

	public QnABoard() {
	}

	public QnABoard(int qIdx, int bIdx, boolean isPublic, List<Reply> replies) {
		super();
		this.qIdx = qIdx;
		this.bIdx = bIdx;
		this.isPublic = isPublic;
		this.replies = replies;
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

	public List<Reply> getReplies() {
		return replies;
	}

	public void setReplies(List<Reply> replies) {
		this.replies = replies;
	}

}
