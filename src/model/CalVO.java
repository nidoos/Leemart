package model;

public class CalVO {
	private String name;
	private int count;
	private int price;
	private String r_num;
	private String kind;
	private String b_num;
	private String event;
	private int total;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public CalVO() {
		
	}

	public CalVO(String r_num) {
		this.r_num = r_num;
	}

	public CalVO(String name, int count, int price,int total) {
		this.name = name;
		this.count = count;
		this.price = price;
		this.total = total;
	}
	public CalVO(String name, int count, int price) {
		this.name = name;
		this.count = count;
		this.price = price;
		this.total=0;
	}
	
	

	
	public CalVO(String name, int price, String r_num, String kind) {
		this.name = name;
		this.price = price;
		this.r_num = r_num;
		this.kind = kind;
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


	public String getR_num() {
		return r_num;
	}


	public void setR_num(String r_num) {
		this.r_num = r_num;
	}



	public String getKind() {
		return kind;
	}



	public void setKind(String kind) {
		this.kind = kind;
	}



	public String getB_num() {
		return b_num;
	}



	public void setB_num(String b_num) {
		this.b_num = b_num;
	}



	public String getEvent() {
		return event;
	}



	public void setEvent(String event) {
		this.event = event;
	}

	@Override
	public String toString() {
		return "CalVO [name=" + name + ", count=" + count + ", price=" + price + ", r_num=" + r_num + ", kind=" + kind
				+ ", b_num=" + b_num + ", event=" + event + ", total=" + total + "]";
	}
	
}
