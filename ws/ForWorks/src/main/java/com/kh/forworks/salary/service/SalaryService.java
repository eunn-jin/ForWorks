package com.kh.forworks.salary.service;

import java.util.List;

public interface SalaryService {

	//�μ���ȸ
	List selectDepartList();
	//�μ��� ������
	List selectEmp(String depart);

}
