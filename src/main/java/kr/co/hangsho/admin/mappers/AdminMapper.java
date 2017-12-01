package kr.co.hangsho.admin.mappers;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.admin.vo.LoginHistory;

@Mapper
public interface AdminMapper {

	void addLoginHistory(LoginHistory loginHistory);
}
