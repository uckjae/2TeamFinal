package kr.or.bit.dto;

import java.util.ArrayList;

public class MCBoard extends Board{
	private int mCidx;//MCIDX_SEQ
	private int likeNum;
	private ArrayList<String> contentsList;
	private ArrayList<Photo> photoList;
	public MCBoard() {
	}
	public MCBoard(int mCidx, int likeNum, ArrayList<String> contentsList,ArrayList<Photo> photoList ) {
		super();
		this.mCidx = mCidx;
		this.likeNum = likeNum;
		this.contentsList = contentsList;
		this.photoList = photoList;
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
	public ArrayList<String> getContents() {
		return contentsList;
	}
	public void setContentsList(ArrayList<String> contentsList) {
		this.contentsList = contentsList;
	}
	public ArrayList<Photo> getPhotoList(){
		return photoList;
	}
	public void setPhotoList(ArrayList<Photo> photoList) {
		this.photoList = photoList;
	}
	@Override
	public String toString() {
		return "MCBoard [mCidx=" + mCidx + ", likeNum=" + likeNum + ", contents=" + contentsList + ", photoList=" + photoList + "]";
	}

	

	
}
