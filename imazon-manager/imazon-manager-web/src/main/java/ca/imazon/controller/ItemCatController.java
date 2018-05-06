package ca.imazon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ca.imazon.common.pojo.EasyUiTreeNode;
import ca.imazon.service.ItemCatService;

@Controller
@RequestMapping("/item/cat")
public class ItemCatController {

	@Autowired
	private ItemCatService catService;

	@RequestMapping("/list")
	@ResponseBody
	public List<EasyUiTreeNode> getItemCatList(@RequestParam(value = "id", defaultValue = "0") Long parentId) {

		List<EasyUiTreeNode> list = catService.getItemCatList(parentId);
		return list;
	}
}
