package model;

public class salesVO {
	private String date;
	private int people;
	private int sum;
	public salesVO() {
	}
	public salesVO(String date, int people, int sum) {
		this.date = date;
		this.people = people;
		this.sum = sum;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
}