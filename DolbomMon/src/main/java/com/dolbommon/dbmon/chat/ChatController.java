package com.dolbommon.dbmon.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	@Autowired
	SqlSession sqlSession;

	@Autowired
	ChatDAO chatdao;

	@RequestMapping("/chat")
	public ModelAndView chatMain(HttpSession session, HttpServletRequest req) {

		ModelAndView mav = new ModelAndView();

		String userid = (String) session.getAttribute("userid");
		String anotherId = (String)req.getParameter("userid");
		//System.out.println("어나더아이디"+anotherId);
		if(anotherId==null || anotherId.equals("")) {
			anotherId="DBMmanager";
		}
		
		mav.addObject("roomList", chatdao.selectAllRoom(userid)); // 방정보..
		mav.addObject("myId", userid);
		mav.addObject("anotherId", anotherId);
		mav.setViewName("chat/chatMain");
		return mav;
	}

	//방 시간 갱신 최상단에오게.
	@RequestMapping(value="/newRoom")
	@ResponseBody
	public String newRoom(ChatRoomDTO room, HttpSession session, HttpServletRequest req) {
		String userid = (String) session.getAttribute("userid");
		room.setUserid(userid); // 글, 프로필 대상
		String anotherid = (String)req.getParameter("anotherId");
		//System.out.println(anotherid);
		//System.out.println(room.getUserid());
		chatdao.roomTimeUpdate(anotherid, room.getUserid());
		//System.out.println("test");
		return "ok";
	}
	
	
	int count = 1;
	//////////////
	// 방만들기 and 채팅방열기
	@RequestMapping(value = "/makeRoom", method = RequestMethod.POST)
	@ResponseBody
	public List<ChatRoomDTO> makeakeRoom(ChatRoomDTO room, HttpSession session, HttpServletRequest req) {
		
		String userid = (String) session.getAttribute("userid");
		
		
		String userid2 = (String)req.getParameter("userid");
		
		if(userid2==null || userid2.equals("")) {
			userid2="DBMmanager";
		}
		room.setUserid(userid2); // 글, 프로필 대상
		
		//방갯수확인
		int result = chatdao.roomCheck(userid, room.getUserid());
		List<ChatRoomDTO> resultRoomDTO = null;
		if(userid!=null && !userid.equals("")) {
			if (result >= 1) {
				if(count==1) {
					chatdao.roomTimeUpdate(userid, room.getUserid());
					count++;
				}
				//System.out.println("내아이디"+userid);
				//System.out.println("선생아이디"+room.getUserid());
				resultRoomDTO = chatdao.selectAllRoom(userid);
				return resultRoomDTO;
			}
			try {
			room.setUserid_t((String)session.getAttribute("userid")); // 접속한 사람
			}catch(Exception e) {
				room.setUserid_t("sitter1000");
			}
			//룸 중복확인후 생성
			//서버실행시 쿼리문 반복수행되는 에러때문에 밑에서 다시한번 방갯수구함
			int result2 = chatdao.roomCheck(userid, room.getUserid());
			if(result2==0) {
				chatdao.insertRoom(room); // 방 생성 // 방번호 가져오기.
			}
			
		}

		//중복방 삭제
		chatdao.roomDelete(userid, room.getUserid());
		resultRoomDTO = chatdao.selectAllRoom(userid);
		return resultRoomDTO;
	}

	// 현재시간으로 갱신하게 만들기.
	@RequestMapping(value = "/insertChat", method = RequestMethod.POST)
	@ResponseBody
	public String insertChat(ChatRoomDTO room, ChatDTO chat, HttpServletRequest req, HttpSession session) {
		if (session.getAttribute("userid") != null) {
			String userid = (String) session.getAttribute("userid");
			String roomseq = (String) req.getParameter("roomseq");
			chat.setRoomseq(roomseq);
			chat.setUserid(userid);
			chatdao.insertChat(chat);

			// 새로운 채팅 업데이트
			room.setRoomseq(roomseq);
			ChatRoomDTO resultDTO = chatdao.selectNewchat(room);
			if(resultDTO.getUserid().equals(userid)) {
				String userCheck ="N";
				chatdao.updateNewChat(roomseq, chat.getMessage(), userCheck); 
			}else { 
				String userCheck ="Y";
				chatdao.updateNewChat(roomseq, chat.getMessage(), userCheck);
			}
			 
		}

		return "ok";

	}

	// 방 클릭시 채팅내용에 반영되게하기
	@RequestMapping("/selectChatRoom")
	@ResponseBody
	public List<ChatDTO> selectRoom(ChatRoomDTO room, HttpServletRequest req, HttpSession ses) {
		int roomNo = Integer.parseInt((String) req.getParameter("roomNo"));
		List resultDTO = chatdao.selectRoom(roomNo);
		
		
		//채팅 확인
		String userid = (String)ses.getAttribute("userid");
		room.setRoomseq((String) req.getParameter("roomNo"));
		ChatRoomDTO resultDTO2 = chatdao.selectNewchat(room);
		if(userid!=null && !userid.equals("")) {
			if(resultDTO2.getUserid().equals(userid)) {
				String userCheck ="N";
				chatdao.updateChatCheck(roomNo, userCheck);
			}else { 
				String userCheck ="Y"; 
				chatdao.updateChatCheck(roomNo, userCheck);
			}
		}
		//ChatDTO에 상태메시지? 이미지경로? 이름? 같은 표시할 정보 추가하고.. 
		//다른 테이블과 VO에서 가져와서 집어넣고 쓰기.
		return resultDTO;
	}
}
