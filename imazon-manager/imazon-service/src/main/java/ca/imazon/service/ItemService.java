package ca.imazon.service;

import ca.imazon.common.pojo.EasyUiDataGridResult;
import ca.imazon.pojo.TbItem;


public interface ItemService {

	public TbItem getItemById(Long itemId);
	public EasyUiDataGridResult getItemList(int pageNum, int pageSize);
}
