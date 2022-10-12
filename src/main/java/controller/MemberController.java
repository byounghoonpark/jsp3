package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

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
public class MemberController extends MskimRequestMapping{
	//http://localhost:8088/jsp3/member/joinForm 요청시 호출되는 메서드
    @RequestMapping("joinForm")
    public String joinForm(HttpServletRequest request,
    		               HttpServletResponse response) {
    	return "/view/member/joinForm.jsp"; //forward 됨
    }
    @RequestMapping("join")
    /*
     * 1. 파라미터값들을 Member 객체에 저장
     * 2. Member 객체의 내용을 db에 저장
     * 3. 저장성공 : 화면에 내용출력하기
     *    저장실패 : joinForm.jsp 페이지 이동
     */
    public String join(HttpServletRequest request,
    		           HttpServletResponse response) {
    	try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	//1. 파라미터값들을 Member 객체에 저장
    	Member mem = new Member();
    	mem.setId(request.getParameter("id"));
    	mem.setPass(request.getParameter("pass"));
    	mem.setName(request.getParameter("name"));
    	mem.setGender(Integer.parseInt(request.getParameter("gender")));
    	mem.setTel(request.getParameter("tel"));
    	mem.setEmail(request.getParameter("email"));
    	mem.setPicture(request.getParameter("picture"));
    	//2. Member 객체의 내용을 db에 저장
    	MemberDao dao = new MemberDao();
    	if(dao.insert(mem)) { 
    		//3. 저장성공 : 화면에 내용출력하기
    		request.setAttribute("mem", mem); 
    		return "/view/member/join.jsp";
    	} else { 
    		//3. 저장실패 : joinForm.jsp 페이지 이동
    		return "/view/member/joinForm.jsp";
    	}
    }
 
    //http://localhost:8088/jsp3/member/loginForm 요청시 호출되는 메서드
    @RequestMapping("loginForm")
    public String loginForm(HttpServletRequest request,
    		                HttpServletResponse response) {
    	return "/view/member/loginForm.jsp"; //forward 됨
    }
    @RequestMapping("login")
    /*
  	 * 1. 아이디, 비밀번호 파라미터를 변수 저장 
  	 * 2. db 정보를 읽기. id에 해당하는 db정보를 읽어서 Member 객체에 저장 
     *	  Member MemberDao.selectOne(id);
  	 * 3. 아이디와 비밀번호 검증. 
     *	  - 아이디가 없는 경우      
     *      아이디가 없습니다. 메세지확인. loginForm 페이지 이동
     *	  - 아이디 존재. 비밀번호가 틀린경우   
     *      비밀번호오류 메세지확인. loginForm 페이지 이동
     *	  - 아이디 존재. 비밀번호가 맞는경우 => 정상적인 로그인.
     * 	    session 객체에 로그인 정보 저장.
     *      main로 페이지 이동.
     */
    public String login(HttpServletRequest request,
    		            HttpServletResponse response) {
    	//1. 아이디, 비밀번호 파라미터를 변수 저장 
    	String id = request.getParameter("id");
    	String pass = request.getParameter("pass");
    	Member mem = new MemberDao().selectOne(id);
    	String msg = null;
    	String url = null;
    	if(mem == null) { //아이디 없음
    		msg = "아이디를 확인하세요.";
    		url = "loginForm";
    	} else if(!pass.equals(mem.getPass())) { //비밀번호 오류
    		    //입력한 비밀번호	db에 등록된 비밀번호
    		msg = "비밀번호가 틀렸습니다.";
    		url = "loginForm";
    	} else { //정상 로그인
    		//session에 login 정보 등록.
    		//request.getSession() : session 객체 리턴
    		request.getSession().setAttribute("login", id);
    		msg = "반갑습니다. "+mem.getName()+"님";
    		url = "main";
    	}
    	request.setAttribute("msg", msg);
    	request.setAttribute("url", url);
    	return "/view/alert.jsp"; //forward 됨
    }

