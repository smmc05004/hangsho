package kr.co.hangsho.company.service;

import java.util.List;

import kr.co.hangsho.company.vo.Company;
import kr.co.hangsho.review.vo.Review;

public interface CompanyService {
	
	void addNewCompany(Company company);
	void modifyCompanyInfo(int companyId);
	List<Company> getAllCompanies();
	Company getCompanyByUserName(String username);
	Company getCompanyByCompanyId(int Comapnyid);
	void changeCompany(Company company);
}
