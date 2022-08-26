package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PhonebookDaoInter;
import vo.PhonebookVO;

@Service
public class PhonebookService implements PhonebookServiceInter{

	@Autowired
	PhonebookDaoInter dao;
	
	@Override
	public List<PhonebookVO> getList() {
		return dao.getList();
	}

	@Override
	public List<PhonebookVO> find(String search) {
		return dao.find(search);
	}

	@Override
	public int insert(PhonebookVO pb) {
		return dao.insert(pb);
	}

	@Override
	public PhonebookVO findOne(int idx) {
		return dao.findOne(idx);
	}

	@Override
	public int update(PhonebookVO pb) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(PhonebookVO pb) {
		// TODO Auto-generated method stub
		return 0;
	}
}
