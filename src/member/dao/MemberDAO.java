package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public class MemberDAO {

	private static MemberDAO instance;
	private SqlSessionFactory ssf;

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
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean isExistId(String id) {
		SqlSession ss = ssf.openSession();
		MemberDTO memberDTO = ss.selectOne("memberSQL.searchById", id);
		ss.close();
		return memberDTO == null ? false : true;
	}

	public MemberDTO login(String id, String pwd) {
		SqlSession ss = ssf.openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		MemberDTO memberDTO = ss.selectOne("memberSQL.login", map);
		ss.close();
		return memberDTO;
	}

	public MemberDTO login(String id) {
		SqlSession ss = ssf.openSession();
		MemberDTO memberDTO = ss.selectOne("memberSQL.searchById", id);
		ss.close();
		return memberDTO;
	}

	public int insert(MemberDTO memberDTO) {
		SqlSession ss = ssf.openSession();
		int row = ss.insert("memberSQL.insert", memberDTO);
		ss.commit();
		ss.close();
		return row;
	}

	public int modify(MemberDTO memberDTO) {
		SqlSession ss = ssf.openSession();
		int row = ss.update("memberSQL.modify", memberDTO);
		ss.commit();
		ss.close();
		return row;
	}

	public List<ZipcodeDTO> getZipcodeList(String sido, String sigungu, String roadname) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", sido);
		map.put("sigungu", sigungu);
		map.put("roadname", roadname);

		SqlSession ss = ssf.openSession();
		List<ZipcodeDTO> list = ss.selectList("memberSQL.getZipcodeList", map);
		ss.close();
		return list;
	}
}
