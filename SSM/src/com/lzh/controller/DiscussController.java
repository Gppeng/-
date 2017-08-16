package com.lzh.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lzh.domain.Discuss;
import com.lzh.domain.Page;
import com.lzh.service.DiscussService;
import com.lzh.util.ResponseUtil;

@Controller
@RequestMapping(value="/discuss")
public class DiscussController {
	@Resource(name=DiscussService.SERVER_NAME)
	private DiscussService ds;
	public DiscussService getDs() {
		return ds;
	}
	public void setDs(DiscussService ds) {
		this.ds = ds;
	}
	@RequestMapping("/list")
	public String listAll(@RequestParam(value="page",required=false) String page,@RequestParam(value="rows",required=false) String rows,Discuss discuss,HttpServletResponse response) throws Exception{
		Page p=new Page(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<String, Object>();
		List<Discuss> dis_list=ds.getAll(p);
		JSONObject result=new JSONObject();
		JSONArray array=JSONArray.fromObject(dis_list);
		Long total=ds.getTotal();
		map.put("dis_list", dis_list);
		map.put("total", total);
		result.put("discuss", discuss);
		result.put("rows", array);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return "/admin/discuss.jsp";
	}
	@RequestMapping("/listByNid")
	public String listByNid(@RequestParam("nid") String nid,Discuss discuss,HttpServletResponse response) throws Exception{
		List<Discuss> list=ds.getByNid(Integer.parseInt(nid));
		ResponseUtil.write(response, list);
		return "/new01.jsp";
	}
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids") String ids,HttpServletResponse response) throws Exception{
		String idsStr[]=ids.split(",");
		JSONObject jsonObject=new JSONObject();
		for(String id:idsStr){
			ds.delete(Integer.parseInt(id));
		}
		jsonObject.put("success", true);
		ResponseUtil.write(response, jsonObject);
		return "/admin/discuss.jsp";
	}
	@RequestMapping("/save")
	public String save(Discuss discuss,HttpServletResponse response) throws Exception{
		int resultTotal =ds.insert(discuss);
		JSONObject jsonObject = new JSONObject();
		if(resultTotal > 0){
			jsonObject.put("success", true);
		}else{
			jsonObject.put("success", false);
		}
		ResponseUtil.write(response, jsonObject);
		return "/admin/discuss.jsp";
	}
	//直接发表评论
	@RequestMapping("/insert")
	public String insert(@RequestParam("nid") String nid,
						@RequestParam("uid") String uid,
						Discuss discusss,
						HttpServletRequest request){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String post_time=dateFormat.format(new Date());
		Discuss discuss=new Discuss(Integer.parseInt(uid),post_time,discusss.getContent(),Integer.parseInt(nid),0);
		ds.insertDiscuss(discuss);
		request.setAttribute("nid", nid);
		return "redirect:/news/getId.do?gid="+nid;
	}
	@RequestMapping("/godiscuss")
	public String godiscuss(@RequestParam("id") String id,@RequestParam("nid") String nid,HttpServletRequest request){
		Discuss discuss=ds.getById(Integer.parseInt(id));
		request.setAttribute("discuss", discuss);
		request.setAttribute("nid", nid);
		request.setAttribute("did", id);
		return "/rediscuss.jsp";
	}
	@RequestMapping("/rediscuss")
	public String insertre(@RequestParam("nid") String nid,
						@RequestParam("uid") String uid,
						@RequestParam("did") String did,
						Discuss discusss,
						HttpServletRequest request){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String post_time=dateFormat.format(new Date());
		Discuss discuss=new Discuss(Integer.parseInt(uid),post_time,discusss.getContent(),Integer.parseInt(nid),Integer.parseInt(did));
		ds.insertDiscuss(discuss);
		return "redirect:/discuss/godiscuss.do?nid="+nid+"&id="+did;
	}
}
