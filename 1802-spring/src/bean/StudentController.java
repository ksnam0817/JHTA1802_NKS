package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudentController {
	StudentDao dao;
	
	public StudentController(StudentDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value="login.std")
	public ModelAndView login(HttpServletRequest req, HttpSession sess) {
		ModelAndView mv = new ModelAndView();
			mv.setViewName("login");
		return mv;
	}

	@RequestMapping(value="loginR.std")
	public ModelAndView loginR(HttpServletRequest req, HttpSession sess) {
		ModelAndView mv = new ModelAndView();
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String msg = "";
		boolean b = dao.login(id, pwd);
		if(b) {
			sess.setAttribute("session_id", id);
			mv.setViewName("../index");
		}else {
			msg = "아이디 또는 암호를 확인해 주세요.";
			mv.addObject("msg",msg);

			mv.setViewName("login");
		}
		
		return mv;
	}
	
	@RequestMapping(value="logout.std")
	public ModelAndView logout(HttpSession sess) {
		ModelAndView mv = new ModelAndView();
		
		sess.removeAttribute("session_id");
		
		mv.setViewName("../index");
		
		return mv;
	}
		
	
	@RequestMapping(value="findIdR.std")
	public ModelAndView findIdR(String findStr) {
		ModelAndView mv = new ModelAndView();
		String msg = "지정된 메일로 아이디와 암호가 전송되었습니다.<br/>메일을 확인해 주시기 바랍니다.";
		boolean b = dao.findId(findStr);
		if(!b) {
			msg = "해당 아이디나 연락처가 없어 메일을 전송하지 못했습니다...";
		}

		mv.setViewName("find_id_pwd_result");
		mv.addObject("msg",msg);
		
		return mv;
	}	
	
	
	@RequestMapping(value="insertR.std")
	public ModelAndView insertR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String msg = dao.insertR(req);
		
		mv.addObject("msg", msg);
		mv.setViewName("insert_result");
		
		return mv;
	}
	
	@RequestMapping(value="list.std")
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();

		
		List<StudentVo> list = dao.select(req);
		
		mv.addObject("dao", dao);
		mv.addObject("list",list);
		mv.setViewName("list");// ./student/list.jsp
		
		return mv;
	}
	
	@RequestMapping(value= "view.std")
	public ModelAndView view(String id) {
		ModelAndView mv = new ModelAndView();
		
		StudentVo vo = dao.selectOne(id);
		
		mv.addObject("vo", vo);
		mv.setViewName("view");
		
		return mv;
	}
	
	@RequestMapping(value= "modify.std")
	public ModelAndView modify(String id) {
		ModelAndView mv = new ModelAndView();
		
		StudentVo vo = dao.selectOne(id);
		
		mv.addObject("vo", vo);
		mv.setViewName("modify");
		
		return mv;
	}
	
	@RequestMapping(value= "modifyR.std")
	public ModelAndView modifyR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		ParamVo pVo = dao.modifyR(req);
		
		mv.addObject("pVo", pVo);
		mv.setViewName("modify_result");
		
		return mv;
	}

	@RequestMapping(value= "deleteR.std")
	public ModelAndView deleteR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String msg = dao.deleteR(req);
		
		mv.addObject("msg", msg);
		mv.setViewName("delete_result");
		
		return mv;
	}
}
