package kr.co.hangsho.analysis.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.analysis.mappers.AnalysisChartMapper;
import kr.co.hangsho.analysis.vo.Analysis;
import kr.co.hangsho.orders.vo.OrderDetail;

@Service
public class AnalysisChartServiceImpl implements AnalysisChartService{

	@Autowired
	private AnalysisChartMapper chartMapper;
	
	@Override
	public List<Analysis> getChartData(Map<String, Object> criteria) {
		return chartMapper.getChartData(criteria);
	}

	@Override
	public List<Analysis> getCategoryData(Map<String, Object> criteria) {
		return chartMapper.getCategoryData(criteria);
	}

	@Override
	public List<Analysis> getMonthChart(Map<String, Object> criteria) {
		return chartMapper.getMonthChart(criteria);
	}

	@Override
	public List<Analysis> getMonthCategoryData(Map<String, Object> criteria) {
		return chartMapper.getMonthCategoryData(criteria);
	}

	@Override
	public List<Analysis> getSalesChartData(Map<String, Object> criteria) {
		return chartMapper.getSalesChartData(criteria);
	}

	@Override
	public List<Analysis> getSalesCategoryData(Map<String, Object> criteria) {
		return chartMapper.getSalesCategoryData(criteria);
	}

	@Override
	public List<Analysis> getMonthSalesChart(Map<String, Object> criteria) {
		return chartMapper.getMonthSalesChart(criteria);
	}

	@Override
	public List<Analysis> getMonthSalesCategoryData(Map<String, Object> criteria) {
		return chartMapper.getMonthSalesCategoryData(criteria);
	}

	@Override
	public List<OrderDetail> getDaysOrderDetailInfos(Map<String, Object> criteria) {
		return chartMapper.getDaysOrderDetailInfos(criteria);
	}

	@Override
	public int getTotalRowsForDaysOrder(Map<String, Object> criteria) {
		return chartMapper.getTotalRowsForDaysOrder(criteria);
	}

	@Override
	public List<OrderDetail> getMonthOrderDetailInfos(Map<String, Object> criteria) {
		return chartMapper.getMonthOrderDetailInfos(criteria);
	}

	@Override
	public int getTotalRowsForMonthOrder(Map<String, Object> criteria) {
		return chartMapper.getTotalRowsForMonthOrder(criteria);
	}
	
}
