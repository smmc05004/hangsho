package kr.co.hangsho.qnas.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.qnas.vo.Qna;

@Mapper
public interface QnaMapper {

	List<Qna> getQnas();
	Qna getQnaByQnaId(int qnaId);
	int getSeq();
	List<Qna> getQnasByCustomer(Customer customer);
	void addQna(Qna qna);
	void addQnaReply(Qna qna);
	void updateQna(Qna qna);
	
}
