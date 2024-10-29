package DTO;

public class SalesDTO {
	private int custno;
	private String custname;
	private char grade;
	private int totalPrice;

	public SalesDTO() {
	}

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public char getGrade() {
		return grade;
	}

	public void setGrade(char grade) {
		this.grade = grade;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public SalesDTO(int custno, String custname, char grade, int totalPrice) {
		super();
		this.custno = custno;
		this.custname = custname;
		this.grade = grade;
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "SalesDTO [custno=" + custno + ", custname=" + custname + ", grade=" + grade + ", totalPrice="
				+ totalPrice + "]";
	}

}
