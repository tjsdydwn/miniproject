package board.action;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int boardLimit = 5;
		int groupLimit = 3;
		int pg = Integer.parseInt(request.getParameter("pg"));
		int endNum = pg * boardLimit;
		int startNum = endNum - (boardLimit - 1);

		List<BoardDTO> list = BoardDAO.getInstance().getAll(startNum, endNum);
		int cntBoard = BoardDAO.getInstance().getCount();
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
