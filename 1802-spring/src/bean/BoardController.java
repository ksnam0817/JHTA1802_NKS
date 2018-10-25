package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	BoardDao dao;
	
	public BoardController(BoardDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value="list.brd")
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		List<BoardVo> list = dao.select(req);
		
		mv.addObject("dao", dao);
		mv.addObject("list",list);
		mv.addObject("pVo", dao.getpVo());
		mv.setViewName("list");
		
		return mv;
	}
	
	@RequestMapping(value="list_album.brd")
	public ModelAndView selectAlbum(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		List<BoardAttVo> list = dao.selectAlbum(req);
		
		mv.addObject("dao", dao);
		mv.addObject("list",list);
		mv.addObject("pVo", dao.getpVo());

		mv.setViewName("list_album");
		
		return mv;
	}
	
	@RequestMapping(value="list_album_append.brd")
	public ModelAndView selectAlbumAppend(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		List<BoardAttVo> list = dao.selectAlbumAppend(req);
		
		mv.addObject("dao", dao);
		mv.addObject("list",list);
		
		if(dao.getTotPage() == dao.getNowPage()) {
			mv.addObject("image_last", "true");
		}

		mv.setViewName("list_album_append");
		
		return mv;
	}
	
	
	
	@RequestMapping(value="insert.brd")
	public ModelAndView insert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		BoardVo vo = dao.setVo(req);

		mv.addObject("vo", vo);
		
		mv.setViewName("insert");
		
		return mv;
	}
	
	@RequestMapping(value="insertR.brd")
	public ModelAndView insertR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ParamVo pVo = dao.insertR(req);

		mv.addObject("pVo", pVo);
		
		mv.setViewName("insert_result");
		
		return mv;
	}
	
	@RequestMapping(value="view.brd")
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		BoardVo vo = dao.view(req);

		mv.addObject("vo", vo);
		mv.addObject("pVo", dao.getpVo());
		
		mv.setViewName("view");
		
		return mv;
	}
	
	@RequestMapping(value="modify.brd")
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		BoardVo vo = dao.modify(req);

		mv.addObject("vo", vo);
		mv.addObject("pVo", dao.getpVo());
		
		mv.setViewName("modify");
		
		return mv;
	}
	
	@RequestMapping(value="modifyR.brd")
	public ModelAndView modifyR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		BoardVo vo = dao.modifyR(req);

		mv.addObject("vo", vo);
		mv.addObject("pVo", dao.getpVo());
		
		mv.setViewName("modify_result");
		
		return mv;
	}
	
	@RequestMapping(value="deleteR.brd")
	public ModelAndView deleteR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		BoardVo vo = dao.deleteR(req);

		mv.addObject("vo", vo);
		mv.addObject("pVo", dao.getpVo());

		mv.setViewName("delete_result");
		
		return mv;
	}
	
	@RequestMapping(value = "repl.brd")
	public ModelAndView repl(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		BoardVo vo = dao.setVo(req);
		ParamVo pVo = dao.setPVo(req);
		
		mv.addObject("vo", vo);
		mv.addObject("pVo", pVo);
		
		mv.setViewName("repl");
		
		return mv;
	}
		
	
	@RequestMapping(value = "replR.brd")
	public ModelAndView replR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		BoardVo vo = dao.replR(req);

		mv.addObject("vo", vo);
		mv.addObject("pVo", dao.getpVo());
		
		mv.setViewName("repl_result");
		
		return mv;
	}
	
	
}
