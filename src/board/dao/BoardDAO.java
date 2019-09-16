package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {

	private static BoardDAO instance;
	private SqlSessionFactory ssf;

	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
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

	public void write(BoardDTO boardDTO) {
		SqlSession ss = ssf.openSession();
		ss.insert("boardSQL.write", boardDTO);
		ss.commit();
		ss.close();
	}

	public List<BoardDTO> getAll(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		SqlSession ss = ssf.openSession();
		List<BoardDTO> list = ss.selectList("boardSQL.getAll", map);
		ss.close();
		return list;
	}

	public List<BoardDTO> getBySearch(String category, String keyword, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("keyword", keyword);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession ss =ssf.openSession();
		List<BoardDTO> list = ss.selectList("boardSQL.getBySearch", map);
		ss.close();
		return list;
	}

	public int getCount() {
		SqlSession ss = ssf.openSession();
		int cnt = ss.selectOne("boardSQL.getCount");
		ss.close();
		return cnt;
	}
	
	public int getCountBySearch(String category, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("keyword", keyword);
		
		SqlSession ss =ssf.openSession();
		int cnt = ss.selectOne("boardSQL.getCountBySearch", map);
		ss.close();
		return cnt;
	}
	
	public BoardDTO getBoard(int seq) {
		SqlSession ss = ssf.openSession();
		BoardDTO boardDTO = ss.selectOne("boardSQL.getBoard", seq);
		ss.close();
		return boardDTO;
	}

	public void modify(BoardDTO boardDTO) {
		SqlSession ss = ssf.openSession();
		ss.update("boardSQL.modify", boardDTO);
		ss.commit();
		ss.close();
	}

	public void delete(int seq) {
		SqlSession ss = ssf.openSession();
		ss.delete("boardSQL.delete", seq);
		ss.commit();
		ss.close();
	}

	//	public int getTotalA() {
	//		int result = 0;
	//		String sql = "SELECT count(*) from board";
	//		getConnection();
	//
	//		try {
	//			pstmt = conn.prepareStatement(sql);
	//			rs = pstmt.executeQuery();
	//			if (rs.next()) {
	//				result = rs.getInt(1);
	//			}
	//		} catch (SQLException e) {
	//			e.printStackTrace();
	//		} finally {
	//			disconnect();
	//		}
	//		return result;
	//	}

	public void boardHit(int seq) {
		SqlSession ss = ssf.openSession();
		ss.update("boardSQL.boardHit", seq);
		ss.commit();
		ss.close();
	}
}
