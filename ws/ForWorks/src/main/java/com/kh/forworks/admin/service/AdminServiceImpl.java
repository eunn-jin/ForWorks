package com.kh.forworks.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.forworks.admin.dao.AdminDao;
import com.kh.forworks.admin.vo.AdminVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	private final AdminDao adminDao;
	
	private final SqlSessionTemplate sst;
	
	private final PasswordEncoder pwdEnc;
	
	public AdminServiceImpl(SqlSessionTemplate sst, PasswordEncoder pwdEnc, AdminDao adminDao) {
		this.adminDao = adminDao;
		this.sst = sst;
		this.pwdEnc = pwdEnc;
	}

	//관리자 로그인
	@Override
	public AdminVo login(AdminVo vo) {
		AdminVo dbAdmin = adminDao.selectOneById(sst, vo);
		
		if(dbAdmin != null && pwdEnc.matches(vo.getManPwd(), dbAdmin.getManPwd())) {
			return dbAdmin;
		} else {
			return null;
		}
	}

}
