package com.dolbommon.dbmon.register;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {
		////////////////공통//////////////	
		// 선생님, 부모님 회원가입 선택
		@RequestMapping("/join")
		public String join() {
			return "register/join";
		}
		
		// 선생님, 부모님 회원가입 폼
		@RequestMapping("/regForm")
		public String regForm() {
			return "register/regForm";
		}
		
		// 우편코드 선택창
		@RequestMapping("/zipcodeSearch")
		public String zipcodeSearch() {
			return "register/zipcodeSearch";
		}
		
		
		//////////////공통//////////////
		
		//////////////////////////// 학부모 회원가입 시작 /////////////////////////////////
		
		// 원하는 돌봄선택, 선생님 나이선택
		@RequestMapping("/parent/activityAndAge")
		public String parentActivityAndAge() {
			return "register/parent/activityAndAge";
		}
		
		// 자녀 정보 입력
		@RequestMapping("/parent/children")
		public String children() {
			return "register/parent/children";
		}
		
		// 학부모 - 지역(시,군,구,동) 설정 
		@RequestMapping("/parent/location")
		public String parentLoaction() {
			return "register/parent/location";
		}
		
		// 학부모 - 원하는 시간 입력
		@RequestMapping("/parent/schedule")
		public String parentSchedule() {
			return "register/parent/schedule";
		}
		
		// 학부모 - 특이사항 입력
		@RequestMapping("/parent/description")
		public String parentDescription() {
			return "register/parent/description";
		}
		
		////////////////////////////// 돌봄몬 회원가입 시작 //////////////////////////////////
		
		// 돌봄몬 - 유형 선택(선생님, 대학생, 엄마, 일반)
		@RequestMapping("/dbm/dbmType")
		public String joinDbmStart() {
			return "register/dbm/dbmType";
		}
		
		// 돌볼 수 있는 아이의 연령대와 가능한 활동
		@RequestMapping("/dbm/activityAndAge")
		public String dbmActivityAndAge() {
			return "register/dbm/activityAndAge";
		}
		
		// 돌봄몬 - 지역(시,군,구,동) 설정 
		@RequestMapping("/dbm/location")
		public String dbmLoaction() {
			return "register/dbm/location";
		}
		
		// 돌봄몬 - 원하는 시간 입력
		@RequestMapping("/dbm/schedule")
		public String dbmSchedule() {
			return "register/dbm/schedule";
		}
		
}
