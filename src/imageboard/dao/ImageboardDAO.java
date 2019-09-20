package imageboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import imageboard.bean.ImageboardDTO;

public class ImageboardDAO {

	private static ImageboardDAO instance;
	private SqlSessionFactory ssf;

	public ImageboardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static ImageboardDAO getInstance() {
		if (instance == null) {
			synchronized (ImageboardDAO.class) {
				instance = new ImageboardDAO();
			}
		}
		return instance;
	}

	public void write(ImageboardDTO imageboardDTO) {
		SqlSession ss = ssf.openSession();
		ss.insert("imageboardSQL.write", imageboardDTO);
		ss.commit();
		ss.close();
	}

	public List<ImageboardDTO> getAll(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		SqlSession ss = ssf.openSession();
		List<ImageboardDTO> list = ss.selectList("imageboardSQL.getAll", map);
		ss.close();

		return list;
	}

	public int getCount() {
		SqlSession ss = ssf.openSession();
		int cnt = ss.selectOne("imageboardSQL.getCount");
		ss.close();
		return cnt;
	}

	public ImageboardDTO getBoard(int seq) {
		SqlSession ss = ssf.openSession();
		ImageboardDTO imageboardDTO = ss.selectOne("imageboardSQL.getBoard", seq);
		ss.close();
		return imageboardDTO;
	}

	public void delete(String[] checkedSeq) {
		SqlSession ss = ssf.openSession();
		ss.delete("imageboardSQL.delete", checkedSeq);
		ss.commit();
		ss.close();
	}
}
