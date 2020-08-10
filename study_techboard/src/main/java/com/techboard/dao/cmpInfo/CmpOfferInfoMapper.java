package com.techboard.dao.cmpInfo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.techboard.vo.cmpInfo.CmpApplyInfoVO;
import com.techboard.vo.cmpInfo.CmpInfoVO;

@Mapper
public interface CmpOfferInfoMapper {
	
	public List<CmpInfoVO> cmpOfferInfoList(CmpInfoVO cmpInfoVo) throws Exception; 	//	회사 제안정보 목록 조회
	
	public CmpInfoVO cmpOfferInfoListCnt(CmpInfoVO cmpInfoVo) throws Exception;		// 	회사 제안정보 목록 카운트 조회
		
	public CmpInfoVO cmpOfferInfoDetail(CmpInfoVO cmpInfoVo) throws Exception;			//	회사 제안정보 상세 조회
	
	public int insertCmpOfferInfo(CmpInfoVO cmpInfoVo) throws Exception;				//	회사 제안정보 등록
	
	public int cmpOfferInfoUpdateArrReplyYn(CmpInfoVO cmpInfoVo) throws Exception;		// 회사 일괄 회신하기 
}
