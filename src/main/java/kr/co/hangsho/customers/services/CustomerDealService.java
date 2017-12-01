package kr.co.hangsho.customers.services;

import java.util.List;

import kr.co.hangsho.privatedeal.vo.Deal;
import kr.co.hangsho.privatedeal.vo.Privatedeal;
import kr.co.hangsho.privatedeal.vo.Request;
import kr.co.hangsho.web.criteria.Criteria;

public interface CustomerDealService {
	
	List<Privatedeal> getSalesByCustomerNo(Criteria criteria);
	List<Privatedeal> getBuyByCustomerNo(Criteria criteria);
	List<Request> getSaleRequestsByCustomerNo(Criteria criteria);
	List<Request> getBuyRequestsByCustomerNo(Criteria criteria);
	
	void addDeal(Deal deal);
	List<Deal> getSoldList(Criteria criteria);
	List<Deal> getBoughtList(Criteria criteria);
	
	Deal getDealDetailByDealNo(int no);
	int getCashByBuyerId(int no);
	void payByDeal(Deal deal);
	Deal paymentByDeal(Deal deal);
	void cancelDealByDealNo(int no);
	void updateCash(Deal deal);
	void prUpdate(int no);
	void prcUpdate(int no);
	
	void productSend(Deal deal);
	void buyConfirm(int no);
	void sellerCash(Deal deal);
	
	int getTotalRows(int no);
	int getTotalRowsB(int no);
	int getTotalRowsSR(int no);
	int getTotalRowsBR(int no);
	int getTotalRowsSL(int no);
	int getTotalRowsBL(int no);
}
