package kr.co.hangsho.charts.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.charts.vo.ProfitChart;
import kr.co.hangsho.web.criteria.CriteriaForChart;

@Mapper
public interface ChartMapper {
	
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
