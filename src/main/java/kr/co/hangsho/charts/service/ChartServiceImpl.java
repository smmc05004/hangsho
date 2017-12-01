package kr.co.hangsho.charts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.charts.mappers.ChartMapper;
import kr.co.hangsho.charts.vo.ProfitChart;
import kr.co.hangsho.web.criteria.CriteriaForChart;

@Service
public class ChartServiceImpl implements ChartService{

	@Autowired
	ChartMapper chartMapper;
	
	@Override
	public List<ProfitChart> getDailyChart(CriteriaForChart c) {
		return chartMapper.getDailyChart(c);
	}

	@Override
	public List<ProfitChart> getMonthChart(CriteriaForChart c) {
		return chartMapper.getMonthChart(c);
	}

	@Override
	public List<ProfitChart> getYearChart(CriteriaForChart c) {
		return chartMapper.getYearChart(c);
	}

	@Override
	public List<ProfitChart> getMothChartByCompany(CriteriaForChart c) {
		return chartMapper.getMothChartByCompany(c);
	}

	@Override
	public List<ProfitChart> getDailyChartByCompany(CriteriaForChart c) {
		return chartMapper.getDailyChartByCompany(c);
	}

	@Override
	public List<ProfitChart> getAllDailyChart(CriteriaForChart c) {
		return chartMapper.getAllDailyChart(c);
	}

	@Override
	public List<ProfitChart> getAllDailyCategoryChart(CriteriaForChart c) {
		return chartMapper.getAllDailyCategoryChart(c);
	}

	@Override
	public List<ProfitChart> getAllMonthChart(CriteriaForChart c) {
		return chartMapper.getAllMonthChart(c);
	}

	@Override
	public List<ProfitChart> getAllMonthCategoryChart(CriteriaForChart c) {
		return chartMapper.getAllMonthCategoryChart(c);
	}


}
