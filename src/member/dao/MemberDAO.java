package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public class MemberDAO {
	private DataSource ds;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private static MemberDAO instance;

	public static MemberDAO getInstance() {
		if (instance == null) {
			synchronized (MemberDAO.class) {
				instance = new MemberDAO();
			}
		}
		return instance;
	}

	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			// tomcat의 경우 앞에 java:comp/env/를 붙여야함.
			// jdbc/oracle 이름으로 되어있는 값을 꺼내서 ds에 넣어줌.
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	//	public void getConnection() {
	//		try {
	//			conn = DriverManager.getConnection(url, user, password);
	//		} catch (SQLException e) {
	//			e.printStackTrace();
	//		}
	//	}

	public void disconnect(boolean isSelect) {
		try {
			if (isSelect) {
				if (rs != null)
					rs.close();
			}
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean isExistId(String id) {
		boolean result = false;
		String sql = "SELECT * FROM servlet_member WHERE ID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect(true);
		}
		return result;
	}

	public MemberDTO login(String id, String pwd) {
		MemberDTO memberDTO = new MemberDTO();
		String sql = "SELECT * FROM servlet_member WHERE ID = ? AND PWD = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				memberDTO.setName(rs.getString("name"));
				memberDTO.setId(rs.getString("id"));
				memberDTO.setGender(rs.getString("gender"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setZipcode(rs.getString("zipcode"));
				memberDTO.setAddr1(rs.getString("addr1"));
				memberDTO.setAddr2(rs.getString("addr2"));
				memberDTO.setLogtime(rs.getString("logtime"));
			} else {
				memberDTO = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			memberDTO = null;
		} finally {
			disconnect(true);
		}

		return memberDTO;
	}

	public MemberDTO login(String id) {
		MemberDTO memberDTO = new MemberDTO();
		String sql = "SELECT * FROM servlet_member WHERE ID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberDTO.setName(rs.getString("name"));
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwd(rs.getString("pwd"));
				memberDTO.setGender(rs.getString("gender"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setZipcode(rs.getString("zipcode"));
				memberDTO.setAddr1(rs.getString("addr1"));
				memberDTO.setAddr2(rs.getString("addr2"));
				memberDTO.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect(true);
		}
		return memberDTO;
	}

	public int insert(MemberDTO memberDTO) {
		String sql = "INSERT INTO servlet_member VALUES(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		int cnt = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getId());
			pstmt.setString(3, memberDTO.getPwd());
			pstmt.setString(4, memberDTO.getGender());
			pstmt.setString(5, memberDTO.getEmail1());
			pstmt.setString(6, memberDTO.getEmail2());
			pstmt.setString(7, memberDTO.getTel1());
			pstmt.setString(8, memberDTO.getTel2());
			pstmt.setString(9, memberDTO.getTel3());
			pstmt.setString(10, memberDTO.getZipcode());
			pstmt.setString(11, memberDTO.getAddr1());
			pstmt.setString(12, memberDTO.getAddr2());

			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect(false);
		}
		return cnt;
	}

	public ArrayList<ZipcodeDTO> getZipcodeList(String sido, String sigungu, String roadname) {
		ArrayList<ZipcodeDTO> list = new ArrayList<ZipcodeDTO>();
		ZipcodeDTO zipcodeDTO = null;
		String sql = "SELECT * FROM newzipcode WHERE sido like '%' || ? || '%' AND nvl(sigungu, '0') like '%' || ? ||'%' AND roadname like '%' || ? ||'%'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sido);
			pstmt.setString(2, sigungu);
			pstmt.setString(3, roadname);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				zipcodeDTO = new ZipcodeDTO();
				zipcodeDTO.setZipcode(rs.getString("zipcode"));
				zipcodeDTO.setSido(rs.getString("sido"));
				zipcodeDTO.setSigungu(rs.getString("sigungu"));
				zipcodeDTO.setYubmyundong(rs.getString("yubmyundong"));
				zipcodeDTO.setRi(rs.getString("ri"));
				zipcodeDTO.setRoadname(rs.getString("roadname"));
				zipcodeDTO.setBuildingname(rs.getString("buildingname"));

				list.add(zipcodeDTO);
			}
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		} finally {
			disconnect(true);
		}
		return list;
	}

	public int modify(MemberDTO memberDTO) {
		int result = 0;
		String sql = "UPDATE servlet_member SET name=?, pwd=?, gender=?, email1=?, email2=?, tel1=?, tel2=?, tel3=?, zipcode=?, addr1=?, addr2=?, logtime=sysdate WHERE id = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getPwd());
			pstmt.setString(3, memberDTO.getGender());
			pstmt.setString(4, memberDTO.getEmail1());
			pstmt.setString(5, memberDTO.getEmail2());
			pstmt.setString(6, memberDTO.getTel1());
			pstmt.setString(7, memberDTO.getTel2());
			pstmt.setString(8, memberDTO.getTel3());
			pstmt.setString(9, memberDTO.getZipcode());
			pstmt.setString(10, memberDTO.getAddr1());
			pstmt.setString(11, memberDTO.getAddr2());
			pstmt.setString(12, memberDTO.getId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect(false);
		}

		return result;
	}

}
