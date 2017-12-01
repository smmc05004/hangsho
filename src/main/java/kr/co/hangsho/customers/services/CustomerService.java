package kr.co.hangsho.customers.services;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.hangsho.customers.vo.Customer;

public interface CustomerService {

	void addNewCustomer(Customer customer);
	void updateCustomerInfo(Customer customer);
	Customer getCustomerById(String id);
	Customer getCustomerByNo(int id);
	List<Customer> getAllCustomers();
	void pointUpdate(@Param("point")int point, @Param("id") int id);
	void cashUpdate(int useCash);
	int getSeq();
}
