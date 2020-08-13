package com.techboard.vo.cmpInfo;

import com.techboard.vo.common.CommonVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 회사_지원_정보 테이블 VO
 * @author JONGHOON
 *
 */

@Getter
@Setter
@ToString
public class CmpApplyInfoVO extends CommonVO{
	
//	TB_CMP_APPLY_INFO 테이블
	private String cmpApplyNo;
	private String cmpNo;
	private String cmpApplyYn;
	private String cmpApplyDocKindCode;
	private String cmpApply1stKindCode;
	private String cmpApply2stKindCode;
	private String cmpApplyDocInterviewInfo;
	private String cmpApply1stInterviewInfo;
	private String cmpApply2stInterviewInfo;
	private String cmpApplyDocInterviewDttm;
	private String cmpApply1stInterviewDttm;
	private String cmpApply2stInterviewDttm;
	private String cmpApplyDocInterviewTime;
	private String cmpApply1stInterviewTime;
	private String cmpApply2stInterviewTime;
	private String cmpApplyDocResultDttm;
	private String cmpApply1stResultDttm;
	private String cmpApply2stResultDttm;
	private String cmpInterviewPrepareInfo;
	private String cmpInterviewReviewInfo;
	
	private String userId;
	private String regDttm;
	private String modDttm;
	private String useYn;
	private String cmpProcessFinalCompleteYn;

//	TB_CMP_INFO 테이블
	private String cmpTitle;
	private String cmpLocation;
	private String cmpFoundedYear;
	private String cmpEmpCnt;
	private String cmpTouch;
	private String cmpKind;
	private String cmpDeadlineDttm;
	private String cmpJobPosition;
	private String cmpJobResponse;
	private String cmpJobQualification;
	private String cmpJobPrefer;
	private String cmpWarefare;
	private String cmpComment;
	private String cmpIncedenceRate;
	private String cmpResignationRate;
	private String cmpRecuritUrl;
	private String cmpHomepageUrl;
	private String cmpProgrammerKind;
	private String cmpFavoritesYn;
	private String cmpGoodYn;
	private String cmpRecuritKind;			//1: 사람인, 2: 잡코리아, 3: 헤드헌터, 4: 회사인사담당자
	private String cmpRecuritProcess;
	
	
//	가공 컬럼 영역
	private int cmpApplyInfoCnt;
	private int rownum;
	
	private String deadlineDay; 		// 남은 일수 계산
	private String foundedYear;			// 회사 연차 계산
	private String applyDocInterviewDayOfWeek;
	private String apply1stInterviewDayOfWeek;
	private String apply2stInterviewDayOfWeek;
	
	private String applyDocExcessDay;		// 오늘날짜 - 서류 지원일자 = 몇일 초과되었는지 계산
	private String apply1stExcessDay;		// 오늘날짜 - 서류 지원일자 = 몇일 초과되었는지 계산
	private String apply2stExcessDay;		// 오늘날짜 - 1차면접일자 = 몇일 초과되었는지 계산	
	
}
