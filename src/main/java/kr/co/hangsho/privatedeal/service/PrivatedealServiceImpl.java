package kr.co.hangsho.privatedeal.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hangsho.categories.mappers.CategoryMapper;
import kr.co.hangsho.categories.vo.SmallCategory;
import kr.co.hangsho.customers.vo.Customer;
import kr.co.hangsho.privatedeal.mappers.PrivatedealMapper;
import kr.co.hangsho.privatedeal.vo.Comment;
import kr.co.hangsho.privatedeal.vo.Privatedeal;
import kr.co.hangsho.web.criteria.Criteria;

@Service
public class PrivatedealServiceImpl implements PrivatedealService {
	
	@Autowired
	PrivatedealMapper privatedealMapper;
	
	@Autowired
	CategoryMapper categoryMapper;

	@Override
	public void addPDBoard(Privatedeal privatedeal) {
		privatedealMapper.addPrivatedeal(privatedeal);
	}

	@Override
	public List<Privatedeal> getMeronaList(Criteria criteria) {
		
		return privatedealMapper.getPrivateDeals(criteria);		
	}

	@Override
	public int getTotalRows(Criteria criteria) {
		return privatedealMapper.getTotalRows(criteria);
	}

	@Override
	public Privatedeal getMeronaByNo(int no) {
		
		Privatedeal merona = privatedealMapper.getBoardByNo(no);
		
		SmallCategory smallcategory = categoryMapper.getCategory(merona.getSmallcategory().getId());		
		
		merona.setSmallcategory(smallcategory);
		
		return merona;
	}

	@Override
	public void clickedPlus(int boardNo) {
		privatedealMapper.clickedPlusByBoardNo(boardNo);
	}

	@Override
	public void dpiUpdateByBoardNo(int boardNo) {
		privatedealMapper.dpiUpdate(boardNo);
	}

	@Override
	public void diUpdateByBoardNo(int boardNo) {
		privatedealMapper.diUpdate(boardNo);
	}

	@Override
	public void dcUpdateByBoardNo(int boardNo) {
		privatedealMapper.dcUpdate(boardNo);
	}

	@Override
	public void deleteBoardByBoardNo(int boardNo) {
		privatedealMapper.deleteBoard(boardNo);
	}

	@Override
	public void modifyBoard(Privatedeal privatedeal) {		
		privatedealMapper.modifyBoard(privatedeal);
	}

	@Override
	public int getCommentSeq() {
		return privatedealMapper.getCommentSeq();
	}

	@Override
	public Comment addNewComment(Comment comment) {
		
		int seq = privatedealMapper.getCommentSeq();
		
		comment.setId(seq);
		comment.setCreatedate(new Date());
		Comment repliedId = new Comment();
		repliedId.setId(seq);
		comment.setRepliedId(repliedId);
		
		Comment groupId = new Comment();
		groupId.setId(seq);		
		comment.setGroupId(groupId);
		
		System.out.println(comment);
				
		privatedealMapper.addComment(comment);
		
		return comment;
	}

	@Override
	public List<Comment> getCommentsByBoardNo(int no) {	
		
		return privatedealMapper.getCommentsByBoardNo(no);
	}

	@Override
	public Comment addNewReply(Comment comment) {
		
		int seq = privatedealMapper.getCommentSeq();				
		
		Customer customer = privatedealMapper.getRepliedNickName(comment.getRepliedId());
		
		int replyRoot = privatedealMapper.getRepliedRootId(comment.getRepliedId());
		
		comment.setId(seq);
		comment.setCreatedate(new Date());
		comment.getRepliedId().setCustomer(customer);
		
		Comment groupId = new Comment();
		groupId.setId(replyRoot);		
		comment.setGroupId(groupId);
		
		privatedealMapper.addComment(comment);
		
		return comment;
	}

	@Override
	public Comment deleteCommentByCno(int cno) {
		Comment comment = privatedealMapper.getComment(cno);
		privatedealMapper.deleteComment(cno);
		
		return comment; 
	}

	@Override
	public Comment deleteReplyByCno(int cno) {
		Comment comment = privatedealMapper.getComment(cno);
		privatedealMapper.deleteReply(cno);
		
		return comment;
	}

	@Override
	public Comment getCommentByCno(int cno) {		
		return privatedealMapper.getComment(cno);
	}

	@Override
	public Comment modifyComment(Comment comment) {
		
		privatedealMapper.modifyComment(comment);
		
		return privatedealMapper.getComment(comment.getId());
	}

	@Override
	public int getCommentCountByBoardNo(int boardNo) {		
		return privatedealMapper.getCommentCountByBoardNo(boardNo);
	}
	
}
