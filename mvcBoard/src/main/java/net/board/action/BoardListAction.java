package net.board.action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

 public class BoardListAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		BoardDAO boarddao=new BoardDAO();
		List<BoardBean> boardlist = new ArrayList<>();
		
		//DAO에게 일을 요청하기 전에 선행작업(필요한 정보를 만드는 작업) 비즈니스로직 -> 사실 service에서 해야하는 일 
		int page=1;//페이지 기본값을 1페이지로 설정
		int limit=10;//1 페이지에 나타내는 목록 개수를 10개로 지정
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount=boarddao.getListCount(); //전체 게시글 카운트
		boardlist = boarddao.getBoardList(page,limit); //한페이지에 10개를 보겠다고 전달
		
		
		//DAO에게 일을 요청한 후 view page에서 필요한 정보를 만드는 후행작업
 		int maxpage=(int)((double)listcount/limit+0.95); //
 		//
 		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
 		//
		int endpage = startpage+10-1;

 		if (endpage> maxpage) endpage= maxpage;

 		//forwarding 을 하기위해서 다 집어넣어줌
 		request.setAttribute("page", page); 
 		request.setAttribute("maxpage", maxpage);
 		request.setAttribute("startpage", startpage);
 		request.setAttribute("endpage", endpage); 
		request.setAttribute("listcount",listcount);
		request.setAttribute("boardlist", boardlist);
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);//요청 수행후 forwarding 하겠다
 		forward.setPath("./board/qna_board_list.jsp");//이 경로로
 		return forward;
	 }
 }