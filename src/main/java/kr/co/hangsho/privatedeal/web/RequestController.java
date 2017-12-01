package kr.co.hangsho.privatedeal.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangsho.customers.services.CustomerDealService;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.privatedeal.service.PrivatedealService;
import kr.co.hangsho.privatedeal.service.RequestService;
import kr.co.hangsho.privatedeal.vo.Deal;
import kr.co.hangsho.privatedeal.vo.Pagination;
import kr.co.hangsho.privatedeal.vo.Privatedeal;
import kr.co.hangsho.privatedeal.vo.Request;
import kr.co.hangsho.privatedeal.web.form.RequestForm;

@Controller
public class RequestController {
	
	@Autowired
	RequestService requestService;
	@Autowired
	CustomerDealService customerDealService;
	@Autowired
	PrivatedealService privatedealService;
	
	@RequestMapping("/addRequest.do")
	public String addRequest(RequestForm requestForm, HttpSession httpSession) {
		
		Request request = new Request();
		BeanUtils.copyProperties(requestForm, request);
		
		Privatedeal board = new Privatedeal();
		board.setId(requestForm.getBoardNo());
		request.setBoard(board);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		if (loginInfo == null) {
			return "redirect:/customers/login.do?error=deny";
		}		
		Customer requestor = new Customer();
		if ("CUSTOMER".equals(loginInfo.get("USER_TYPE"))) {
			requestor = (Customer) loginInfo.get("LOGIN_USER");
		}		
		request.setRequestor(requestor);				
		
		requestService.addRequest(request);
		
		return "redirect:/merona/detail.do?no=" + requestForm.getBoardNo();
	}
	
	@RequestMapping("/cancelrequest.do")
	@ResponseBody
	public Request cancelRequest(int requestNo) {
		
		Request request = requestService.cancelRequest(requestNo);		
		
		return request;
	}
	
	@RequestMapping("/getRequests.do")
	@ResponseBody
	public Map<String, Object> getRequests(Pagination pagination) {
		
	 	int totalRows = requestService.getTotalRowsRequest(pagination.getBoardNo());
	 	pagination.setTotalRows(totalRows);
		
		List<Request> requests = requestService.getRequestListByBoardNo(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("requests", requests);
		map.put("navi", pagination);		
		
		return map;
	}
	
	@RequestMapping("/denyRequest.do")
	@ResponseBody
	public Request denyRequest(int requestNo) {
		
		return requestService.denyRequest(requestNo);
	}
	
	@RequestMapping("/approveRequest.do")
	public String approveRequest(@RequestParam(value="requests")int[] rno, int boardNo) {		
		
		Privatedeal privatedeal = privatedealService.getMeronaByNo(boardNo);
		int boardWriter = privatedeal.getCustomer().getId();
		
		for (int no : rno) {
			Deal deal = new Deal();
			Privatedeal board = new Privatedeal();
			
			requestService.approveRequest(no);
			
			Request request = requestService.getRequest(no);
			int requestor = request.getRequestor().getId();
			if ("B".equals(request.getDivision().getId())) {
				Customer buyer = new Customer();
				buyer.setId(requestor);
				deal.setBuyer(buyer);
				
				Customer seller = new Customer();
				seller.setId(boardWriter);
				deal.setSeller(seller);
			} else {
				Customer buyer = new Customer();
				buyer.setId(boardWriter);
				deal.setBuyer(buyer);
				
				Customer seller = new Customer();
				seller.setId(requestor);
				deal.setSeller(seller);				
			}
			board.setId(boardNo);
			deal.setBoard(board);
			customerDealService.addDeal(deal);
		}		
		
		return "redirect:/customers/deal.do";
	}
	
	@RequestMapping("/approveRequestB.do")
	public String approveRequestB(@RequestParam(value="requests")int[] rno, int boardNo) {		
		
		Privatedeal privatedeal = privatedealService.getMeronaByNo(boardNo);
		int boardWriter = privatedeal.getCustomer().getId();
		
		for (int no : rno) {
			Deal deal = new Deal();
			Privatedeal board = new Privatedeal();
			
			requestService.approveRequest(no);
			
			Request request = requestService.getRequest(no);
			int requestor = request.getRequestor().getId();
			if ("B".equals(request.getDivision().getId())) {
				Customer buyer = new Customer();
				buyer.setId(requestor);
				deal.setBuyer(buyer);
				
				Customer seller = new Customer();
				seller.setId(boardWriter);
				deal.setSeller(seller);
			} else {
				Customer buyer = new Customer();
				buyer.setId(boardWriter);
				deal.setBuyer(buyer);
				
				Customer seller = new Customer();
				seller.setId(requestor);
				deal.setSeller(seller);				
			}
			board.setId(boardNo);
			deal.setBoard(board);
			customerDealService.addDeal(deal);
		}		
		
		return "redirect:/customers/buyBoardList.do";
	}
	
}
