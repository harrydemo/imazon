package ca.imazon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ca.imazon.pojo.TbItemDesc;
import ca.imazon.pojo.TbItemDescExample;

public interface TbItemDescMapper {
    int countByExample(TbItemDescExample example);

    int deleteByExample(TbItemDescExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbItemDesc record);

    int insertSelective(TbItemDesc record);

    List<TbItemDesc> selectByExample(TbItemDescExample example);

    TbItemDesc selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbItemDesc record, @Param("example") TbItemDescExample example);

    int updateByExample(@Param("record") TbItemDesc record, @Param("example") TbItemDescExample example);

    int updateByPrimaryKeySelective(TbItemDesc record);

    int updateByPrimaryKey(TbItemDesc record);
}