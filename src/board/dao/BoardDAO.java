package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;

public class BoardDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private static BoardDAO instance;

	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}

	public void getConnection() {
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void disconnect() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void write(BoardDTO boardDTO) {
		String sql = "INSERT INTO board VALUES (seq_board.nextVal,?,?,?,?,?,seq_board.currVal,0,0,0,0,0,sysdate)";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getId()); // 아이디
			pstmt.setString(2, boardDTO.getName()); // 이름
			pstmt.setString(3, boardDTO.getEmail()); // 이메일
			pstmt.setString(4, boardDTO.getSubject()); // 제목
			pstmt.setString(5, boardDTO.getContent()); // 내용

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	public ArrayList<BoardDTO> getAll(int startNum, int endNum) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		BoardDTO b = null;
		String sql = "SELECT * FROM "
					+ "(SELECT rownum rn, tt.* FROM (SELECT * FROM board ORDER BY ref DESC, step ASC) tt) "
					+ "WHERE rn >= ? and rn <= ?";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				b = new BoardDTO();
				b.setSeq(rs.getInt("seq"));
				b.setId(rs.getString("id"));
				b.setName(rs.getString("name"));
				b.setEmail(rs.getString("email"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setRef(rs.getInt("ref"));
				b.setLev(rs.getInt("lev"));
				b.setStep(rs.getInt("step"));
				b.setPseq(rs.getInt("pseq"));
				b.setReply(rs.getInt("reply"));
				b.setHit(rs.getInt("hit"));
				b.setLogtime(rs.getString("logtime"));
				list.add(b);
			}
		} catch (SQLException e) {
			list = null;
		} finally {
			disconnect();
		}
		return list;
	}

	public int getCount() {
		int cnt = 0;
		String sql = "SELECT count(*) as cnt FROM board";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return cnt;
	}

	public BoardDTO getBoard(int seq) {
		BoardDTO b = null;
		String sql = "SELECT * FROM board WHERE seq = ?";
		getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				b = new BoardDTO();
				b.setSeq(rs.getInt("seq"));
				b.setId(rs.getString("id"));
				b.setName(rs.getString("name"));
				b.setEmail(rs.getString("email"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setRef(rs.getInt("ref"));
				b.setLev(rs.getInt("lev"));
				b.setStep(rs.getInt("step"));
				b.setPseq(rs.getInt("pseq"));
				b.setReply(rs.getInt("reply"));
				b.setHit(rs.getInt("hit"));
				b.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return b;
	}

	public void modify(BoardDTO b) {
		String sql = "UPDATE board SET subject = ?, content = ?, logtime = sysdate WHERE seq = ?";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getSubject());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3, b.getSeq());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	public int getTotalA() {
		int result = 0;
		String sql = "SELECT count(*) from board";
		getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}

	public void boardHit(int seq) {
		String sql = "UPDATE board SET hit = hit + 1 WHERE seq = ?";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
}
