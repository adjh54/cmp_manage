package com.techboard.vo.cmpInfo;

import com.techboard.vo.common.CommonVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 회사정보 테이블 VO
 * @author JONGHOON
 *
 */

@Getter
@Setter
@ToString
public class CmpInfoVO extends CommonVO {

	private String cmpNo;
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
	private String regDttm;
	private String modDttm;
	private String useYn;					// Y: 사용, N: 미사용
	private String cmpApplyYn;				// Y: 지원, N: 미지원(Default)
	private String cmpIncedenceRate;
	private String cmpResignationRate;
	private String cmpRecuritUrl;
	private String cmpHomepageUrl;
	private String cmpProgrammerKind;
	private String cmpFavoritesYn;
	private String cmpRecuritKind;			//1: 사람인, 2: 잡코리아, 3: 헤드헌터, 4: 회사인사담당자
	private String cmpRecuritProcess;
	private String cmpReplyYn;				// Y: 응답완료, N: 미응답(Default)
	private String cmpOfferYn;				// Y: 제안, N: 미제안(Default)
	private String cmpBlockYn;				// Y: 블록, N: 블록아님(Default)
	private String cmpGoodYn;				// Y: 좋아요, N: Default
	
	// 가공 컬럼 영역
	private int cmpInfoCnt;
	private int cmpOfferInfoCnt;
	private int rownum;
	private String cmpPageFlag;			// 페이지 플래그
	private String searchKey;
	private String searchContent;
	private String searchContent2;		// 종료일을 위해서 추가
	private String regDttmEnd;		// 종료일을 위해서 추가
	
	private String orderingFlag;
	private String orderKind;
	private String ordering;
	private String[] cmpNoArr;
	private String regDayOfWeek;
	private String regDttmTodayYn;
	
	
	private String deadlineDay; 		// 남은 일수 계산
	private String foundedYear;			// 회사 연차 계산
	
	private String cmpInterviewPrepareInfo;
	private String cmpInterviewReviewInfo;
	
	public CmpInfoVO() {}		// 생성자
}
