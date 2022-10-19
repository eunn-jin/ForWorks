package com.kh.forworks.bonus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.bonus.vo.BenefitVo;

@Repository
public class BonusDaoImpl implements BonusDao {

	//�����߰�
	@Override
	public int insertBenefit(SqlSessionTemplate sst, String title) {
		return sst.insert("bonusMapper.addBenefit" , title);
	}
	//��������ȸ
	@Override
	public List selectBenefit(SqlSessionTemplate sst) {
		return sst.selectList("bonusMapper.selectBenefit");
	}
	//�μ���ȸ
	@Override
	public List selectDepart(SqlSessionTemplate sst) {
		return sst.selectList("bonusMapper.selectDepart");
	}
	//�μ��� �����ȸ
	@Override
	public List selectEmp(SqlSessionTemplate sst , String depart) {
		
		System.out.println("dao���� depart" + depart);
		List result = sst.selectList("bonusMapper.selectEmp" , depart);
		System.out.println(result);
		return result;
	}
	//�޾ƿ� ȸ����ȣ ������ ������ȸ
	@Override
	public List<BenefitVo> selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectList("bonusMapper.selectOne" , no);
	}

}
