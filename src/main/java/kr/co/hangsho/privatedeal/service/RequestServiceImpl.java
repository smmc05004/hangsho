package kr.co.hangsho.privatedeal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.codes.vo.Code;
import kr.co.hangsho.privatedeal.mappers.PrivatedealMapper;
import kr.co.hangsho.privatedeal.mappers.RequestMapper;
import kr.co.hangsho.privatedeal.vo.Pagination;
import kr.co.hangsho.privatedeal.vo.Privatedeal;
import kr.co.hangsho.privatedeal.vo.Request;

@Service
public class RequestServiceImpl implements RequestService {
	
	@Autowired
	PrivatedealMapper privatedealMapper;
	
	@Autowired
	RequestMapper requestMapper;
	
	@Override
	public void addRequest(Request request) {
		
		Privatedeal board = privatedealMapper.getBoardByNo(request.getBoard().getId());
		
		Code division = new Code();
		if ( "S".equals(board.getDivision().getId()) ) {
			division.setId("B");
		} else {
			division.setId("S");
		}
		
		request.setDivision(division);
		
		requestMapper.addRequest(request);
	}

	@Override
	public Request cancelRequest(int no) {
		
		Request request = requestMapper.getRequest(no);
		
		requestMapper.cancelRequest(no);
		
		return request;
	}

	@Override
	public List<Request> getRequestListByBoardNo(Pagination pagination) {
		return requestMapper.getRequestListByBoardNo(pagination);
	}

	@Override
	public Request denyRequest(int no) {
		
		Request request = requestMapper.getRequest(no);
		
		requestMapper.denyRequest(no);
		
		return request;
	}

	@Override
	public void approveRequest(int no) {
		requestMapper.approveRequest(no);
	}

	@Override
	public Request getRequest(int no) {
		return requestMapper.getRequest(no);
	}

	@Override
	public int getTotalRowsRequest(int no) {
		return requestMapper.getTotalRowsRequest(no);
	}
}
