package kr.co.hangsho.privatedeal.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.privatedeal.vo.Comment;
import kr.co.hangsho.privatedeal.vo.Privatedeal;
import kr.co.hangsho.web.criteria.Criteria;

@Mapper
public interface PrivatedealMapper {
	
	void addPrivatedeal(Privatedeal privatedeal);
	List<Privatedeal> getPrivateDeals(Criteria criteria);
	int getTotalRows(Criteria criteria);
	
	Privatedeal getBoardByNo(int no);
	void clickedPlusByBoardNo(int boardNo);
	void dpiUpdate(int boardNo);
	void diUpdate(int boardNo);
	void dcUpdate(int boardNo);
	void deleteBoard(int boardNo);
	void modifyBoard(Privatedeal privatedeal);
	
	int getCommentSeq();
	void addComment(Comment comment);
	List<Comment> getCommentsByBoardNo(int no);
	Customer getRepliedNickName(Comment comment);
	int getRepliedRootId(Comment comment);
	void deleteComment(int cno);
	void deleteReply(int cno);
	Comment getComment(int cno);
	void modifyComment(Comment comment);
	int getCommentCountByBoardNo(int boardNo);
	
}
