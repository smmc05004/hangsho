package kr.co.hangsho.privatedeal.service;

import java.util.List;

import kr.co.hangsho.privatedeal.vo.Pagination;
import kr.co.hangsho.privatedeal.vo.Request;

public interface RequestService {
	
	void addRequest(Request request);
	Request getRequest(int no);
	Request cancelRequest(int no);
	List<Request> getRequestListByBoardNo(Pagination pagination);
	Request denyRequest(int no);
	void approveRequest(int no);
	
	int getTotalRowsRequest(int no);
}
