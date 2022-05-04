package com.webcoder.web.jdbc;

public class CoursesOwned extends Product {
	private int oid;
	private int uid;
	private int cid;
	private boolean owned_check;
	
	public CoursesOwned() {}
	
	public CoursesOwned(int oid,int uid, int cid, boolean owned_check) {
		this.oid = oid;
		this.uid = uid;
		this.cid = cid;
		this.owned_check = owned_check;
	}
	
	public CoursesOwned(int uid, int cid, boolean owned_check) {
		this.uid = uid;
		this.cid = cid;
		this.owned_check = owned_check;
	}

	public int getUOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
	
	public boolean getOwned_check() {
		return owned_check;
	}

	public void setOwned_check(boolean owned_check) {
		this.owned_check = owned_check;
	}

	@Override
	public String toString() {
		return "CoursesOwned [oid=\" + oid + \", uid=" + uid + ", cid=" + cid + ", owned_check=" + owned_check + "]";
	}
	
	
}