    @RequestMapping("main")
    /*
     * 1. 로그인 여부 검증
     * 	  로그인상태 : 화면 보여주기
     *    로그아웃상태 : 로그인하세요. 메세지 출력 후 loginForm.jsp 로 이동 
     */
    public String main(HttpServletRequest request,
    				   HttpServletResponse response) {
    	String login = (String)request.getSession().getAttribute("login");
    	if(login == null) { //로그아웃상태
    		request.setAttribute("msg", "로그인하세요.");
    		request.setAttribute("url", "loginForm");
    		return "/view/alert.jsp";
    	}
    	return "/view/member/main.jsp";
    }
    @RequestMapping("logout")
    /*
     * 1. session에 등록된 로그인 정보제거
     * 2. loginForm.jsp로페이지 이동
     */
    public String logout(HttpServletRequest request,
						 HttpServletResponse response) {
    	//1. session에 등록된 로그인 정보제거
    	request.getSession().invalidate();
    	//2. loginForm.jsp로페이지 이동
    	return "redirect:loginForm";
    }
    @RequestMapping("info")
    /*
     * 1. id 파라미터값을 변수 저장하기
   	 * 2. login 상태 검증.
     * 	  로그아웃상태 : 로그인하세요 메세지출력 후 loginForm 페이지 이동   
   	 * 3. login 상태 검증 2.
     *    로그상태 : 관리자가 아닌 경우 id 파라미터값과 login 정보가 다르면
     *             본인정보만 조회가능합니다. 메세지 출력 후 main로 페이지 이동
   	 * 4. id에 해당하는 정보를 읽어서 /view/member/info.jsp 화면 출력하기         
     */
    public String info(HttpServletRequest request,
			 			 HttpServletResponse response) {
    	//1. id 파라미터값을 변수 저장. 로그인정보 저장
    	String id = request.getParameter("id");
    	String login = (String)request.getSession().getAttribute("login");
    	//2. login 상태 검증.
    	if(login == null) { //로그아웃 상태
    		request.setAttribute("msg", "로그인하세요.");
    		request.setAttribute("url", "loginForm");
    		return "/view/alert.jsp";
    	} 
    	//3. login 상태 검증 2.
    	else if(!login.equals("admin") && !id.equals(login)) {
    		request.setAttribute("msg", "본인 정보만 조회가능합니다.");
    		request.setAttribute("url", "main");
    		return "/view/alert.jsp";
    	}
    	//4. id에 해당하는 정보를 읽어서 /view/member/info.jsp 화면 출력하기 
    	Member mem = new MemberDao().selectOne(id);
    	request.setAttribute("mem", mem);
    	return "/view/member/info.jsp";
    }
    @RequestMapping("updateForm")
    
    public String updateForm (HttpServletRequest request,
			 			 HttpServletResponse response) {
    	String id = request.getParameter("id");
    	String login = (String)request.getSession().getAttribute("login");  	
    	if(login == null) { //로그아웃 상태
    		request.setAttribute("msg", "로그인하세요.");
    		request.setAttribute("url", "loginForm");
    		return "/view/alert.jsp";
    	} 
    	//3. login 상태 검증 2.
    	else if(!login.equals("admin") && !id.equals(login)) {
    		request.setAttribute("msg", "본인 정보만 조회가능합니다.");
    		request.setAttribute("url", "main");
    		return "/view/alert.jsp";
    	}
    	//4. id에 해당하는 정보를 읽어서 /view/member/info.jsp 화면 출력하기 
    	Member mem = new MemberDao().selectOne(id);
    	request.setAttribute("mem", mem);
    	return "/view/member/updateForm.jsp";
    }
 
    @RequestMapping("update")
    
    public String update (HttpServletRequest request,
			 HttpServletResponse response) {
    	try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
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
    	   String login = 
    			   (String)request.getSession().getAttribute("login");
    	   MemberDao dao = new MemberDao();
    	   Member dbMem = dao.selectOne(login);
    	   String msg = "비밀번호가 틀렸습니다.";
    	   String url = "updateForm?id="+mem.getId();
    	   if(mem.getPass().equals(dbMem.getPass())) {
    		  if(dao.update(mem)) {
    			  msg = "회원 정보 수정이 완료되었습니다.";
    			  url = "info?id="+mem.getId();
    		  } else {
    			  msg = "회원 정보 수정시 오류발생.";
    		  }
    	   }
    	   request.setAttribute("msg", msg);
    	   request.setAttribute("url", url);
    	   return "/view/alert.jsp";
    }
    /*
   1. id 파라미터 저장하기
   2. login 여부 검증하기
      로그아웃상태인 경우 
         로그인하세요.메세지 출력 후 loginForm.jsp 페이지로 이동
      관리자가 아니면서 id 파라미터 정보와 login 정보가 다른 경우
      본인만 탈퇴 가능합니다. 메세지 출력 후 main.jsp 페이지로 이동      
   3. 현재 화면 출력하기  
   */
    @RequestMapping("deleteForm")
    public String deleteForm (HttpServletRequest request,
			 HttpServletResponse response) {
    	String id = request.getParameter("id");
    	String login = 
    			(String)request.getSession().getAttribute("login"); 
    	if(login == null) {
    		request.setAttribute("msg", "로그인 하세요");
    		request.setAttribute("url", "loginForm");
    		return "/view/alert.jsp";		
    	} else if (!login.equals("admin") && !id.equals(login)){
    		request.setAttribute("msg", "본인만 탈퇴 가능합니다.");
    		request.setAttribute("url", "main");
    		return "/view/alert.jsp";
    	}
    	return "/view/member/deleteForm.jsp";
    }
  @RequestMapping("delete")
    
