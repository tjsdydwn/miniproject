package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setId("hong");
		boardDTO.setName("홍길동");
		boardDTO.setEmail("hong@hong.com");
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));

		BoardDAO.getInstance().write(boardDTO);

		return "/board/boardWrite.jsp";
	}

}
