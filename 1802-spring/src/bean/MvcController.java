package bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MvcController {

	@RequestMapping(value="/gugudan.hta")
	public ModelAndView gugudan(int dan) {
		ModelAndView mv = new ModelAndView();
		StringBuilder sb = new StringBuilder();
		
		
		for(int i=1; i<10 ; i++) {
			int r = dan * i;
			String temp = String.format("%d * %d = %d<br/>",dan, i, r);
			sb.append(temp);
		}
		
		mv.addObject("result", sb.toString());
		mv.setViewName("gugudan_result");
		return mv;
	}
	@RequestMapping(value="/hap.hta")
	public ModelAndView hap(int x, int y) {
		ModelAndView mv = new ModelAndView();
		int h=0;
		for(int i=x; i<=y ; i++) h += i;
		
		mv.addObject("hap", h);
		mv.setViewName("hap_result");
		return mv;
	}
	
	@RequestMapping(value="/amount.hta")
	public ModelAndView amount(int ea, double price) {
		ModelAndView mv = new ModelAndView();
		TotVo v = new TotVo(ea, price);
		
		mv.addObject("vo", v);
		mv.setViewName("amount_result");
		return mv;
	}
	
	
}
