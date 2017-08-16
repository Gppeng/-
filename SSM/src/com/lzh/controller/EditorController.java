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

import com.lzh.domain.Editor;
import com.lzh.domain.Page;
import com.lzh.service.EditorService;
import com.lzh.util.ResponseUtil;

@Controller
@RequestMapping(value="editor")
public class EditorController {
	@Resource(name=EditorService.SERVER_NAME)
	private EditorService es;
	@RequestMapping("/list")
	public String list(Editor editor,@RequestParam(value="page",required=false) String page, @RequestParam(value="rows",required=false) String rows,HttpServletResponse response) throws Exception{
		Page p=new Page(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<String, Object>();
		List<Editor> list=es.getAll(p);
		Long total=es.getTotal();
		map.put("editor_list", list);
		map.put("rows", rows);
		map.put("total",total);
		JSONObject result=new JSONObject();
		JSONArray array=JSONArray.fromObject(list);
		result.put("rows", array);
		result.put("total", total);
		ResponseUtil.write(response, array);
		return "/admin/editor.jsp";
	}
	@RequestMapping("/save")
	public String save(HttpServletResponse response,Editor editor) throws Exception{
		int resultTotal=0;
		if(editor.getId()==0){
			es.insert(editor);
		}else{
			es.update(editor);
		}
		JSONObject jsonObject=new JSONObject();
		if(resultTotal>0){
			jsonObject.put("success", true);
		}else{
			jsonObject.put("success", false);
		}
		ResponseUtil.write(response, jsonObject);
		return "/admin/editor.jsp";
	}
}
