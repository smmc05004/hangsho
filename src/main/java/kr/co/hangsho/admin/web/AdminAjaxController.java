package kr.co.hangsho.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangsho.charts.service.ChartService;
import kr.co.hangsho.charts.vo.ProfitChart;
import kr.co.hangsho.qnas.services.QnaService;
import kr.co.hangsho.qnas.vo.Qna;
import kr.co.hangsho.web.code.CodeGenerator;
import kr.co.hangsho.web.criteria.CriteriaForChart;
import kr.co.hangsho.web.mail.service.MailService;

@Controller
@RequestMapping("/admin")
@PropertySource("classpath:/META-INF/mail.properties")
public class AdminAjaxController {

	@Autowired
	QnaService qnaService;
	@Autowired
	ChartService chartService;	
	@Autowired
	MailService mailService;
	@Value("${hangsho.mail.smtp.target}")
	String to;
	
	@RequestMapping("getprodaily.do")
	@ResponseBody
	public List<ProfitChart> getDailyChart(int itemId, String selectDate) {
		
		System.out.println(itemId);
		System.out.println(selectDate);
		CriteriaForChart c = new CriteriaForChart();
		c.setItemId(itemId);
		c.setSelectDate(selectDate);
		
		return chartService.getDailyChart(c);
	}
	
	@RequestMapping("getpromonth.do")
	@ResponseBody
	public List<ProfitChart> getMonthChart(CriteriaForChart c) {
		return chartService.getMonthChart(c);
	}
	
	@RequestMapping("getproyear.do")
	@ResponseBody
	public List<ProfitChart> getYearChart(CriteriaForChart c) {
		System.out.println(c);
		return chartService.getYearChart(c);
	}
	
	@RequestMapping("getqna.do")
	@ResponseBody
	public Qna getQnaByQnaId(int qnaId) {
		return qnaService.getQnaByQnaId(qnaId);
	}
	
	@RequestMapping("getmonthbycom.do")
	@ResponseBody
	public List<ProfitChart> getMonthChartByCom(CriteriaForChart c) {
		return chartService.getMothChartByCompany(c);
	}
	
	@RequestMapping("getdailybycom.do")
	@ResponseBody
	public List<ProfitChart> getDailyChartByCom(CriteriaForChart c) {
		return chartService.getDailyChartByCompany(c);
	}
	
	@RequestMapping("getdailyallcategory.do")
	@ResponseBody
	public List<ProfitChart> getdailyallCategory(CriteriaForChart c) {
		return chartService.getAllDailyCategoryChart(c);
	}
	
	@RequestMapping("getdailyall.do")
	@ResponseBody
	public List<ProfitChart> getDailyAll(CriteriaForChart c) {
		return chartService.getAllDailyChart(c);
	}
	

	@RequestMapping("getmonthall.do")
	@ResponseBody
	public List<ProfitChart> getMonthAll(CriteriaForChart c) {
		return chartService.getAllMonthChart(c);
	}
	

	@RequestMapping("getmonthallcategory.do")
	@ResponseBody
	public List<ProfitChart> getMonthallCategory(CriteriaForChart c) {
		return chartService.getAllMonthCategoryChart(c);
	}
	
	@RequestMapping("/send-code.do")
	@ResponseBody
	public String sendCode() {
		String result = "";
//		String result = "{'result' : '";
		result += mailService.sendMail(to, "Login Code", CodeGenerator.generateCode());
//		result += "'}";
		return result;
	}
}
