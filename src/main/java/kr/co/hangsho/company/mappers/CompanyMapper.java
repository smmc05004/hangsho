package kr.co.hangsho.company.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.company.vo.Company;
import kr.co.hangsho.review.vo.Review;

@Mapper
public interface CompanyMapper {

	int getSeq();
	void addCompany(Company company);
	void modifyCompany(int companyIds);
	List<Company> getCompanies();
	Company getCompanyByUserName(String username);
	Company getCompanyById(int id);
	void changeCompany(Company company);
}
