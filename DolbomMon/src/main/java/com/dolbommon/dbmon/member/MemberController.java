package com.dolbommon.dbmon.member;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.ManageDaoImp;
import com.dolbommon.dbmon.PwdSha256;
import com.dolbommon.dbmon.Teacher.TeacherVO;

@Controller
public class MemberController {
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
		
		
		////////////////공통//////////////	
		// 선생님, 부모님 회원가입 선택
		@RequestMapping("/join")
		public String join(HttpSession ses) {
			return "register/join";
		}
		
		@RequestMapping(value="parentJoin", method=RequestMethod.POST)
		public String parentJoin(@RequestParam("who") String who, HttpSession ses) {
			
			ses.setAttribute("who", who);
			return "register/regForm";
		}
		
		@RequestMapping(value="dbmJoin", method=RequestMethod.POST)
		public String dbmJoin(@RequestParam("who") String who, HttpSession ses) {
			ses.setAttribute("who", who);
			return "register/dbm/dbmType";
		}
		
		// 선생님, 부모님 회원가입 폼
		@RequestMapping(value="/regForm", method=RequestMethod.POST)
		public ModelAndView regForm(
				@RequestParam("intro") String intro,
				HttpSession ses
				) {
			ses.setAttribute("intro", intro);
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("register/regForm");
			return mav;
		}
				
		@RequestMapping(value="/regFormOk", method=RequestMethod.POST)
		public ModelAndView regOk(
			HttpServletRequest req,HttpSession ses, MemberVO mVo, TeacherVO tVo, RegularDateVO rdVo
				) {
			
			DefaultTransactionDefinition def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
			
			TransactionStatus status = transactionManager.getTransaction(def);
			
			MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
			ModelAndView mav = new ModelAndView();
			
			
		    String encryPassword = PwdSha256.encrypt(mVo.getUserpwd());
		    mVo.setUserpwd(encryPassword);
			
			String yoil = (String)ses.getAttribute("yoil");
			String sd = (String)ses.getAttribute("start_date");
			String ed = (String)ses.getAttribute("end_date");
			String st = (String)ses.getAttribute("start_time");
			String et = (String)ses.getAttribute("end_time");
			
			rdVo.setYoil(yoil);
			rdVo.setStart_date(sd);
			rdVo.setEnd_date(ed);
			rdVo.setStart_time(st);
			rdVo.setEnd_time(et);
			
			
			String who = (String)ses.getAttribute("who");
			if(who.equals("T")) {
				
			}
			
			System.out.println("who=>"+ who);
			int result = 0;
			
			try {
				if(who.equals("T")) {
					System.out.println("선생님 회원가입 시작 =>");
					dao.memberReg(mVo);
					System.out.println("member테이블 insert");
					dao.memberRegTeacher(mVo, tVo);
					System.out.println("teacher테이블 insert");
					result = dao.memberRegRegular(mVo, rdVo);
					System.out.println("시간테이블 insert");
				}else {
					result = dao.memberReg(mVo);
				}
				transactionManager.commit(status);
			}catch(Exception e) {
				transactionManager.rollback(status);
			}
			
				if(who.equals("P")) {
					if(result==1) {
						String userid = mVo.getUserid();
						mav.addObject("userid", userid);
						mav.setViewName("register/parent/profileImage");
					}else {
						mav.addObject("result", result);
						mav.setViewName("register/result");
					}
				}else {
					mav.addObject("result", result);
					mav.setViewName("register/regResult");
				}
			
			return mav;
		}
		
		// 아이디 중복검사 
		@RequestMapping(value = "/idCheckAjax", method = RequestMethod.POST)
		@ResponseBody
		public int useridChk(@RequestParam("userid") String userid) {
			
			MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
			ManageDaoImp dao2 = sqlSession.getMapper(ManageDaoImp.class);
			int result2 = dao.memberUseridChk(userid);
			int result3 = dao2.selectManagerId(userid);
			int result = result2 + result3;
			return result;
		}
		
		// 연락처 중복검사
		@RequestMapping(value = "/telCheckAjax", method = RequestMethod.POST)
		@ResponseBody
		public int usertelChk(@RequestParam("tel1") String tel1) {
			MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
			int result = dao.memberUsertelChk(tel1);
			return result;
		}
		
