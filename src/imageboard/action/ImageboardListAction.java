package imageboard.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String realPath = request.getServletContext().getRealPath("/storage");
		
		int boardLimit = 3;
		int groupLimit = 3;
		int pg = Integer.parseInt(request.getParameter("pg"));
		int endNum = pg * boardLimit;
		int startNum = endNum - (boardLimit - 1);

		List<ImageboardDTO> list = ImageboardDAO.getInstance().getAll(startNum, endNum);
		int cntBoard = ImageboardDAO.getInstance().getCount();
		int endGroup = ((pg - 1) / groupLimit + 1) * groupLimit;
		int startGroup = endGroup - (groupLimit - 1);
		int totalGroup = (cntBoard - 1) / boardLimit + 1;
		if (endGroup >= cntBoard / boardLimit + 1) {
			endGroup = totalGroup;
		}

		request.setAttribute("list", list);
		request.setAttribute("startGroup", startGroup);
		request.setAttribute("endGroup", endGroup);
		request.setAttribute("totalGroup", totalGroup);
		request.setAttribute("realPath", realPath);
		request.setAttribute("display", "/imageboard/imageboardList.jsp");

		return "/main/index.jsp";
	}

}
