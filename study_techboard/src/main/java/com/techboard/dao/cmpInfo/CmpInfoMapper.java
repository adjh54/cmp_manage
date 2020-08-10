package com.techboard.dao.cmpInfo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.techboard.vo.cmpInfo.CmpApplyInfoVO;
import com.techboard.vo.cmpInfo.CmpInfoVO;

@Mapper
public interface CmpInfoMapper {
	
public List<CmpInfoVO> selectCmpInfoList(CmpInfoVO cmpInfoVo) throws Exception; 	//	회사정보 목록 조회
	
	public CmpInfoVO selectCmpInfoListCnt(CmpInfoVO cmpInfoVo) throws Exception;		// 	회사정보 목록 카운트 조회
		
	public int cmpInfoInsert(CmpInfoVO cmpInfoVo) throws Exception;					//	회사정보 등록
	
	public CmpInfoVO selectCmpInfoDetail(CmpInfoVO cmpInfoVo) throws Exception;		//	회사정보 상세 조회

	public int cmpInfoUpdate(CmpInfoVO cmpInfoVo) throws Exception;					//	회사정보 수정

	public int cmpInfoUpdateEtc(CmpInfoVO cmpInfoVo) throws Exception;					//	회사정보 수정 - 기타
	
	public int cmpApplyInfoInsert(CmpInfoVO cmpInfoVo) throws Exception;				//	회사 지원하기 - 회사_지원목록 테이블 등록

	public int cmpInfoDelete(CmpInfoVO cmpInfoVo) throws Exception;					//	회사정보 삭제
	
	public int cmpInfoUpdateFavoritesYn(CmpInfoVO cmpInfoVo) throws Exception;			//	즐겨찾기 기능
	
	public int cmpInfoUpdateReplyYn(CmpInfoVO cmpInfoVo) throws Exception;				//	이메일 회신여부 수정 기능
	
	public int cmpInfoUpdateApplyYn(CmpInfoVO cmpInfoVo) throws Exception;				//	회사 지원하기 기능

	public int cmpInfoUpdateGoodYn(CmpInfoVO cmpInfoVo) throws Exception;				//	회사 좋아요 기능

	public List<CmpApplyInfoVO> selectCmpApplyInfoList(CmpApplyInfoVO cmpApplyInfoVo) throws Exception; 	//	회사 지원 목록 조회
	
	public CmpApplyInfoVO selectCmpApplyInfoListCnt(CmpApplyInfoVO cmpApplyInfoVo) throws Exception;		// 	회사 지원 목록 카운트 조회
	
	public CmpApplyInfoVO cmpApplyInfoDetail(CmpApplyInfoVO cmpApplyInfoVo) throws Exception;		//	회사 지원정보 상세 조회
	
	public int cmpApplyInfoUpdate(CmpApplyInfoVO cmpApplyInfoVo) throws Exception;							//	면접 정보  수정 - 기타

}
