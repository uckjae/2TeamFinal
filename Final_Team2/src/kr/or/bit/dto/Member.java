package kr.or.bit.dto;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String bitth;
	private boolean gender;
	private String address;
	private String email;
	private boolean isKakao;
	private boolean isAdmin;

	public Member() { }

	public Member(String id, String pwd, String name, String bitth, boolean gender, String address, String email,
			boolean isKakao, boolean isAdmin) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.bitth = bitth;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.isKakao = isKakao;
		this.isAdmin = isAdmin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBitth() {
		return bitth;
	}

	public void setBitth(String bitth) {
		this.bitth = bitth;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isKakao() {
		return isKakao;
	}

	public void setKakao(boolean isKakao) {
		this.isKakao = isKakao;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", bitth=" + bitth + ", gender=" + gender
				+ ", address=" + address + ", email=" + email + ", isKakao=" + isKakao + ", isAdmin=" + isAdmin + "]";
	}
}
