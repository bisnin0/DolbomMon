package com.dolbommon.dbmon.parent;


import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.deal.DealDaoImp;
import com.dolbommon.dbmon.member.MemberDaoImp;
import com.dolbommon.dbmon.member.RegularDateVO;
import com.dolbommon.dbmon.member.SpecificDateVO;
import com.dolbommon.dbmon.search.RecruitBoardDaoImp;
import com.dolbommon.dbmon.search.RecruitBoardVO;

@Controller
public class ParentController {
	
	SqlSession sqlSession;
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Autowired
	DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/mypage") //�θ�� ����������
	public String mypage() {
		return "/parents/mypage";
	}


	@RequestMapping("/parentApplyHistory") // 내가, 내게 지원한
	public ModelAndView parentApplyHistory(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		DealDaoImp dao2 = sqlSession.getMapper(DealDaoImp.class);
		ParentDaoImp dao = sqlSession.getMapper(ParentDaoImp.class);
		
		List<RecruitBoardVO> list3 = dao2.selectTeacherHistory2(userid);
		List<ParentHistoryVO> list = dao.selectMyRdBoard(userid);
		List<ParentHistoryVO> list2 = dao.selelctApplyToTeacher(userid);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list2", list2);
		mav.addObject("list", list);
		mav.addObject("list3", list3);
		mav.setViewName("/parents/parentApplyHistory");
		
		return mav;
	}
	@RequestMapping("/parentView") //
	public ModelAndView parentView(int no, HttpSession ses) {
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		dao.hitCount(no);
		List<ApplyToParentInfoVO> tlist = dao.applyDbmSelect(no);
		RecruitBoardVO rbVO = dao.recruitBoardSelect(no);
		ChildrenVO cVO = dao.recruitChildSelect(no);
		
		DealDaoImp dao2 = sqlSession.getMapper(DealDaoImp.class);
		RecruitBoardVO checkVo = dao2.ContractStatus(no);
		
		//마지막 계약서 유저아이디
		
		String who = (String)ses.getAttribute("who");
		String userid = (String)ses.getAttribute("userid");
		int apChk = 0;
		if(who.equals("T")) {
			apChk = dao.applyChk(no, userid);
		}


		ModelAndView mav = new ModelAndView();
		
		String timeType = rbVO.getTime_type();
		if(timeType.equals("S")) {
			SpecificDateVO sdVO = dao.recruitSpecificDateSelect(no);
			System.out.println("특정날에만 ");
			mav.addObject("sdVO", sdVO);
		}else if(timeType.equals("R")){
			RegularDateVO rdVO = dao.recruitRegularDateSelect(no);
			System.out.println("정기적으로 ");
			mav.addObject("rdVO", rdVO);
		}
		mav.addObject("apChk", apChk);
		mav.addObject("tlist", tlist);
		mav.addObject("cVO", cVO);
		mav.addObject("rbVO", rbVO);
		mav.addObject("checkVo", checkVo);
		
		mav.setViewName("/parents/parentView");
		
		return mav;
	}

	@RequestMapping("/parentEdit")
	public String parentEdit() {
		return "/parents/parentEdit";
	}
	@RequestMapping("/parentWage")
	public String parentWage() {
		return "/parents/parentWage";
	}

	@RequestMapping("/scheduleEdit")
	public String scheduleEdit() {
		return "/parents/scheduleEdit";

	}
	
	
	/////////////// 학부모에게 지원하기
	@RequestMapping("/applyToParent")
	public ModelAndView applyToParent(HttpSession ses, RecruitBoardVO rbVO, int no) {
		String teacherId = (String)ses.getAttribute("userid");
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		ApplyToParentVO atpVO = dao.getParentId(no);
		System.out.println("학부모 아이디 ==> " + atpVO.getP_userid());
		String parentId = atpVO.getP_userid();
		
		String who = (String)ses.getAttribute("who");
		String t_userid = (String)ses.getAttribute("userid");
		int apChk = 0;
		if(who.equals("T")) {
			apChk = dao.applyChk(no, t_userid);
		}
		
		ModelAndView mav = new ModelAndView();
		
		if(apChk>0) {
			
		} else {
			int apresult = dao.applyToParent(no, teacherId, parentId);
			System.out.println("신청결과 => " + apresult);
			
			mav.addObject("apresult", apresult);
		}
		
		mav.setViewName("redirect:/parentView?no="+no);
		return mav;
	}
	
	
	///학부모행동내역 작성
	@RequestMapping("/dealHistoryP")
	public ModelAndView dealHistory(HttpSession ses) {
			DealDaoImp dao = sqlSession.getMapper(DealDaoImp.class);
			String userid = (String)ses.getAttribute("userid");
			List<RecruitBoardVO> list2 = dao.teacherDealHistory(userid);
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("list2", list2);
			mav.setViewName("/teacher/dealHistory");

			return mav;
	}
	
	
	@RequestMapping(value = "/refusalDbm", method = RequestMethod.POST)
	@ResponseBody
	public int refusalDbm(@RequestParam("dbmid") String dbmid, @RequestParam("no") int no) {
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		int result = dao.refusalDbm(dbmid, no);
		
		return result;
	}

	@RequestMapping(value = "/applyCancel", method = RequestMethod.POST)
	@ResponseBody
	public int applyCancel(@RequestParam("dbmid") String dbmid, @RequestParam("no") int no) {
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		int result = dao.applyCancel(dbmid, no);
		
		return result;
	}
	
