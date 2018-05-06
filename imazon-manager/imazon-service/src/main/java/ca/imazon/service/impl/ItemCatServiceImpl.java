package ca.imazon.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ca.imazon.common.pojo.EasyUiTreeNode;
import ca.imazon.mapper.TbItemCatMapper;
import ca.imazon.pojo.TbItemCat;
import ca.imazon.pojo.TbItemCatExample;
import ca.imazon.pojo.TbItemCatExample.Criteria;
import ca.imazon.service.ItemCatService;

@Service
public class ItemCatServiceImpl implements ItemCatService {

	@Autowired
	private TbItemCatMapper itemCatMapper;

	@Override
	public List<EasyUiTreeNode> getItemCatList(long parentId) {

		TbItemCatExample example = new TbItemCatExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		List<TbItemCat> list = itemCatMapper.selectByExample(example);

		List<EasyUiTreeNode> results = new ArrayList<>();
		EasyUiTreeNode node = new EasyUiTreeNode();
		for (TbItemCat item : list) {
			node.setId(item.getId());
			node.setText(item.getName());
			node.setStatus(item.getIsParent()?"closed":"open");

			results.add(node);
		}
		return results;
	}

}
