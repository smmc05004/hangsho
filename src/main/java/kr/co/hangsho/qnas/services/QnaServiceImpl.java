package kr.co.hangsho.qnas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.qnas.mappers.QnaMapper;
import kr.co.hangsho.qnas.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	QnaMapper qnaMapper;

	@Override
	public List<Qna> getQnaList() {
		return qnaMapper.getQnas();
	}

	@Override
	public Qna getQnaByQnaId(int qnaId) {
		return qnaMapper.getQnaByQnaId(qnaId);
	}

	@Override
	public List<Qna> getQnasByCustomer(Customer customer) {
		return qnaMapper.getQnasByCustomer(customer);
	}

	@Override
	public void addQna(Qna qna) {
		qna.setId(qnaMapper.getSeq());
		qnaMapper.addQna(qna);
	}

	@Override
	public int getSeq() {
		return qnaMapper.getSeq();
	}

	@Override
	public void addQnaReply(Qna qna) {
		qnaMapper.addQnaReply(qna);
	}

	// 답변 달았을 때 reply_id 바꾸기
	@Override
	public void updateQna(Qna qna) {
		qnaMapper.updateQna(qna);
	}
	
	
}
