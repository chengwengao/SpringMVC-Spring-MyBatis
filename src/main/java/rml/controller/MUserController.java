package rml.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import rml.model.MUser;
import rml.service.MUserServiceI;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/muserController")
public class MUserController {

	private MUserServiceI muserService;

	public MUserServiceI getMuserService() {
		return muserService;
	}

	@Autowired
	public void setMuserService(MUserServiceI muserService) {
		this.muserService = muserService;
	}
	
	@RequestMapping(value="/listUser")
	public String listUser(HttpServletRequest request) {
		
		List <MUser> list = muserService.getAll();
		request.setAttribute("userlist", list);
		return "listUser";
	}

	//mmGridDemo页面
	@RequestMapping(value = "mmGridDemo")
	public String mmGridDemo(HttpServletRequest request){
		return "mmGridDemo";
	}

	//mmGridListUser页面
	@RequestMapping(value = "mmGridListUser")
	public String mmGridListUser(){
		return "mmGridListUser";
	}

	//mmGridListUser页面ajax请求
	@ResponseBody
	@RequestMapping(value = "mmGridListUserAjax")
	public List<MUser> mmGridListUser(HttpServletRequest request){
		List<MUser> list = muserService.getAll();
		return list;
	}

	//mmGridListUser页面分页请求
	@ResponseBody
	@RequestMapping(value = "mmGridListUserPager")
	public Map<String,Object> mmGridListUserPager(HttpServletRequest request){
		List<MUser> list = muserService.getAll();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("items",list);
		map.put("totalCount",list.size());
		return map;
	}

	@ResponseBody
	@RequestMapping(value="/gridManager/getUserGrid")
	public Map<String,Object> getUserGrid(){
		List <MUser> list = muserService.getAll();
		Map<String, Object> map = new HashMap<String, Object>();
		//根据gridManager插件前端调试信息发现data属性存放的是一个数组元素集合，参见/node_modules/GridManager/explainPlan目录下的截图说明
		map.put("data",list);
		map.put("totals",list.size());
        return map;
	}
	
	@RequestMapping(value="/addUser")
	public String addUser(MUser muser) {
			
		String id = UUID.randomUUID().toString();
		muser.setId(id);
		muserService.insert(muser);
		return "redirect:/muserController/listUser.do";
	}
	
	@RequestMapping(value="/deleteUser")
	public String deleteUser(String id) {
		
		muserService.delete(id);
		return "redirect:/muserController/listUser.do";
	}
	
	@RequestMapping(value="/updateUserUI")
	public String updateUserUI(String id, HttpServletRequest request) {
		
		MUser muser = muserService.selectByPrimaryKey(id);
		request.setAttribute("user", muser);
		return "updateUser";
	}

	@RequestMapping(value="/updateUser")
	public String updateUser(MUser muser) {
		
		muserService.update(muser);
		return "redirect:/muserController/listUser.do";
	}
}
