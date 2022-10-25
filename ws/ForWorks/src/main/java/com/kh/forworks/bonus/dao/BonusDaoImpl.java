package com.kh.forworks.bonus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.bonus.vo.BenefitVo;
import com.kh.forworks.bonus.vo.BonusMemVo;
import com.kh.forworks.bonus.vo.BonusVo;
import com.kh.forworks.member.vo.MemberVo;

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
		List result = sst.selectList("bonusMapper.selectEmp" , depart);
		return result;
	}
	//�޾ƿ� ȸ����ȣ ������ ������ȸ
	@Override
	public List<BenefitVo> selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectList("bonusMapper.selectOne" , no);
	}
	//�������
	@Override
	public int updateOne(SqlSessionTemplate sst, BenefitVo vo) {
		return sst.update("bonusMapper.updateOne" , vo);
	}
	//������ �����������
	@Override
	public int insertBenefitEmp(SqlSessionTemplate sst, BenefitVo vo) {
		return sst.insert("bonusMapper.insertBenefit" , vo);
	}
	
	//�󿩱���Ʈ
	
	//�󿩱� �����ȸ(ȭ��)
	@Override
	public List<BonusVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("bonusMapper.bonusList");
	}
	//�󿩱� ��� ajax
	@Override
	public int insertBonus(SqlSessionTemplate sst,BonusVo bv) {
		return sst.insert("bonusMapper.insertBonus" , bv);
	}
	//�⵵�� �󿩱� ��ȸ
	@Override
	public List<BonusVo> selectYearList(SqlSessionTemplate sst, String year) {
		return sst.selectList("bonusMapper.selectYearList" , year);
	}
	//�󿩱� �ش� ������ȸ
	@Override
	public List<BonusMemVo> selectMem(SqlSessionTemplate sst, String no) {
		return sst.selectList("bonusMapper.selectMemList", no);
	}
	//�󿩱� �ش� �����߰�
	@Override
	public int insertAddEmp(SqlSessionTemplate sst, BonusMemVo bmv) {
		System.out.println("dao���� bmv" + bmv);
		int result = sst.insert("bonusMapper.insertAddEmp" , bmv);
		System.out.println(result);
		return result;
	}
	//������ �Է½� ���޾װ��
	@Override
	public int selectCalc(SqlSessionTemplate sst,BonusMemVo bmv) {
		System.out.println("���� ������ DAO : "+ bmv.getRate());
		System.out.println("���� ������ȣ DAO : "+bmv.getEmpNo());
		int result = sst.selectOne("bonusMapper.selectCalc", bmv);
		System.out.println("���� ��" + result);
		return result;
	}

}
