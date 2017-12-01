package kr.co.hangsho.analysis.web;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.Period;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.hangsho.analysis.service.AnalysisChartService;
import kr.co.hangsho.analysis.vo.Analysis;
import kr.co.hangsho.company.vo.Company;
import kr.co.hangsho.item.mappers.ItemMapper;
import kr.co.hangsho.item.service.ItemService;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.orders.vo.OrderDetail;
import kr.co.hangsho.web.criteria.Criteria;

@Controller
@RequestMapping("/analysis")
public class AnalysisController {

	@Autowired
	private AnalysisChartService chartService;
	
	@Autowired
	private ItemService itemService;
	
	
	@RequestMapping("/profitforday.do")
	public String profitchartPage() {
		return "/analysis/profitforday";
	}
	/*하루 이익 구하기*/
	@RequestMapping("/getDayProfit.do")
	@ResponseBody
	public List<Analysis> getChartData(String beginday, String endday, String opt, String keyword, HttpSession httpSession) throws ParseException {
		
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		String startDateString[] = beginday.split("-"); 
		String endDateString[] = endday.split("-");
		LocalDate startDate = LocalDate.of(Integer.parseInt(startDateString[0]), Integer.parseInt(startDateString[1]), Integer.parseInt(startDateString[2]));
		LocalDate endDate = LocalDate.of(Integer.parseInt(endDateString[0]), Integer.parseInt(endDateString[1]), Integer.parseInt(endDateString[2]));
		
		Period period = startDate.until(endDate);
		
		criteria.put("beginDate", beginday);
		criteria.put("endDate", endday);
		criteria.put("dayGap", period.getDays());
		criteria.put("opt", opt);
		criteria.put("keyword", keyword);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		criteria.put("companyId", companyId);
		return chartService.getChartData(criteria);
	}
	/*하루 카테고리 이익 구하기*/
	@RequestMapping("/getCategoryProfit.do")
	@ResponseBody
	public List<Analysis> getCategoryData(String beginday, String endday, String opt, String keyword, HttpSession httpSession){
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		criteria.put("beginday", beginday);
		criteria.put("endday", endday);
		criteria.put("opt", opt);
		criteria.put("keyword", keyword);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		criteria.put("companyId", companyId);

		return chartService.getCategoryData(criteria);
	}
	
	@RequestMapping("/getDaysTable.do")
	@ResponseBody
	public Map<String, Object> getDaysTableData(Criteria criteria, HttpSession httpSession) {
		
		System.out.println("criteria : " + criteria);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("criteria", criteria);
		searchMap.put("companyId", companyId);
		
		int totalRows = chartService.getTotalRowsForDaysOrder(searchMap);
		criteria.setTotalRows(totalRows);
		
		List<OrderDetail> orderDetails = chartService.getDaysOrderDetailInfos(searchMap);
		searchMap.remove("companyId");
		searchMap.put("orderDetails", orderDetails);

		return searchMap;
	}
	
	@RequestMapping("/profitformonth.do")
	public String monthChartPage() {
		return "/analysis/profitformonth";
	}
	/*한 달 이익 구하기*/
	@RequestMapping("/getMonthProfit.do")
	@ResponseBody
	public List<Analysis> getMonthChartData(String endday, String opt, String keyword, HttpSession httpSession) throws ParseException {
		
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		criteria.put("endDate", endday);
		criteria.put("opt", opt);
		
		criteria.put("keyword", keyword);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		criteria.put("companyId", companyId);

		return chartService.getMonthChart(criteria);
	}
	/*한 달 카테고리 이익구하기*/
	@RequestMapping("/getMonthCategoryProfit.do")
	@ResponseBody
	public List<Analysis> getMonthCategoryData(String endday, String opt, String keyword, HttpSession httpSession) {
		
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		criteria.put("endday", endday);
		criteria.put("opt", opt);
		criteria.put("keyword", keyword);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		criteria.put("companyId", companyId);
		
		return chartService.getMonthCategoryData(criteria);
	}
	
	@RequestMapping("/salesforday.do")
	public String saleschartPage() {
		return "/analysis/salesforday";
	}
	/*하루 판매량 구하기*/
	@RequestMapping("/getDaySales.do")
	@ResponseBody
	public List<Analysis> getSalesdata(String beginday, String endday, String opt, String keyword, HttpSession httpSession) throws ParseException {

		Map<String, Object> criteria = new HashMap<String, Object>();
		
		String startDateString[] = beginday.split("-"); 
		String endDateString[] = endday.split("-");
		LocalDate startDate = LocalDate.of(Integer.parseInt(startDateString[0]), Integer.parseInt(startDateString[1]), Integer.parseInt(startDateString[2]));
		LocalDate endDate = LocalDate.of(Integer.parseInt(endDateString[0]), Integer.parseInt(endDateString[1]), Integer.parseInt(endDateString[2]));
		
		Period period = startDate.until(endDate);
		
		criteria.put("beginDate", beginday);
		criteria.put("endDate", endday);
		criteria.put("dayGap", period.getDays());
		criteria.put("opt", opt);
		criteria.put("keyword", keyword);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		criteria.put("companyId", companyId);
		
		return chartService.getSalesChartData(criteria);
	}
	/*하루 카테고리 판매량 구하기*/
	@RequestMapping("/getCategorySales.do")
	@ResponseBody
	public List<Analysis> getCategorySalesData(String beginday, String endday, String opt, String keyword, HttpSession httpSession){
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		criteria.put("beginday", beginday);
		criteria.put("endday", endday);
		criteria.put("opt", opt);
		criteria.put("keyword", keyword);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		criteria.put("companyId", companyId);
		
		return chartService.getSalesCategoryData(criteria);
	}
	
	@RequestMapping("/salesformonth.do")
	public String monthSalesChartPage() {
		return "/analysis/salesformonth";
	}
	
	@RequestMapping("/getMonthSales.do")
	@ResponseBody
	public List<Analysis> getMonthSalesChartData(String endday, String opt, String keyword, HttpSession httpSession) throws ParseException {
		
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		criteria.put("endDate", endday);
		criteria.put("opt", opt);
		criteria.put("keyword", keyword);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		criteria.put("companyId", companyId);
		
		return chartService.getMonthSalesChart(criteria);
	}
	/*한 달 카테고리 이익구하기*/
	@RequestMapping("/getMonthCategorySales.do")
	@ResponseBody
	public List<Analysis> getMonthSalesCategoryData(String endday, String opt, String keyword, HttpSession httpSession) {
		
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		criteria.put("endday", endday);
		criteria.put("opt", opt);
		criteria.put("keyword", keyword);
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();

		criteria.put("companyId", companyId);
		
		return chartService.getMonthSalesCategoryData(criteria);
	}
	
	@RequestMapping("/getMonthTable.do")
	@ResponseBody
	public Map<String, Object> getMonthTableData(String endday, Criteria criteria, HttpSession httpSession) {
		
		Map<String, Object> loginInfo = (Map) httpSession.getAttribute("LOGIN_INFO");
		Company company = (Company) loginInfo.get("LOGIN_USER");
		int companyId = company.getId();
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("criteria", criteria);
		searchMap.put("endday", endday);
		searchMap.put("companyId", companyId);
		
		int totalRows = chartService.getTotalRowsForMonthOrder(searchMap);
		criteria.setTotalRows(totalRows);
		
		List<OrderDetail> orderDetails = chartService.getMonthOrderDetailInfos(searchMap);
		searchMap.remove("companyId");
		searchMap.put("orderDetails", orderDetails);

		return searchMap;
	}
}
