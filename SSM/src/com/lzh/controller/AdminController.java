package com.lzh.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lzh.domain.Admin;
import com.lzh.service.AdminService;
import com.lzh.util.Md5Util;

/**
 * admin控制器
 * @author 李朝晖
 *
 */
//声明控制器
@Controller 
@RequestMapping(value="/admin")
public class AdminController {
	//调用Service
	@Resource(name=AdminService.SERVCER_NAME)
	private AdminService as;
	//插入数据
	@RequestMapping(value="/insert.do")
	public ModelAndView insert(Admin admin){
		Md5Util md5=new Md5Util();
		admin.setAdmin_pass(md5.getDigest(admin.getAdmin_pass()));
		as.insertAdmin(admin);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/admin/list.do");
		return mav;
	}
	@RequestMapping(value="/delete.do")
	public ModelAndView delete(int admin_id){
		ModelAndView modelAndView = new ModelAndView();
		as.deleteAdmin(admin_id);
		modelAndView.setViewName("redirect:/admin/list.do");
		return modelAndView;
	}
	@RequestMapping(value="/getById.do")
	public void getById(@RequestParam int admin_id,ModelMap map,HttpServletRequest request){
		Admin admin=as.getAdmin(admin_id);
		request.setAttribute("admin", admin);
		map.addAttribute("admin",admin);
	}
	@RequestMapping(value="/list.do")
	public String listAll(ModelMap map,HttpServletRequest request){
		List<Admin> adminlist=as.getAdmins();
		//将数据存入modelMap
		request.setAttribute("admin_list", adminlist);
		map.addAttribute("admin_list",adminlist);
		return "/admin/admin.jsp";
	}
	@RequestMapping(value="/update.do")
	public ModelAndView update(Admin admin){
		ModelAndView mav=new ModelAndView();
		as.updateAdmin(admin);	
		mav.setViewName("redirect:/admin/list.do");
		return mav;
	}
	@RequestMapping("/login.do")
	public String login(Admin admin,HttpServletRequest request,HttpSession session){
		Md5Util md5=new Md5Util();
		admin.setAdmin_pass(md5.getDigest(admin.getAdmin_pass()));
		System.out.println(admin.getAdmin_pass());
		boolean flag=as.login(admin);
		String admin_name=admin.getAdmin_name();
		if(flag==true){
			request.getSession().setAttribute("admin_name", admin_name);
			return "redirect:/admin/admin_index.jsp";
		}else{
			request.setAttribute("end", "用户名或密码错误");
			return "/admin/login.jsp";
		}
	}
	@RequestMapping("/lgout")
	public String loginout(HttpSession session){
		session.invalidate();
		return "redirect:/admin/login.jsp";
	}
	@RequestMapping("/regist.do")
	public void regist(@RequestParam(value="admin_name") String admin_name,HttpServletRequest request){
		int data=as.regist(admin_name);
		System.out.println(data);
	}
}
