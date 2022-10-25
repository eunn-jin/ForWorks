package com.kh.forworks.address.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.PageVo;
import com.kh.forworks.member.vo.MemberVo;

@Repository
public class AddressDaoImpl implements AddressDao {

	@Override
	public int updateEmpStatByNo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("addressMapper.updateEmpStatByNo", vo);
	}
	
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("addressMapper.selectCountAll");
	}
	
	@Override
	public List<MemberVo> selectAllMember(SqlSessionTemplate sst, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("addressMapper.selectAllMember", null, rowBounds);
	}




}
