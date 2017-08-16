package com.lzh.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lzh.domain.News;
import com.lzh.domain.Page;
import com.lzh.service.NewsService;

@Controller
@RequestMapping(value="/news")
public class NewsController {
	@Resource(name=NewsService.SERVER_NAME)
	private NewsService ns;
	@RequestMapping("/list.do")
	public String getList(ModelMap map,Page page,HttpServletRequest request){
		request.setAttribute("pageIndex", page.getPageIndex());
		List<News> list=ns.getNews(page);
		System.out.println(page.getPageIndex());
		request.setAttribute("news_list", list);
		map.addAttribute("news_list",list);
		return "/admin/admin_news.jsp";
	}
	@RequestMapping("/listjsp.do")
	public String getListjsp(ModelMap map,Page page,HttpServletRequest request){
		request.setAttribute("pageIndex", page.getPageIndex());
		List<News> list=ns.getNews(page);
		System.out.println(page.getPageIndex());
		request.setAttribute("news_list", list);
		map.addAttribute("news_list",list);
		return "/index.jsp";
	}
	@RequestMapping("/delete.do")
	public ModelAndView delete(int id){
		ModelAndView mav=new ModelAndView();
		ns.deleteNews(id);
		mav.setViewName("redirect:/news/list.do?pageIndex=1&pageNum=10");
		return mav;
	}
	@RequestMapping(value="/insert.do")
	public String insert(@RequestParam("attpic") MultipartFile file,
						 @RequestParam("title") String title,
						 @RequestParam("content") String content,
						 @RequestParam("editor") String editor,
						 @RequestParam("post_time") String post_time,
						 @RequestParam("type") String type,
						 @RequestParam("readcount") int readcount,
						 @RequestParam("href") String href,
						 HttpServletRequest request,HttpServletResponse response){
		
		String fileName=file.getOriginalFilename();
		String path=request.getSession().getServletContext().getRealPath("/upload/");
		File myFile = new File(path,fileName);
		try {
			file.transferTo(myFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		News news=new News(title,content,editor,post_time,type,"upload"+"/"+fileName,readcount,href);
		ns.insertNews(news);
		return "/news/list.do?pageIndex=1&pageNum=10";
	}
	@RequestMapping("/getById")
	public String getById(ModelMap map,@RequestParam int id,HttpServletRequest request){
		List<News> news=ns.getNew(id);
		request.setAttribute("new_list", news);
		map.addAttribute("new_list",news);
		return "/admin/admin_news.jsp";
	}
	@RequestMapping("/getId")
	public String getByIdIndex(ModelMap map,String gid,HttpServletRequest request){
		int id=Integer.parseInt(gid);
		News news=ns.getOne(id);
		request.setAttribute("news", news);
		request.setAttribute("gid", gid);
		map.addAttribute("news",news);
		return "/new01.jsp";
	}
	@RequestMapping("/listByType")
	public String getByType(@RequestParam(value="type") String type,ModelMap map,Page page,HttpServletRequest request){
		request.setAttribute("pageIndex", page.getPageIndex());
		List<News> list=ns.getNewsByType(type);
		for(News news:list){
		System.out.println(news.getAttpic());
		}
		request.setAttribute("news_list", list);
		map.addAttribute("news_list", list);
		return "/industry.jsp";
	}
}
