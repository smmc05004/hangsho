package kr.co.hangsho.web.code.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CodeMapper {
	void addCode(String code);
	String getCode();
}
