package board.action;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardSearchAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");

		int boardLimit = 5;
		int groupLimit = 3;
		int pg = Integer.parseInt(request.getParameter("pg"));
		int endNum = pg * boardLimit;
		int startNum = endNum - (boardLimit - 1);

		List<BoardDTO> list = BoardDAO.getInstance().getBySearch(category, keyword, startNum, endNum);
		int cntBoard = BoardDAO.getInstance().getCountBySearch(category, keyword);
		int endGroup = ((pg - 1) / groupLimit + 1) * groupLimit;
		int startGroup = endGroup - (groupLimit - 1);
		if (endGroup >= cntBoard / boardLimit + 1) {
			endGroup = cntBoard / boardLimit + 1;
		}
		
		request.setAttribute("list", list);
		request.setAttribute("startGroup", startGroup);
		request.setAttribute("endGroup", endGroup);
		request.setAttribute("display", "/board/boardList.jsp");
		
		Cookie cookie = new Cookie("view", "true");
		response.addCookie(cookie);

		return "/main/index.jsp";
	}

}
