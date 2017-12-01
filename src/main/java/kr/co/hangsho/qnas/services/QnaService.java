package kr.co.hangsho.qnas.services;

import java.util.List;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.qnas.vo.Qna;

public interface QnaService {
	
	List<Qna> getQnaList();
	Qna getQnaByQnaId(int qnaId);
	List<Qna> getQnasByCustomer(Customer customer);
	void addQna(Qna qna);
	int getSeq();
	void addQnaReply(Qna qna);
	void updateQna(Qna qna);
}
