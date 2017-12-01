package kr.co.hangsho.customers.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangsho.customers.services.CustomerDealService;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.privatedeal.vo.Deal;

@Controller
@RequestMapping("/deal")
public class DealController {
	
	@Autowired
	CustomerDealService customerDealService;
	
	@RequestMapping("/detail.do")
	public String dealdetail(int no, Model model) {
		
		Deal deal = customerDealService.getDealDetailByDealNo(no);
		
		model.addAttribute("deal", deal);
		
		return "/privatedeal/dealdetail";
	}
	
	@RequestMapping("/payment.do")
	@ResponseBody
	public Deal payment(int payment, int buyerId, int dealId) {
		
		Deal deal = new Deal();
		
		int cash = customerDealService.getCashByBuyerId(buyerId);
		
		if (payment > cash) {
			throw new RuntimeException();
		} else {
			deal.setId(dealId);
			Customer buyer = new Customer();
			buyer.setId(buyerId);
			deal.setBuyer(buyer);
			deal.setPayment(payment);			
			
			customerDealService.payByDeal(deal);
		}
		
		Deal dealDetail = customerDealService.paymentByDeal(deal);		
		
		return dealDetail;
	}
	
	@RequestMapping("/cancel.do")
	public String cancelDeal(int no, int buyerId) {		
		
		Deal deal = customerDealService.getDealDetailByDealNo(no);
		System.out.println(deal.getPayment());
		Deal deal2 = new Deal();
		Customer buyer = new Customer();
		deal2.setId(no);
		buyer.setId(buyerId);
		deal2.setBuyer(buyer);
		deal2.setPayment(deal.getPayment());
		
		customerDealService.updateCash(deal2);
		
		customerDealService.cancelDealByDealNo(no);
		
		return "redirect:/deal/detail.do?no=" + no;
	}
	
	@RequestMapping("/pr.do")
	public String prUpdate(int no) {
		customerDealService.prUpdate(no);
		
		return "redirect:/deal/detail.do?no=" + no;
	}
	
	@RequestMapping("/prc.do")
	public String prcUpdate(int no) {
		customerDealService.prcUpdate(no);
		
		return "redirect:/deal/detail.do?no=" + no;
	}
	
	@RequestMapping("/productSend.do")
	public String productSend(int dealNo, String dscCode, String transportNumber) {
		
		Deal deal = new Deal();
		deal.setId(dealNo);
		deal.setDscCode(dscCode);
		deal.setTransportNumber(transportNumber);
		
		customerDealService.productSend(deal);
		
		return "redirect:/deal/detail.do?no=" + dealNo;
	}
	
	@RequestMapping("/buyConfirm.do")
	public String buyConfirm(int no) {
		
		Deal dealInfo = customerDealService.getDealDetailByDealNo(no);
		
		Deal deal = new Deal();
		
		deal.setId(no);
		deal.setPayment(dealInfo.getPayment());
		Customer seller = new Customer();
		seller.setId(dealInfo.getSeller().getId());
		deal.setSeller(seller);
		
		customerDealService.buyConfirm(no);
		customerDealService.sellerCash(deal);
		
		return "redirect:/deal/detail.do?no=" + no;
	}
}
