package ca.imazon.service;

import java.util.List;

import ca.imazon.common.pojo.EasyUiTreeNode;

public interface ItemCatService {

	List<EasyUiTreeNode> getItemCatList(long parentId);
}
