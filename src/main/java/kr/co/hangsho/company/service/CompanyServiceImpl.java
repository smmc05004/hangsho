package kr.co.hangsho.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.hangsho.company.mappers.CompanyMapper;
import kr.co.hangsho.company.vo.Company;
import kr.co.hangsho.review.vo.Review;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyMapper companyMapper;
	
	@Override
	public void addNewCompany(Company company) {
		int companySeq = companyMapper.getSeq();
		company.setId(companySeq);
		
		companyMapper.addCompany(company);
	}

	@Override
	public void modifyCompanyInfo(int companyId) {
		companyMapper.modifyCompany(companyId);
	}

	@Override
	public List<Company> getAllCompanies() {
		return companyMapper.getCompanies();
	}

	@Override
	public Company getCompanyByUserName(String username) {
		return companyMapper.getCompanyByUserName(username);
	}
	@Override
	public Company getCompanyByCompanyId(int Comapnyid) {
		return companyMapper.getCompanyById(Comapnyid);
	}

	@Override
	public void changeCompany(Company company) {
		companyMapper.changeCompany(company);
	}

}
