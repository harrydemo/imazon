package ca.imazon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ca.imazon.common.pojo.EasyUiDataGridResult;
import ca.imazon.pojo.TbItem;
import ca.imazon.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;

	@RequestMapping("/item/{itemId}")
	@ResponseBody
	private TbItem getItemById(@PathVariable Long itemId) {
		TbItem tbItem = itemService.getItemById(itemId);
		return tbItem;
	}
	
	@RequestMapping("/item/list")
	@ResponseBody
	public EasyUiDataGridResult getItemList(@RequestParam("page") Integer pageNum, @RequestParam("rows") Integer pageSize) {
		EasyUiDataGridResult result = itemService.getItemList(pageNum, pageSize);
		return result;
	}
}
