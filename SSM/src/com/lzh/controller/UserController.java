package com.lzh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lzh.domain.Page;
import com.lzh.domain.User;
import com.lzh.service.UserService;
import com.lzh.util.ResponseUtil;
import com.lzh.util.StringUtil;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Resource(name=UserService.SERVER_NAME)
	private UserService us;
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false) String page,@RequestParam(value="rows",required=false) String rows,User s_user,HttpServletResponse response) throws Exception{
		Page p=new Page(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("userName", StringUtil.formatlike(s_user.getUserName()));
		String userName=s_user.getUserName();
		List<User> userList=us.findAll(p);
		List<User> userName_List=us.getLikeUserName(userName);
		Long total=us.getTotal();
		map.put("userList", userList);
		map.put("total",total);
		map.put("userName_List", userName_List);
		JSONObject result=new JSONObject();
		JSONArray array=JSONArray.fromObject(userList);
		JSONArray array01=JSONArray.fromObject(userName_List);
		if(s_user.getUserName()==null){
			result.put("rows", array);
			result.put("total", total);
		}else{
			result.put("rows", array01);
			result.put("total", total);
		}
		ResponseUtil.write(response, result);
		return "/admin/user.jsp";
	}
	@RequestMapping("/findAll.do")
	public String getList(ModelMap map,Page page,HttpServletRequest request){
		List<User> user_list=us.findAll(page);
		request.setAttribute("user_list",user_list);
		map.addAttribute("user_list",user_list);
		for(User user:user_list){
			System.out.println(user.getEmail());
		}
		return "/admin/user.jsp";
	}
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids") String ids,HttpServletResponse res) throws Exception{
		String[] idStr = ids.split(",");//把字符串拆分成字符串数组
		JSONObject jsonObject = new JSONObject();
		for (String id : idStr) {
			us.delete(Integer.parseInt(id));
		}
		jsonObject.put("success", true);//把true放入
		ResponseUtil.write(res, jsonObject);
		return "/admin/user.jsp";
	}
	@RequestMapping("/save")
	public String save(User user,HttpServletResponse res,HttpServletRequest request) throws Exception{
		//操作记录条数，初始化为0
		/*String fileName=file.getOriginalFilename();
		String path=request.getSession().getServletContext().getRealPath("/upload/");
		File myFile=new File(path,fileName);
		try {
			file.transferTo(myFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		User u_user=new User(user.getUserName(),user.getPassword(),user.getTrueName(),user.getEmail(),user.getTel(),"upload"+"/"+fileName);*/
		int resultTotal = 0;
		if (user.getId()==0) {
			resultTotal = us.insert(user);
		}else{
			resultTotal = us.update(user);
		}
		JSONObject jsonObject = new JSONObject();
		if(resultTotal > 0){   //说明修改或添加成功
			jsonObject.put("success", true);
		}else{
			jsonObject.put("success", false);
		}
		ResponseUtil.write(res, jsonObject);
		return "/admin/user.jsp";
	} 
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request,HttpSession session){
		boolean flag=us.login(user);
		if(flag==true){
			User l_user=us.loginGet(user.getUserName());
			request.getSession().setAttribute("user", l_user);
			return "redirect:/index.jsp";
		}else{
			request.setAttribute("end", "用户名或密码错误");
			return "/login.jsp";
		}
	}
	@RequestMapping("/regist.do")
	public ModelAndView regist(User user,HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		us.registUser(user);
		mav.setViewName("/login.jsp");
		return mav;
	}
	
	@RequestMapping("/ajaxlogin.do")
	@ResponseBody
	public String isExist(@RequestParam("name") String name,HttpServletResponse res,HttpServletRequest request) {
		List<User> list=us.regist(name);
		System.out.println(name);
		for(User u:list){
		if(name.equals(u.getUserName())){
			return "已经被注册重新输入";
		}
	}
		return "可以注册";
	}
	@RequestMapping("/outLogin")
	public String loginout(HttpSession session){
		session.invalidate();
		return "redirect:/index.jsp";
	}
}