		@RequestMapping(value = "/sendSms", method = RequestMethod.POST)
		@ResponseBody
		public String sendSms(HttpServletRequest request) throws Exception {

			String api_key = "NCSQ0VURJQQSSIOA";
			String api_secret = "JXF7YGYDKKIHGNGMCRJY5ABSZX5S8GII";

		    com.dolbommon.dbmon.member.Coolsms coolsms = new com.dolbommon.dbmon.member.Coolsms(api_key, api_secret);
		       
		    HashMap<String, String> set = new HashMap<String, String>();

		    set.put("to", (String)request.getParameter("tel1")); // 받는 사람
		    set.put("from", "01096801682"); // 발신번호
		    set.put("text", "돌봄몬 본인인증 \n 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
		    set.put("type", "sms"); // 문자 타입
		   
		    coolsms.send(set); // 보내기
		    
		    return "suc";
		}

		//////////////공통//////////////
		
		//////////////////////////// 학부모 회원가입 시작 /////////////////////////////////
		
		// 원하는 돌봄선택, 선생님 나이선택
		@RequestMapping("/parent/activityAndAge")
		public String parentActivityAndAge() {
			return "register/parent/activityAndAge";
		}
		
		// 자녀 정보 입력
		@RequestMapping(value="/parent/children", method=RequestMethod.POST)
		public String children(HttpSession ses,
							  @RequestParam("pw_activity") String pw_activity,
							  @RequestParam("wish_age") String wish_age
				) {
			ses.setAttribute("pw_activity", pw_activity);
			ses.setAttribute("wish_age", wish_age);
			return "register/parent/children";
		}
		
		// 학부모 - 지역(시,군,구,동) 설정 
		@RequestMapping(value="/parent/location", method=RequestMethod.POST)
		public String parentLoaction(HttpSession ses,
									@RequestParam("child_name") String child_name,
									@RequestParam("child_birth") String child_birth,
									@RequestParam("wish_wage") String wish_wage
			) {
			ses.setAttribute("child_name", child_name);
			ses.setAttribute("child_birth", child_birth);
			ses.setAttribute("wish_wage", wish_wage);
			return "register/parent/location";
		}
		
		// 학부모 - 스케줄 선택
		@RequestMapping(value="/parent/schedule", method=RequestMethod.POST)
		public String parentSchedule(HttpSession ses, @RequestParam("area1") String area1
					, @RequestParam("lat") String lat, @RequestParam("lng") String lng
				) {
			
			return "register/parent/schedule/schedule";
		}
		
		// 학부모 - 정기적으로 시간 설정
		@RequestMapping("/parent/scheduleType/regular")
		public String parentScheduleRegular() {
			return "register/parent/schedule/regular";
		}
		
		// 학부모 - 특정날에만 시간 설정 
		@RequestMapping("/parent/scheduleType/shortTerm")
		public String parentScheduleShortTerm() {
			return "register/parent/schedule/shortTerm";
		}
		
		// 학부모 - 아직 정확한 계획은 없어요 설정
		@RequestMapping("/parent/scheduleType/noPlan")
		public String parentScheduleNoPlan() {
			return "register/parent/schedule/noPlan";
		}
		
		// 학부모 - 특이사항 입력
		@RequestMapping(value="/parent/description", method=RequestMethod.POST)
		public String parentDescription(HttpSession ses,
				@RequestParam("yoil") String yoil,
				@RequestParam("start_date") String start_date,
				@RequestParam("end_date") String end_date,
				@RequestParam("start_time") String start_time,
				@RequestParam("end_time") String end_time
				) {
			ses.setAttribute("yoil", yoil);
			ses.setAttribute("start_date", start_date);
			ses.setAttribute("end_date", end_date);
			ses.setAttribute("start_time", start_time);
			ses.setAttribute("end_time", end_time);
			
			return "register/parent/description";
		}
		
		////////////////////////////// 돌봄몬 회원가입 시작 //////////////////////////////////
		
		// 돌봄몬 - 유형 선택(선생님, 대학생, 엄마, 일반) >>
		@RequestMapping(value="/dbm/dbmType", method = RequestMethod.POST)
		public String selectDbmType() {
			return "register/dbm/dbmType";
		}
		
		// 돌볼 수 있는 아이의 연령대와 가능한 활동  >>
		@RequestMapping(value = "/dbm/activityAndAge", method = RequestMethod.POST)
		public String dbmActivityAndAge(@RequestParam("teacher_type") String teacher_type, HttpSession ses) {
			System.out.println(teacher_type);
			ses.setAttribute("teacher_type", teacher_type);
			
			return "register/dbm/activityAndAge";
		}
		
		// 돌봄몬 - 지역(시,군,구,동) 설정  >>
		@RequestMapping(value="/dbm/location", method = RequestMethod.POST)
		public String dbmLoaction(@RequestParam("child_age") String child_age,
										@RequestParam("activity_type") String activity_type,
										HttpSession ses
		) {	
			child_age = child_age.replace(",", "/");
			activity_type = activity_type.replace(",", "/");
			ses.setAttribute("child_age", child_age);
			ses.setAttribute("activity_type", activity_type);
			
			return "register/dbm/location";
		}
		
		// 돌봄몬 - 원하는 시간 입력 >>
		@RequestMapping(value="/dbm/schedule", method = RequestMethod.POST)
		public String dbmSchedule(HttpSession ses, @RequestParam("area1") String area1
				, @RequestParam("lat") String lat, @RequestParam("lng") String lng
							      ) {
			System.out.println("lng => " + lng);
			System.out.println("lat => " + lat);
			System.out.println("area1 => " + area1);
			ses.setAttribute("area1", area1);
			ses.setAttribute("lat",  lat);
			ses.setAttribute("lng", lng);
			
			return "register/dbm/schedule/schedule";
		}
		
		// 돌봄몬 - 원하는 시간 직접 입력하기 >>
		@RequestMapping("/dbm/schedule/detail")
		public String dbmScheduleDetail() {
			return "register/dbm/schedule/detail";
		}
		
		// 돌봄몬 - 희망시급과 CCTV동의여부 >>
		@RequestMapping(value="/dbm/wantedPaymentAndCCTV", method = RequestMethod.POST)
		public String dbmWantedPaymentAndCCTV(HttpSession ses,
			      @RequestParam("yoil") String yoil,
			      @RequestParam("start_time") String start_time,
			      @RequestParam("end_time") String end_time,
			      @RequestParam("start_date") String start_date,
			      @RequestParam("end_date") String end_date
		) {
			ses.setAttribute("yoil", yoil);
			ses.setAttribute("start_time", start_time);
			ses.setAttribute("end_time", end_time);
			ses.setAttribute("start_date", start_date);
			ses.setAttribute("end_date", end_date);
			return "register/dbm/wantedPaymentAndCCTV";
		}
		
		@RequestMapping(value="/dbm/profileImage", method = RequestMethod.POST)
		public String dbmProfileImage(HttpSession ses, 
			      @RequestParam("desired_wage") String desired_wage,
			      @RequestParam("cctv") String cctv,
			      @RequestParam("discussion") String discussion
		){
			System.out.println(("협의 가능여부 => "  + discussion));
			
			ses.setAttribute("discussion", discussion);
			ses.setAttribute("desired_wage" ,desired_wage);
			ses.setAttribute("cctv" ,cctv);
			
			
			return "register/dbm/profileImage";
		}
		
		// 돌봄몬 - 간단 자기소개입력 폼 >>
		@RequestMapping(value="/profileImageOk11", method = RequestMethod.POST)
		@ResponseBody
		public String dbmProfileImgUpload(
				  MultipartHttpServletRequest mtfRequest,
			      HttpSession ses,
			      HttpServletRequest req
				) {
			// folder where the pic will be saved
			String path = ses.getServletContext().getRealPath("/upload");
			System.out.println(path);
			
			// get the file from teacherPicture.jsp input name=
			MultipartFile mf = mtfRequest.getFile("pic2");

			String pic2 = null;

			if (mf != null) { // renaming
				String fName = mf.getOriginalFilename();
				if (fName != null && !fName.equals("")) {
					String oriFileName = fName.substring(0, fName.lastIndexOf("."));
					String oriExt = fName.substring(fName.lastIndexOf(".") + 1);

					File f = new File(path, fName);
					if (f.exists()) {
						for (int renameNum = 1;; renameNum++) { // 1,2,3,4...
							String renameFile = oriFileName + renameNum + "." + oriExt;
							f = new File(path, renameFile);

							if (!f.exists()) {
								fName = renameFile;
								break;
							}
						} // for
					}

					try {
						mf.transferTo(f); // create file
					} catch (Exception e) {
					}
					pic2 = fName; // "hi.jpg"

				} // if fName

			} // if mf!=Null
			
			System.out.println("픽="+pic2);	
			return pic2;
		}
		
		@RequestMapping(value="/dbm/profileImageOk2", method = RequestMethod.POST)
		public String dbmProfileOk(HttpSession ses,
				@RequestParam("pic") String pic) {
			ses.setAttribute("pic", pic);
			
			return "register/dbm/introduce";
		}
		
		
		@RequestMapping(value="/parent/profileImageOk", method = RequestMethod.POST)
		public ModelAndView parentImgUpload(
			      @RequestParam("pic") MultipartFile pic,
			      @RequestParam("userid") String userid,
			      HttpSession ses,
			      HttpServletRequest req
				) {
			MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
			
			String path = ses.getServletContext().getRealPath("/upload");
			System.out.println("path = " + path);
			String fileParamName1 = pic.getName();//폼의 파일첨부 객체 변수
			String oriFileName1 = pic.getOriginalFilename();// 원래 파일명
			System.out.println("getName() == > " + fileParamName1 + ", " + "getOriginaleFilename() == >"+oriFileName1);
			
			try {
				if(oriFileName1!=null) {
					pic.transferTo(new File(path, oriFileName1));//실제 파일업로드 발생 
				}
			}catch(IOException ie) {
				ie.printStackTrace();
			}
			String who = (String)ses.getAttribute("who");
			
			ModelAndView mav = new ModelAndView();
			
			System.out.println("들어옴 PPPPPPP" );
			int imgresult = dao.parentImageUpload(oriFileName1, userid);
			mav.addObject("imgresult", imgresult);
			mav.setViewName("register/regResult");
			
			return mav;
		}
		
		
		@RequestMapping("/dbm/introduce/np")
		public String dbmIntroduceNonePic(HttpSession ses) {
			String pic = "";
			ses.setAttribute("pic", pic);
			return "register/dbm/introduce";
		}
	}





