	///////////// 돌봄몬 구하기 글쓰기폼으로 이동
	@RequestMapping("/dbmSearchWriteForm")
	public String dbmSearchWriteForm() {
		return "parents/dbmSearchWriteForm";
	}
	
	//// 돌봄몬 구하기 글쓰기 
	@RequestMapping(value="/dbmSearchWriteFormOk", method = RequestMethod.POST)
	public ModelAndView dbmSearchWriteFormOk(HttpServletRequest req, HttpSession ses, RecruitBoardVO rbVO, ChildrenVO cVO, SpecificDateVO sdVO, RegularDateVO rdVO) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		rbVO.setUserid((String)ses.getAttribute("userid"));
		
		String consultation = (String)rbVO.getConsultation();
		if(consultation == null) {
			System.out.println("협의 null =in");
			rbVO.setConsultation("N");
		}
		String time_consultation = (String)rbVO.getTime_consultation();
		if(time_consultation == null) {
			rbVO.setTime_consultation("N");
		}
		String childb = cVO.getChild_birth();
		String childbArr[] = childb.split(",");
		
		String child_birthStr = "";
		for(int i=0;i<childbArr.length;i++) {
			if(!childbArr[i].equals("")) {
				child_birthStr += childbArr[i]+",";
			}
		}
		String child_birth = child_birthStr.substring(0, child_birthStr.length()-1);
		System.out.println("자녀 생년월일 => " + child_birth);
		cVO.setChild_birth(child_birth);
		
		
		ParentDaoImp dao = sqlSession.getMapper(ParentDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		String time_type = (String)rbVO.getTime_type();
		System.out.println("type_type => " + time_type);
		int result = 0;
		try {
			System.out.println("in");
			dao.insertDbmSearch(rbVO);
			System.out.println("parent_list 데이터 등록 됨");
			dao.insertDsChildInfo(rbVO, cVO);
			System.out.println("자녀 정보 등록됨");
			if(time_type.equals("S")) {
				System.out.println("S");
				dao.insertNullRegularDate();
				result = dao.insertDsSpecificDate(rbVO, sdVO);
			}else {
				System.out.println("R");
				dao.insertNullSpecificDate();
				result = dao.insertDsRegularDate(rbVO, rdVO);
			}
			transactionManager.commit(status);
		}catch(Exception e) {
			transactionManager.rollback(status);
		}
		
		mav.addObject("result", result);
		mav.setViewName("/parents/writeResult");
		
		return mav;
	
	}

	@RequestMapping("parentProfile")
	public ModelAndView parentProfile(String userid) {
		
		ParentDaoImp dao = sqlSession.getMapper(ParentDaoImp.class);
		
		RecruitBoardVO vo = dao.getParentProfile(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("parents/parentProfile");
		mav.addObject("vo", vo);
		return mav;
	}
	
	//후기 작성
	@RequestMapping("/commentWrite")
	public ModelAndView commentWrite(HttpServletRequest req, String userid) {
		userid = (String)req.getParameter("userid");
		String no = (String)req.getParameter("no");
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid", userid);
		mav.addObject("no", no);
		mav.setViewName("parents/commentWrite");
		
		return mav;
	}
	
	@RequestMapping(value="/commentWriteOk", method=RequestMethod.POST)
	public ModelAndView commentWriteOk(CommentVO vo, HttpServletRequest req, HttpSession ses, String userid) {
		vo.setUserid((String)req.getParameter("userid"));	//선생님 아이디
		vo.setReviewid((String)ses.getAttribute("userid"));	//작성자(학부모) 아이디
		String no = req.getParameter("no");	//작성자(학부모) 아이디
		ParentDaoImp dao = sqlSession.getMapper(ParentDaoImp.class);
		
		String star = vo.getReview_star();
		System.out.println(star);
		String starArr[] = star.split(",");
		System.out.println(starArr[starArr.length-1]);
		vo.setReview_star(starArr[starArr.length-1]);
		ModelAndView mav = new ModelAndView();
		
		int result = dao.insertComment(vo);
		if(result>0) {	//레코드 추가 성공
			System.out.println("데이터 확인"+no);
			dao.updatereview_status(no);
			mav.setViewName("parents/commentResult");
			
		}else {	//레코드 추가 실패
			mav.setViewName("parents/commentFailResult");	
		}
		return mav;

	}

	@RequestMapping("parentDealHistory")
	public ModelAndView parentDealHistory(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		ParentDaoImp dao = sqlSession.getMapper(ParentDaoImp.class);
		
		List<RecruitBoardVO> list = dao.parentDealHistory(userid);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.setViewName("parents/parentDealHistory");
		return mav;
	}
	
	@RequestMapping(value="/accountUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int accountUpdate(HttpSession ses, @RequestParam("bank_name") String bank_name
			, @RequestParam("bank_account_no") String bank_account_no) {
		String userid = (String)ses.getAttribute("userid");
		
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		int result = dao.accountUpdate(userid, bank_name, bank_account_no);
		
		return result;
	}
	
	@RequestMapping("/cancelContract2")
	public ModelAndView cancelContract(HttpServletRequest req) {
		String origin_no = (String)req.getParameter("origin_no");
		DealDaoImp dao = sqlSession.getMapper(DealDaoImp.class);
		
		dao.cancelContract2(dao.selectOrigin_no(origin_no));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("no", origin_no);
		mav.setViewName("redirect:parentView");
		return mav;
		
	}
	
	@RequestMapping("/deleteBoard")
	public ModelAndView deleteBoard(int no) {
		
		ModelAndView mav = new ModelAndView();
		
		
		
		return mav;
	}
	
}















