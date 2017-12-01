package kr.co.hangsho.privatedeal.service;

import java.util.List;

import kr.co.hangsho.privatedeal.vo.Comment;
import kr.co.hangsho.privatedeal.vo.Privatedeal;
import kr.co.hangsho.web.criteria.Criteria;

public interface PrivatedealService {
	
	void addPDBoard(Privatedeal privatedeal);
	List<Privatedeal> getMeronaList(Criteria criteria);
	int getTotalRows(Criteria criteria);
	
	Privatedeal getMeronaByNo(int no);
	void clickedPlus(int boardNo);
	void dpiUpdateByBoardNo(int boardNo);
	void diUpdateByBoardNo(int boardNo);
	void dcUpdateByBoardNo(int boardNo);
	void deleteBoardByBoardNo(int boardNo);
	void modifyBoard(Privatedeal privatedeal);
	
	int getCommentSeq();
	Comment addNewComment(Comment comment);
	List<Comment> getCommentsByBoardNo(int no);
	Comment addNewReply(Comment comment);
	Comment deleteCommentByCno(int cno);
	Comment deleteReplyByCno(int cno);
	Comment getCommentByCno(int cno);
	Comment modifyComment(Comment comment);
	int getCommentCountByBoardNo(int boardNo);	
	
}