package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.PhonebookServiceInter;
import vo.PhonebookVO;

@Controller
public class MemoController {

	@Autowired
	PhonebookServiceInter service;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",service.getList());
		mv.setViewName("list");
		return mv;
	}
	
	@RequestMapping("/find")
	public ModelAndView list(String search) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",service.find(search));
		mv.setViewName("list");
		return mv;
	}
	//form처리시
	@RequestMapping("/insertProc")
	public String insertProc(PhonebookVO pb) {
		System.out.println(pb.toString());
		int result=service.insert(pb);		
		return "index";
	}
	
	//ajax처리시
	@RequestMapping("/insert")
	public ModelAndView insert(PhonebookVO pb) {
		ModelAndView mv=new ModelAndView();
		//첫번째 작업 입력
		int result=service.insert(pb);		
		//두번째 작업 리스트 요청(페이지로 이동하는 것이 아닌 결과로 돌려주는것)
		mv.addObject("list",service.getList());
		mv.setViewName("list");
		return mv;
		
		//참고)페이지로 이동하는 것이 절대 아니다.(list.jsp-ajax.
	}
	
	//ajax처리시
		@RequestMapping("/findOne")
		public ModelAndView findOne(int idx) {
			System.out.println(idx);
			System.out.println(service.findOne(idx).toString());
			ModelAndView mv=new ModelAndView();		
			//두번째 작업 리스트 요청(페이지로 이동하는 것이 아닌 결과로 돌려주는것)
			mv.addObject("phonebook",service.findOne(idx));				//phonebook에 넣고.. findOne에 뿌려줌
			mv.setViewName("findOne");									//findOne.jsp 파일
			return mv;
			
		}
		
		@RequestMapping("/update")
		public String update(PhonebookVO pb) {
			ModelAndView mv=new ModelAndView();	
			System.out.println(pb);
			int result=service.update(pb);								
			mv.addObject("list",service.getList());
			mv.setViewName("list");
			return "index";			
		}
		
		

		
		
		@RequestMapping("/deleteproc")
		public ModelAndView deleteproc(PhonebookVO pb) {
			ModelAndView mv=new ModelAndView();
			System.out.println(pb);
			int result=service.delete(pb);
			mv.addObject("list",service.getList());
			mv.setViewName("list");
			return mv;
		}
		
		@RequestMapping("/form")
		public String form() {
			return "form";
		}
		@ResponseBody
		@PostMapping("/formProc")
		public String formProc(@RequestBody String json) {
			System.out.println(json);
			return json;
		}
		
		
	
	
		//form 실행 -> form.jsp -> /formProc?{json data} -> controller의 /formProc받아서 String 저장 -> form.jsp
		//파싱은 알아서 해볼것...
		//https://granya.tistory.com/10 참고
	
	
	
	
	
	
	
	
	
}
