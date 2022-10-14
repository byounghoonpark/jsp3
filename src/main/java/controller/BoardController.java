package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kic.mskim.MskimRequestMapping;
import kic.mskim.RequestMapping;
import model.Board;
import model.BoardDao;

//http://localhost:8088/jsp3/board/*
@WebServlet("/board/*")
public class BoardController extends MskimRequestMapping {
	private BoardDao dao = new BoardDao();

	// http://localhost:8088/jsp3/board/writeForm
	@RequestMapping("writeForm")
	public String writeForm(HttpServletRequest request, HttpServletResponse response) {
		String boardid = (String) request.getSession().getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		String login = (String) request.getSession().getAttribute("login");
		if (boardid.equals("1")) {
			if (login == null || !login.equals("admin")) {
				request.setAttribute("msg", "관리자만 공지사항에 글쓰기가 가능합니다.");
				request.setAttribute("url", request.getContextPath() + "/board/list?boardid=" + boardid);
				return "/view/alert.jsp";
			}
		}
		return "/view/board/writeForm.jsp";
	}

	@RequestMapping("write")
	public String write(HttpServletRequest request, HttpServletResponse response) {
		// 파일 업로드되는 폴더 위치 설정
		String path = getServletContext().getRealPath("/") + "/upload/";
		String ip = request.getRemoteAddr();
		System.out.println(ip);
		File f = new File(path);
		if (!f.exists())
			f.mkdirs(); // 폴더가 없으면 생성. 파일 업로드 폴더 생성
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = null;
		try {
			/*
			 * request : 요청 정보. 파라미터,파일이름,파일의 내용 을 저장 path : 업로드 파일의 폴더 size : 업로드 가능한 최대
			 * 파일의 크기 "UTF-8" : 파라미터값 인코딩
			 */
			multi = new MultipartRequest(request, path, size, "UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 파라미터값 저장
		Board board = new Board();
		board.setWriter(multi.getParameter("writer"));
		board.setPass(multi.getParameter("pass"));
		board.setSubject(multi.getParameter("subject"));
		board.setContent(multi.getParameter("content"));
		board.setFile1(multi.getFilesystemName("file1"));// 파일이름
		board.setIp(request.getLocalAddr());
		String boardid = (String) request.getSession().getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		board.setBoardid(boardid);
		if (board.getFile1() == null)
			board.setFile1("");
		// num : board 테이블 중 최대 num값
		int num = dao.maxnum();
		board.setNum(++num); // board 테이블의 최대 num값+1
		board.setGrp(num);

		String msg = "게시물 등록 실패";
		String url = request.getContextPath() + "/board/writeForm";
		if (dao.insert(board)) { // 게시물등록 성공
			msg = "게시물이 등록되었습니다.";
			url = request.getContextPath() + "/board/list?boardid=" + boardid + "&pageNum=1";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/view/alert.jsp";
	}

	@RequestMapping("list")
	public String list(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		// boardid 파라미터가 존재하면
		if (request.getParameter("boardid") != null) {
			// session에 boardid이름으로 파라미터 등록
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", "1");
		}
		String boardid = (String) session.getAttribute("boardid");
		// session에 boardid 속성값이 없는 경우
		if (boardid == null)
			boardid = "1";
		int pageInt = 1; // 현재페이지
		int limit = 10; // 한페이지당 출력되는 게시물의 건수
		// pageNum 파리미터 존재
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		pageInt = Integer.parseInt(pageNum);
		// boardcount : 게시판 종류별 등록된 게시물 건수
		int boardcount = dao.boardCount(boardid);
		// list : pageInt에 해당하는 등록된 게시물 목록
		List<Board> list = dao.list(pageInt, limit, boardid);
		// pageInt 2. boardcount:15, boardnum : 5
		// 페이지 시작의 게시물 num 값
		int boardnum = boardcount - (pageInt - 1) * limit;
		int bottomLine = 3; // 한번에 보여지는 페이지 갯수
		/*
		 * startPage : 출력되는 시작페이지 번호 endpage : 출력되는 끝페이지 번호
		 * 
		 * pageInt startPage endPage 1 1 3 ( 1 - 1 ) / 3 * 3 + 1 => 1 2 1 3 ( 2 - 1 ) /
		 * 3 * 3 + 1 => 1 3 1 3 ( 3 - 1 ) / 3 * 3 + 1 => 1 4 4 6 ( 4 - 1 ) / 3 * 3 + 1
		 * => 4 5 4 6 ( 5 - 1 ) / 3 * 3 + 1 => 4 6 4 6 ( 6 - 1 ) / 3 * 3 + 1 => 4 7 7 10
		 * ( 7 - 1 ) / 3 * 3 + 1 => 7
		 * 
		 */
		int startPage = (pageInt - 1) / bottomLine * bottomLine + 1;
		int endPage = startPage + bottomLine - 1;
		// maxPage : 게시물건수에 의한 최대 페이지
		int maxPage = (boardcount / limit) + (boardcount % limit == 0 ? 0 : 1);
		// endPage는 최대페이지값을 넘지 못함
		if (endPage > maxPage)
			endPage = maxPage;
		String boardName = "공지사항";
		switch (boardid) {
		case "3":
			boardName = "QNA";
			break;
		case "2":
			boardName = "자유게시판";
			break;
		}
		request.setAttribute("boardName", boardName); // 게시판이름
		request.setAttribute("pageInt", pageInt); // 현재페이지
		request.setAttribute("boardid", boardid); // 게시판종류
		request.setAttribute("boardcount", boardcount); // 게시물등록건수
		request.setAttribute("list", list); // 게시물목록
		request.setAttribute("boardnum", boardnum); // 현재페이지의 시작번호
		request.setAttribute("startPage", startPage); // 페이지의 시작페이지번호
		request.setAttribute("bottomLine", bottomLine); // 한페이지에 보여질 페이지 갯수
		request.setAttribute("endPage", endPage); // 페이지의 끝페이지번호
		request.setAttribute("maxPage", maxPage); // 최대페이지 번호
		return "/view/board/list.jsp";
	}

	@RequestMapping("info")
	public String info(HttpServletRequest request, HttpServletResponse response) {
		// num 게시물번호. 파라미터값 저장
		int num = Integer.parseInt(request.getParameter("num"));
		// num에 해당하는 정보를 db에서 읽어서 Board객체에 저장
		Board b = dao.selectOne(num);
		// 조회수 증가
		dao.readcntAdd(num);
		// view에 b객체를 전달. request객체에 속성 등록
		request.setAttribute("b", b);
		return "/view/board/info.jsp";
	}

	@RequestMapping("updateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response) {
		// num 게시물번호. 파라미터값 저장
		int num = Integer.parseInt(request.getParameter("num"));
		// num에 해당하는 정보를 db에서 읽어서 Board객체에 저장
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return "/view/board/updateForm.jsp";
	}

	/*
	 * 1. 파일 업로드 하기 
	 * 2. 파라미터정보를 Board 객체 저장. 
	 * 3. 비밀번호 불일치 비밀번호 오류 메세지 출력하고,
	 * updateForm로 페이지 이동 
	 * 4. 비밀번호 일치 첨부파일의 변경이 없는 경우 file2 파라미터의 내용을 
	 * file1 프로퍼티에 저장하기 
	 * 파라미터의 내용으로 해당 게시물의 내용을 수정하기.
	 * boolean BoardDao.update(Board) 
	 *  수정성공 : 수정성공 메시지 출력 후 info 페이지 이동 
	 *  수정실패 : 수정실패 메시지 출력 후 updateForm 페이지 이동
	 */
	@RequestMapping("update")
	public String update(HttpServletRequest request, HttpServletResponse response) {
		//1. 파일 업로드 하기
		String path=getServletContext().getRealPath("/")+"/upload/";
		int size = 10*1024*1024;
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request,path,size,"UTF-8");	
		}catch(IOException e) {
			e.printStackTrace();
		}
		//2. 파라미터정보를 Board 객체 저장.
		Board board = new Board();
		board.setNum(Integer.parseInt(multi.getParameter("num")));
		board.setWriter(multi.getParameter("writer"));
		board.setPass(multi.getParameter("pass"));
		board.setSubject(multi.getParameter("subject"));
		board.setContent(multi.getParameter("content"));
		board.setFile1(multi.getFilesystemName("file1"));
		if(board.getFile1()==null||board.getFile1().equals("")) {
			board.setFile1(multi.getParameter("file2"));
		}
		//3,4 비밀번호 검증
		String msg = "비밀번호가 틀렸습니다.";
		String url = "updateForm?num="+board.getNum();
		Board dbBoard = dao.selectOne(board.getNum());
		if(board.getPass().equals(dbBoard.getPass())) {
			if(dao.update(board)) {
				msg = "게시물이 변경되었습니다.";
				url = "info?num="+board.getNum();
			}else {
				msg = "게시물 변경시 오류가 있습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/view/alert.jsp";
	}
}