package kr.co.hangsho.customers.mappers;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.hangsho.customers.vo.Customer;

@Mapper
public interface CustomerMapper {
	
	Customer getCustomer(String customerId);
	void addCustomer(Customer customer);
	List<Customer> getCustomers();
	void updateCustomer(Customer customer);
	int getSeq();
	Customer getCustomerByNo(int id);
	void pointUpdate(@Param("point")int point, @Param("id") int id);
	void cashUpdate(int useCash);
	
}
