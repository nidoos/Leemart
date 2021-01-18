package model;

import java.sql.Date;

public class StockVO {
	private String name;
	private String kind;
	private String b_num;
	private int count;
	private int price;
	private String lim_date;
	private String in_date;
	private String event;
	
	public StockVO() {
		
	}
	
	
	//제품리스트
	public StockVO(String name, String kind, String b_num, int count, int price, String in_date, String lim_date, String event) {
		this.name = name;
		this.kind = kind;
		this.b_num = b_num;
		this.count = count;
		this.price = price;
		this.lim_date = lim_date;
		this.in_date = in_date;
		this.event=event;
	}
	


	//추가
	public StockVO(String name, String kind, String b_num, int count, int price, String event, String lim_date) {
		this.name = name;
		this.kind = kind;
		this.b_num = b_num;
		this.count = count;
		this.price = price;
		this.event = event;
		this.lim_date= lim_date;
	}


	//유통기한
	public StockVO(String name, String kind, String b_num, int price, String lim_date) {
		super();
		this.name = name;
		this.kind = kind;
		this.b_num = b_num;
		this.price = price;
		this.lim_date = lim_date;
	}



	public StockVO(String name, String kind, String b_num, int count, int price) {
		this.b_num = b_num;
		this.kind = kind;
		this.count = count;
		this.price = price;
		this.name = name;
	}
	
	
	//가격변경
	public StockVO(int price,String name) {
		this.name=name;
		this.price=price;
	}
	

	public StockVO(String name, int count) {
		this.name = name;
		this.count = count;
	}

	
	
	//재고삭제
	public StockVO(String name) {
		this.name = name;
	}
	
	
	//App물품위치확인
	public StockVO(String name, String kind) {
		this.name = name;
		this.kind = kind;
	}


	public String getB_num() {
		return b_num;
	}

	public void setB_num(String b_num) {
		this.b_num = b_num;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getLim_date() {
		return lim_date;
	}


	public void setLim_date(String lim_date) {
		this.lim_date = lim_date;
	}



	public String getIn_date() {
		return in_date;
	}



	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}


	public String getEvent() {
		return event;
	}


	public void setEvent(String event) {
		this.event = event;
	}

	

	@Override
	public String toString() {
		return "StockVO [name=" + name + ", kind=" + kind + ", b_num=" + b_num + ", count=" + count + ", price=" + price
				+ ", lim_date=" + lim_date + ", in_date=" + in_date + ", event=" + event + "]";
	}


	
	
	

}
