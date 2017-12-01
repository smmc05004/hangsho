package kr.co.hangsho.web.code.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.web.code.mapper.CodeMapper;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeMapper codeMapper;
	
	@Override
	public void addCode(String code) {
		codeMapper.addCode(code);
	}

	@Override
	public String getCode() {
		return codeMapper.getCode();
	}

}
