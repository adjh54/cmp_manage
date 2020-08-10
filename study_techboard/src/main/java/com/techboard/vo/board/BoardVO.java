package com.techboard.vo.board;

import com.techboard.vo.common.CommonVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 게시판 메인 테이블 VO
 * @author JONGHOON
 *
 */

@Getter
@Setter
@ToString
public class BoardVO extends CommonVO {
	
	private String boardUniqNo;
	private String boardId;
	private String boardKindCode;
	private String boardTitle;
	private String boardCn;
	private String grpCtgr1;
	private String grpCtgr2;
	private String grpCtgr3;
	private String grpCtgr4;
	private String grpCtgr5;
	private String useYn;
	private String aplcId;
	private String regstId;
	private String rqstDttm;
	private String rgsrDttm;
	private String rqstTpCd;
	private String addDescCn;
	private String qryCnt;
	private int boardCnt;
	
	private String boardKindName;
	private String rownum;
	
	public void BoardVo() {}
	
}