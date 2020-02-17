package com.hexudong.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.hexudong.cms.common.JsonResult;
import com.hexudong.cms.pojo.Link;
import com.hexudong.cms.service.LinkService;

@Controller
@RequestMapping("/admin/link/")
public class LinkController {
	@Autowired
	private LinkService linkService;
	/**
	 * @Title: getPageInfo   
	 * @Description: 友情链接管理   
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("links")
	public String getPageInfo(Link link,@RequestParam(value="pageNum",defaultValue="1") Integer pageNum,Model model){
		PageInfo<Link> pageInfo = linkService.getPageInfo(link, pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "link/links";
	}
	/**
	 * @Title: save   
	 * @Description: 保存   
	 * @param: @param link
	 * @param: @return      
	 * @return: JsonResult      
	 * @throws
	 */
	@RequestMapping("save")
	public @ResponseBody JsonResult save(Link link){
		linkService.save(link);
		return JsonResult.sucess();
	}
	/**
	 * @Title: add   
	 * @Description: 添加／修改   
	 * @param: @param id
	 * @param: @param model
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("add")
	public String add(Integer id,Model model){
		if(id!=null) {
			Link link = linkService.getById(id);
			model.addAttribute("link", link);
		}
		return "link/add";
	}
}
