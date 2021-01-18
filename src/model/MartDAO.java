package model;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import com.google.gson.Gson;

public class MartDAO {
	Connection conn=null;
	PreparedStatement psmt=null;
	ResultSet rs=null;
	String adr=null;
	String pass=null;
	int cnt=0;
	CalVO cal = new CalVO();
	
	
	static {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void conn() {
		try {
			String db_url = "jdbc:oracle:thin:@loCalhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<CalVO> cal(String r_num) {	//��ǰ���ݴ���(��ٱ���)
		conn();
		List<CalVO> list=new ArrayList<CalVO>();

		try {
			String sql = "select *from Calculate where r_num=?";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, r_num);
			rs=psmt.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				int price = rs.getInt("price");
				int count = rs.getInt("count");
				int total = rs.getInt("total");
				list.add(new CalVO(name,count,price,total));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	
	
	public int up_s(StockVO vo) {	//��ǰ����
		conn();
		try {
			String sql = "update stock set count=?, price=?, event=? where B_NUM=?";
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, vo.getCount());
			psmt.setInt(2, vo.getPrice());
			psmt.setString(3, vo.getEvent());
			psmt.setString(4, vo.getB_num());
			cnt=psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	
	
	public int del_s(String b_num) {	//��ǰ����
		conn();
		try {
			String sql = "delete from stock where b_num=?";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, b_num);
			cnt=psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public StockVO list(String num) {
		conn();
		StockVO vo =null;
		try {
			String sql = "select*from stock where b_num=?";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				String name= rs.getString("name");
				String kind = rs.getString("kind");
				int count = rs.getInt("count");
				int price = rs.getInt("price");
				String in_date = rs.getString("in_date");
				String lim_date = rs.getString("lim_date");
				String event = rs.getString("event");
				
				vo = new StockVO(name, kind, num, count, price, in_date, lim_date, event);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return vo;
		
	}
	
	public int ins_s(StockVO vo) {	//������� �ʿ��� ��ǰ �߰�
		conn();
		try {
			String sql = "insert into stock values(?,?,?,?,?,to_char(sysdate,'YYYY-MM-DD'),?,?)";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getKind());
			psmt.setString(3, vo.getB_num());
			psmt.setInt(4, vo.getCount());
			psmt.setInt(5, vo.getPrice());
			psmt.setString(6, vo.getLim_date());
			psmt.setString(7, vo.getEvent());
			
			cnt=psmt.executeUpdate();
		
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public int ins_f(StockVO vo) {	//������� �ʿ���� ��ǰ �߰�
		conn();
		try {
			String sql = "insert into stock values(?,?,?,?,?,to_char(sysdate,'YYYY-MM-DD'),to_char(sysdate+(INTERVAL '10' YEAR),'YYYY-MM-DD'),?)";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getKind());
			psmt.setString(3, vo.getB_num());
			psmt.setInt(4, vo.getCount());
			psmt.setInt(5, vo.getPrice());
			psmt.setString(6, vo.getEvent());
			cnt=psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}	
	
	public int up_p(StockVO vo) {	//���ݺ���
		conn();
		try {
			String sql = "update stock set price=? where name=?";
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, vo.getPrice());
			psmt.setString(2,vo.getName());
			
			cnt=psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	public List<StockVO> getAllList() {	//��ǰ ��ü ��ǰ����Ʈ
		conn();
		List<StockVO> list=new ArrayList<StockVO>();
		try {
			String sql = "select name, kind, b_num, count, price,to_char(in_date,'YYYY-MM-DD'),to_char(lim_date,'YYYY-MM-DD'),event from stock order by lim_date";
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				String kind = rs.getString("kind");
				String b_num = rs.getString("b_num");
				int count = rs.getInt("count");
				int price = rs.getInt("price");
				String in_date = rs.getString("to_char(in_date,'YYYY-MM-DD')");
				String lim_date = rs.getString("to_char(lim_date,'YYYY-MM-DD')");
				String event = rs.getString("event");
				if(count <0) {
					count = 0;
				}
				else if(name.equals("Exit")) {
					continue;
				}
				StockVO vo = new StockVO(name, kind, b_num, count, price, in_date, lim_date, event);
				list.add(vo);
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	//App ��ǰ��ġ Ȯ��
	public StockVO place(StockVO vo) {
		conn();
		try {
			String sql = "select * from stock where name=?";
			psmt= conn.prepareStatement(sql);
			psmt.setString(1, vo.getName());
			rs=psmt.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				String kind = rs.getString("kind");
				vo = new StockVO(name, kind);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public boolean use_rf(String rfid) {
		conn();
		boolean use=false;
		try {
			String sql = "select use from rfid where r_num=?";
			psmt= conn.prepareStatement(sql);
			psmt.setString(1, rfid);
			rs=psmt.executeQuery();
			if(rs.next()) {
				int using = rs.getInt("use");
				if(using == 1) {
					use = true;
				}else {
					use = false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return use;
	}
	
	
	public String allSelect(String rfid) { //��ǰ �˻� ��, �ֹ� ��ǰ Ȯ��
		conn();
		Gson gson = new Gson();
		ArrayList<Member> all = new ArrayList<Member>();
		String sql = "select * from Calculate where r_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, rfid);
			rs = psmt.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				int count = rs.getInt("count");
				int price = rs.getInt("price");
				int total = rs.getInt("total");
				all.add(new Member(name, count,price,total));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String json = gson.toJson(all);
		return json;
	}
	
	public CalVO selStock(String b_num,String r_num) { //��ǰ ���� �˻�
		conn();
		String sql = "select * from stock where b_num= ?"; //��ǰ �˻�
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, b_num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				cal.setKind(rs.getString("kind"));
				cal.setName(rs.getString("name"));
				cal.setPrice(rs.getInt("price"));
				cal.setCount(1);
				cal.setR_num(r_num);
				cal.setB_num(b_num);
				cal.setEvent(rs.getString("event"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cal;
	}
	public boolean insObj(String b_num) {
		boolean t = false;
		conn();
		System.out.println(b_num);
		System.out.println(b_num.length());
		String sql = "insert into stock values('test2','fruit',?,15,2500,sysdate,sysdate+8,NULL)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, b_num);
			System.out.print((b_num));
			int cnt = psmt.executeUpdate();
			if(cnt>0) {
				t = true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	public boolean searCal(CalVO Cal) { // ������Ʈ���� �μ�Ʈ���� Ȯ�ο� �޼���
		conn();
		boolean result = false;
		String sql = "select * from Calculate where r_num = ? and name = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,Cal.getR_num());
			psmt.setString(2,Cal.getName());
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	public int incal(CalVO Cal) { // Cal�� ������ �Է�(��ٱ���)
		conn();
		String sql = "insert into Calculate values(?,?,?,?,?)";
		int result = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,Cal.getName());
			psmt.setInt(2,Cal.getPrice());
			psmt.setInt(3,Cal.getCount());
			psmt.setInt(4,Cal.getTotal());
			psmt.setString(5,Cal.getR_num());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public int upcal(CalVO Cal,int cnt) { //���� ��ǰ ���ڵ� �νĽ�( cnt�� ��ǰ Ȥ�� �߰��� Servlet���� ó��)  
		conn();
		String sql = "update Calculate set count=count+?, total = total+? where name=?";
		int result =0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cnt);
			psmt.setInt(2, Cal.getTotal());
			psmt.setString(3, Cal.getName());
			result = psmt.executeUpdate();
			String sql2 = "update Calculate set count=0 where count<0";
			psmt = conn.prepareStatement(sql2);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public int down_s(CalVO vo) {
		conn();
		//�̸�, ����, upd
		try {
			String sql = "update stock set count = count-?  where name =?";
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, vo.getCount());
			psmt.setString(2, vo.getName());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
		
	}
	
	public int up_rfid(String r_num) {
		conn();
		cnt = -1;
		try {
			String sql = "update rfid set use=0 where r_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, r_num);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}
	public boolean saleday() {
		conn();
		boolean cnt = false;
		String sql = "select * from sales where Sdate = to_char(sysdate,'YYYY-MM-DD')";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				cnt = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int up_sal(int total) {
		conn();
		String sql = "update sales set people = people+1, sum = sum+?";
		int cnt=0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, total);
			cnt = psmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close();
	}
		return cnt;
	}
	
	public int in_sal(int total) {
		conn();
		String sql = "insert into sales values(to_char(sysdate,'YYYY-MM-DD'),1,?)";
		int cnt=0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, total);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		close();
		}
		return cnt;
	}
	public int del_c(String rfid) {	//��ǰ����
		conn();
		int cnt = 0;
		try {
			String sql = "delete from calculate where r_num=?";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, rfid);
			cnt=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public List<salesVO> getSales(){ 
		conn();
		List<salesVO> list = new ArrayList<>();
		String sql = "select * from sales where sdate >=sysdate-7";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				String date = rs.getDate("Sdate").toString();
				System.out.println(date);
				String day = date.split("-")[1]+date.split("-")[2];
				System.out.println(day);
				int people = rs.getInt("people");
				int sum = rs.getInt("sum");
				list.add(new salesVO(day,people,sum));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	
	
	public boolean sel_rfid(String r_num) {
		conn();
		boolean res = false;
		try {
			System.out.println(r_num);
			String sql = "select * from rfid where r_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, r_num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				int ad = rs.getInt("admin");
				int us = rs.getInt("use");
				if(ad != 1 && us !=1) {
					res = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	public int upd_rfid(String r_num) {
		conn();
		cnt = 0;
		try {
			String sql = "update rfid set use=1 where r_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, r_num);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}

	
}