    public String delete (HttpServletRequest request,
			 HttpServletResponse response) {
	  String id = request.getParameter("id");
	  String pass = request.getParameter("pass");
      String login = 
    			   (String)request.getSession().getAttribute("login");
    	   
    	   MemberDao dao = new MemberDao();
    	   Member dbMem = dao.selectOne(login);
    	   String msg = null;
    	   String url = null;
    	   if( !request.getMethod().equals("POST")) {
    			  msg = "입력방식이 오류입니다.";
    			  url = "deleteForm?id=" +id;
    		//3. id가 관리자인경우 탈퇴 불가.  list.jsp 페이지로 이동  
    		  } else if (id.equals("admin")) {
    			  msg = "관리자는 탈퇴 불가합니다.";
    			  url = "list";
    		//3-1. 로그아웃 상태인 경우 오류 검증  
    		  } else if (login == null) {	  
    			  msg = "로그인 하세요";
    			  url = "loginForm";
    		//3-2. 본인 탈퇴 검증
    		  } else if (!login.equals("admin") && !id.equals(login)) {
    			  msg = "본인만 탈퇴 가능합니다.";
    			  url = "main";
    		  } else {  //기본 검증 완료  
    			
    			// 4. 비밀번호 검증
    			//pass : 입력된 비밀번호
    			//mem.getPass() : db에 등록된 비밀번호
    			 if(!pass.equals(dbMem.getPass())) { //비밀번호 오류
    			    msg = "비밀번호 오류";
    			    url = "deleteForm?id=" +id;
    			 } else { //비밀번호 일치
    		   // 5. 비밀번호 일치하는 경우		 
    				if(dao.delete(id)) {
    				    msg = id + " 회원이 탈퇴 되었습니다.";
    				    if(login.equals("admin")) { //관리자 
    					    url = "list";
    				    } else {  //일반 사용자 
    				    	request.getSession().invalidate(); //로그아웃 
    					    url = "loginForm";
    				    }
    				} else {  //회원 정보 삭제시 db 오류 발생 한 경우 
    				    msg = id + " 회원 탈퇴 실패";
    				    if(login.equals("admin")) { //관리자 
    					    url = "list";
    				    } else {  //일반 사용자 
    					    url = "deleteForm?id="+id;
    				    }
    				}
    			 }
    		  }
    	   request.setAttribute("msg", msg);
    	   request.setAttribute("url", url);
    	   return "/view/alert.jsp";
    }
  /*
1. 로그아웃상태 : 로그인이 필요합니다. 메세지 출력 loginForm.jsp 페이지 이동
2. 일반사용자로 로그인 상태 : 관리자만 가능한 거래 입니다. 메세지 출력.
                         main 페이지 이동
3. db에서 모든 회원정보를 조회하여 화면에 출력하기
   */
  @RequestMapping("list")
  public String list(HttpServletRequest request,
			 HttpServletResponse response) {	 
	  String login = (String)request.getSession().getAttribute("login");
	  if(login==null) {
		  request.setAttribute("msg", "로그인 하세요");
		  request.setAttribute("url", "loginForm");
		  return "/view/alert.jsp";
	  }
	  if(!login.equals("admin")) {
		  request.setAttribute("msg", "관리자로 로그인하세요");
		  request.setAttribute("url", "main");
		  return "/view/alert.jsp";
	  }
	  List<Member> list = new MemberDao().list();
	  request.setAttribute("list", list);
	  return "/view/member/list.jsp";
  }
 @RequestMapping("memberimg")
 public String memberimg(HttpServletRequest request,
		 HttpServletResponse response) {	 
		return "/view/member/memberimg.jsp";
	}
 /*
  * 1. 파일 업로드하기 : 업로드 위치=>/member/picture/로 설정
  * 2. 파일의 내용을 opener에 출력하기. 현재 윈도우는 close 함
  */
 @RequestMapping("imgupload")
 public String imgupload(HttpServletRequest request,
		 HttpServletResponse response) {	
	 String path = getServletContext().getRealPath("/")
			 +"/picture/"; //파일 업로드 폴더 위치
	 File f =new File(path);
	 if(!f.exists()) f.mkdirs(); //폴더 생성
	 String filename = null;
	 MultipartRequest multi = null;
	 try {
		multi = new MultipartRequest //파일업로드 완성
		 (request, path, 10*1024*1024,"utf-8");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 filename = multi.getFilesystemName("picture");
	 request.setAttribute("filename", filename);
		return "/view/member/imgupload.jsp";
		}
 @RequestMapping("idForm")
 public String idForm(HttpServletRequest request,
		 HttpServletResponse response) {	 
		return "/view/member/idForm.jsp";
	}
 @RequestMapping("pwForm")
 public String pwForm(HttpServletRequest request,
		 HttpServletResponse response) {	 
		return "/view/member/pwForm.jsp";
	}
 
 /*
   1. email,tel 파라미터 저장.
   2. db에서 email과 tel 을 이용하여 id값을 리턴
       id = MemberDao.idSearch(email,tel)
   3. id 값이 존재:  id값을 화면에 출력.
           아이디전송 버튼클릭시 opener의 id에 값을 저장. 현재 화면 닫기
   4. id 값이 없는 경우 :         
           정보에 맞는 id를 찾을 수 없습니다.  메세지 출력후
           idForm.jsp로 페이지 이동.
  */
 @RequestMapping("id")
 public String id(HttpServletRequest request,
		 HttpServletResponse response) {	 
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String id =new MemberDao().idSearch(email, tel);
		if(id == null) {
			request.setAttribute
			("msg", "정보에 맞는 id를 찾을 수 없습니다.");
			request.setAttribute("url", "idForm");
			return "/view/alert.jsp";
		}
		request.setAttribute("id", id);
		return "/view/member/id.jsp";
	}
 @RequestMapping("pass")
 public String pass(HttpServletRequest request,
		 HttpServletResponse response) {	 
	    String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String pass =new MemberDao().pwSearch(id, email, tel);
		if(pass == null) {
			request.setAttribute
			("msg", "정보에 맞는 비밀번호를 찾을 수 없습니다.");
			request.setAttribute("url", "pwForm");
			return "/view/alert.jsp";
		}
		request.setAttribute("pass", pass);
		return "/view/member/pw.jsp";
	}
 /*
   1. 로그아웃상태인 경우. 로그인 하세요. 메세지 출력. 
      opener 페이지를 loginForm.jsp 페이지 이동.
      현재페이지 닫기
   2. pass, chgpass 파라미터 값 저장
   3. pass 비밀번호가 db에 저장된 비밀번호와 틀리면
      비밀번호 오류 메세지 출력. 현재 페이지를 passwordForm.jsp 페이지 이동
   4. pass 비밀번호가 db에 저장된 비밀번호와 같으면 => 비밀번호 검증 완료
      MemberDao.updatePass(login,chgpass) => 새로운 비밀번호로 수정
      비밀번호 수정 성공.
         메세지 출력후opener 페이지를 info.jsp 페이지 이동. 현재페이지 닫기
      비밀번호 수정 실패.
         메세지 출력후 opener 페이지를 updateForm.jsp 페이지 이동. 
         현재페이지 닫기
  */
 @RequestMapping("passwordForm")
 public String passwordForm(HttpServletRequest request,
		 HttpServletResponse response) {	 
		return "/view/member/passwordForm.jsp";
	}
 @RequestMapping("password")
 public String password(HttpServletRequest request,
		 HttpServletResponse response) {	 
	 String login = (String)request.getSession().getAttribute("login");
	   boolean opener = true;
	   boolean closer = true;
	   String msg = null;
	   String url = null;
	   if (login == null) {   
		   msg = "로그인 하세요";
		   url= "loginForm.jsp";
	   } else { //로그인 상태
		   //2
		   String pass = request.getParameter("pass");
		   String chgpass = request.getParameter("chgpass");
	       MemberDao dao = new MemberDao();
	       Member mem = dao.selectOne(login);
	       //4
	       //pass : 입력된 기존비밀번호
	       //mem.getPass() : db에 등록된 비밀번호 
		   if(pass.equals(mem.getPass())) { //비밀번호 일치
			   if(dao.updatePass(login,chgpass)) { //변경 성공
				   msg = "비밀번호가 변경되었습니다.";
				   url = "info?id="+login;
			   } else { //변경실패
				   msg = "비밀번호 변경시 오류가 발생했습니다.";
				   url = "updateForm?id="+login;
			   }
		   } else { //비밀번호 오류. 기존비밀번호와 등록된 비밀번호가 틀린경우
	      // 3
		      msg = "비밀번호가 틀렸습니다.";
		      closer=false;
		      opener=false;
		      url = "passwordForm";
		   }
	   }
	   request.setAttribute("msg", msg);
	   request.setAttribute("url", url);
	   request.setAttribute("closer", closer);
	   request.setAttribute("opener", opener);
		return "/view/member/password.jsp";
	}
}