package com.techboard.vo.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 형상_관리_정보 테이블 VO
 * @author JONGHOON
 *
 */

@Getter
@Setter
@ToString
public class ConfManageInfoVO {
	
	private String confManageNo;
	private String confManageTitle;
	private String confManageContent;
	private String confManageKind;
	private String confManageDivision;
	private String regDttm;
	private String modDttm;
	private String doneYn;
	private String useYn;
	private String doneDttm;
	
	// 가공 컬럼
	private String cofManageInfoCnt;

}
