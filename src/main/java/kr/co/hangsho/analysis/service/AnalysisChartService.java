package kr.co.hangsho.analysis.service;

import java.util.List;
import java.util.Map;

import kr.co.hangsho.analysis.vo.Analysis;
import kr.co.hangsho.orders.vo.OrderDetail;

public interface AnalysisChartService {

	List<Analysis> getChartData(Map<String, Object> criteria);
	List<Analysis> getCategoryData(Map<String, Object> criteria);
	List<Analysis> getMonthChart(Map<String, Object> criteria);
	List<Analysis> getMonthCategoryData(Map<String, Object> criteria);
	
	List<Analysis> getSalesChartData(Map<String, Object> criteria);
	List<Analysis> getSalesCategoryData(Map<String, Object> criteria);
	List<Analysis> getMonthSalesChart(Map<String, Object> criteria);
	List<Analysis> getMonthSalesCategoryData(Map<String, Object> criteria);
	
	List<OrderDetail> getDaysOrderDetailInfos(Map<String, Object> criteria);
	int getTotalRowsForDaysOrder(Map<String, Object> criteria);
	
	List<OrderDetail> getMonthOrderDetailInfos(Map<String, Object> criteria);
	int getTotalRowsForMonthOrder(Map<String, Object> criteria);
}
