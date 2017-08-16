package com.lzh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lzh.domain.Advertise;
import com.lzh.domain.Page;
import com.lzh.service.AdvertiseService;
import com.lzh.util.ResponseUtil;

@Controller
@RequestMapping(value="/advertise")
public class AdvertiseController {
	@Resource(name=AdvertiseService.SERVER_NAME)
	private AdvertiseService as;
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false) String page,@RequestParam(value="rows",required=false) String rows,Advertise advertise,HttpServletResponse response) throws Exception{
		Page p=new Page(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<String, Object>();
		List<Advertise> list=as.getAll(p);
		JSONObject result=new JSONObject();
		JSONArray array=JSONArray.fromObject(list);
		Long total=as.getTotal();
		map.put("advertise_list", list);
		map.put("total", total);
		result.put("rows", array);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return "/admin/advertise.jsp";
	}
	@RequestMapping("/save")
	public String save(Advertise advertise,HttpServletResponse response) throws Exception{
		int resultTotal=0;
		if(advertise.getId()==0){
			resultTotal=as.insert(advertise);
		}else{
			resultTotal=as.update(advertise);
		}
		JSONObject jsonObject = new JSONObject();
		if(resultTotal > 0){   //说明修改或添加成功
			jsonObject.put("success", true);
		}else{
			jsonObject.put("success", false);
		}
		ResponseUtil.write(response, jsonObject);
		return "/admin/advertise.jsp";
	}
	
}
