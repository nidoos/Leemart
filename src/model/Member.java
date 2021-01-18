package model;

public class Member {
	private String name;
	private int count;
	private int price;
	private int total;
	public Member() {
		super();
	}
	public Member(String name, int count, int price,int total) {
		super();
		this.name = name;
		this.count = count;
		this.price = price;
		this.total = total;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
	
}
