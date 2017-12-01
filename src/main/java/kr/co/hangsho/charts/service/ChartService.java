package kr.co.hangsho.charts.service;

import java.util.List;

import kr.co.hangsho.charts.vo.ProfitChart;
import kr.co.hangsho.web.criteria.CriteriaForChart;

public interface ChartService {
	
	List<ProfitChart> getDailyChart(CriteriaForChart c);
	List<ProfitChart> getMonthChart(CriteriaForChart c);
	List<ProfitChart> getYearChart(CriteriaForChart c);
	List<ProfitChart> getMothChartByCompany(CriteriaForChart c);
	List<ProfitChart> getDailyChartByCompany(CriteriaForChart c);
	List<ProfitChart> getAllDailyChart(CriteriaForChart c);
	List<ProfitChart> getAllDailyCategoryChart(CriteriaForChart c);
	List<ProfitChart> getAllMonthChart(CriteriaForChart c);
	List<ProfitChart> getAllMonthCategoryChart(CriteriaForChart c);
}
