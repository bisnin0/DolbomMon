package com.dolbommon.dbmon.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	//게시판 리스트로 이동
	@RequestMapping("/freeBoard")
	public String freeBoard() {
		
		return "freeBoard/freeBoard";
	}
	
	//게시판 글쓰기 폼으로 이동
	@RequestMapping("/freeBoardWrite")
	public String freeBoardWrite() {
		
		return "freeBoard/freeBoardWrite";
	}
	
	//게시판 글쓰기
	@RequestMapping(value="/freeBoardWriteOk", method=RequestMethod.POST)
	public ModelAndView freeBoardWriteOk() {
		
		return null;	
	}
	
	//게시글 보기
//	@RequestMapping("/freeBoardView")
//	public ModelAndView freeBoardView() {
		
//		return null;
//	}
	@RequestMapping("/freeBoardView")
	public String freeBoardView() {
		
		return "freeBoard/freeBoardView";
	}
	
	//공지사항 게시판으로 이동
	@RequestMapping("/noticeBoard")
	public String noticeBoard() {
		
		return "freeBoard/noticeBoard";
	}
	
	//공지사항 글쓰기 폼으로 이동
	@RequestMapping("/noticeBoardWrite")
	public String noticeBoardWrite() {
		
		return "freeBoard/noticeBoardWrite";
	}
	
	//공지사항 게시글 보기
//	@RequestMapping(value="/noticeBoardView", method=RequestMethod.POST)
//	public ModelAndView noticeBoardView() {
		
//		return null;
//	}
	
	@RequestMapping("/noticeBoardView")
	public String noticeBoardView() {
		
		return "freeBoard/noticeBoardView";
	}
	
	//신고게시판으로 이동
	@RequestMapping("/bulletinBoard")
	public String bulletinBoard() {
		
		return "freeBoard/bulletinBoard";
	}
	
	//신고게시글 보기
	@RequestMapping("/bulletinBoardView")
	public String bulletinBoardView() {
		
		return "freeBoard/bulletinBoardView";
	}
	
	//인증게시판으로 이동
	@RequestMapping("/confirmBoard")
	public String confirmBoard() {
		
		return "freeBoard/confirmBoard";
	}
	
	//인증글 보기
	@RequestMapping("/confirmBoardView")
	public String confirmBoardView() {
		
		return "freeBoard/confirmBoardView";
	}
}
