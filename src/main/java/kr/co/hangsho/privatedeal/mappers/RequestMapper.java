package kr.co.hangsho.privatedeal.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.privatedeal.vo.Pagination;
import kr.co.hangsho.privatedeal.vo.Request;

@Mapper
public interface RequestMapper {

	void addRequest(Request request);
	Request getRequest(int no);
	void cancelRequest(int no);
	List<Request> getRequestListByBoardNo(Pagination pagination);
	void denyRequest(int no);
	void approveRequest(int no);
	
	int getTotalRowsRequest(int no);
}
