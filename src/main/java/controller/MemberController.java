package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kic.mskim.MskimRequestMapping;
import kic.mskim.RequestMapping;
import model.Member;
import model.MemberDao;
//http://localhost:8088/jsp3/member/joinForm
/*
 * @WebServlet("/member/*") : url의 정보가
 *    http://localhost:8088/jsp3/member/....
 *    MemberController 를 호출.
 */
@WebServlet("/member/*")
public class MemberController extends MskimRequestMapping {
	//http://localhost:8088/jsp3/member/joinForm 요청시 호출되는 메서드
	@RequestMapping("loginForm")
	public String joinForm(HttpServletRequest request, 
			                HttpServletResponse response) {
		return "/view/member/loginForm.jsp"; //forward 됨
	}
	@RequestMapping("join")
	public String join(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Member mem = new Member();
	    mem.setId(request.getParameter("id"));
	    mem.setPass(request.getParameter("pass"));
	    mem.setName(request.getParameter("name"));
	    mem.setGender(Integer.parseInt(request.getParameter("gender")));
	    mem.setTel(request.getParameter("tel"));
	    mem.setEmail(request.getParameter("email"));
	    mem.setPicture(request.getParameter("picture"));
	    MemberDao dao = new MemberDao();
	    if(dao.insert(mem)) {
	    	return "/view/member/join.jsp";
	    }else {
	    	return "/view/member/joinForm.jsp";
	    }
	}
}
