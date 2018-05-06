package ca.imazon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ca.imazon.common.pojo.EasyUiDataGridResult;
import ca.imazon.mapper.TbItemMapper;
import ca.imazon.pojo.TbItem;
import ca.imazon.pojo.TbItemExample;
import ca.imazon.pojo.TbItemExample.Criteria;
import ca.imazon.service.ItemService;



@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private TbItemMapper itemMapper;

	@Override
	public TbItem getItemById(Long itemId) {
		// TbItem item = itemMapper.selectByPrimaryKey(itemId);
		TbItemExample example = new TbItemExample();
		// 创建查询条件
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(itemId);
		List<TbItem> list = itemMapper.selectByExample(example);
		// 判断list中是否为空
		TbItem item = null;
		if (list != null && list.size() > 0) {
			item = list.get(0);
		}
		return item;

	}

	@Override
	public EasyUiDataGridResult getItemList(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		TbItemExample example = new TbItemExample();
		List<TbItem> list = itemMapper.selectByExample(example);
		
		PageInfo<TbItem> pageInfo = new PageInfo<>(list);
		
		EasyUiDataGridResult result = new EasyUiDataGridResult();
		result.setTotal(pageInfo.getTotal());
		result.setRows(list);
		return result;
	}

	
}
