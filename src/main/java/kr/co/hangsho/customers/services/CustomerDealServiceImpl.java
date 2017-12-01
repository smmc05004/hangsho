package kr.co.hangsho.customers.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.customers.mappers.CustomerDealMapper;
import kr.co.hangsho.privatedeal.vo.Deal;
import kr.co.hangsho.privatedeal.vo.Privatedeal;
import kr.co.hangsho.privatedeal.vo.Request;
import kr.co.hangsho.web.criteria.Criteria;

@Service
public class CustomerDealServiceImpl implements CustomerDealService {
	
	@Autowired
	CustomerDealMapper customerDealMapper;

	@Override
	public List<Privatedeal> getSalesByCustomerNo(Criteria criteria) {
		return customerDealMapper.getSalesByCustomerNo(criteria);
	}

	@Override
	public List<Privatedeal> getBuyByCustomerNo(Criteria criteria) {
		return customerDealMapper.getBuyByCustomerNo(criteria);
	}

	@Override
	public List<Request> getSaleRequestsByCustomerNo(Criteria criteria) {
		return customerDealMapper.getSaleRequestsByCustomerNo(criteria);
	}

	@Override
	public List<Request> getBuyRequestsByCustomerNo(Criteria criteria) {
		return customerDealMapper.getBuyRequestsByCustomerNo(criteria);
	}

	@Override
	public void addDeal(Deal deal) {
		customerDealMapper.addDeal(deal);
	}
	
	@Override
	public List<Deal> getSoldList(Criteria criteria) {
		return customerDealMapper.getSoldList(criteria);
	}

	@Override
	public List<Deal> getBoughtList(Criteria criteria) {
		return customerDealMapper.getBoughtList(criteria);
	}
	
	@Override
	public Deal getDealDetailByDealNo(int no) {
		return customerDealMapper.getDealDetailByDealNo(no);
	}

	@Override
	public int getCashByBuyerId(int no) {
		return customerDealMapper.getCashByBuyerId(no);
	}

	@Override
	public void payByDeal(Deal deal) {		
		customerDealMapper.payByDeal(deal);	
	}

	@Override
	public Deal paymentByDeal(Deal deal) {
		
		customerDealMapper.paymentByDeal(deal);
		
		Deal dealDetail = customerDealMapper.getDealDetailByDealNo(deal.getId());		
		
		return dealDetail;
	}

	@Override
	public void cancelDealByDealNo(int no) {		
		customerDealMapper.cancelDealByDealNo(no);
	}

	@Override
	public void updateCash(Deal deal) {
		customerDealMapper.updateCash(deal);
	}

	@Override
	public void prUpdate(int no) {
		customerDealMapper.prUpdate(no);
	}

	@Override
	public void prcUpdate(int no) {
		customerDealMapper.prcUpdate(no);
	}

	@Override
	public void productSend(Deal deal) {
		customerDealMapper.productSend(deal);
	}

	@Override
	public void buyConfirm(int no) {
		customerDealMapper.buyConfirm(no);
	}

	@Override
	public void sellerCash(Deal deal) {
		customerDealMapper.sellerCash(deal);
	}

	@Override
	public int getTotalRows(int no) {
		return customerDealMapper.getTotalRows(no);
	}

	@Override
	public int getTotalRowsB(int no) {
		return customerDealMapper.getTotalRowsB(no);
	}

	@Override
	public int getTotalRowsSR(int no) {
		return customerDealMapper.getTotalRowsSR(no);
	}

	@Override
	public int getTotalRowsBR(int no) {
		return customerDealMapper.getTotalRowsBR(no);
	}

	@Override
	public int getTotalRowsSL(int no) {
		return customerDealMapper.getTotalRowsSL(no);
	}

	@Override
	public int getTotalRowsBL(int no) {
		return customerDealMapper.getTotalRowsBL(no);			
	}	
	
}
