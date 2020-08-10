package com.techboard.dao.cmpInfo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.techboard.vo.cmpInfo.CmpApplyInfoVO;

@Mapper
public interface CmpApplyInfoMapper {
	
	public List<CmpApplyInfoVO> cmpApplyInfoList(CmpApplyInfoVO cmpApplyInfoVo) throws Exception; 	//	회사 지원 목록 조회
	
	public CmpApplyInfoVO cmpApplyInfoListCnt(CmpApplyInfoVO cmpApplyInfoVo) throws Exception;		// 	회사 지원 목록 카운트 조회
	
	public CmpApplyInfoVO cmpApplyInfoDetail(CmpApplyInfoVO cmpApplyInfoVo) throws Exception;		//	회사 지원정보 상세 조회
	
	public int cmpApplyInfoUpdate(CmpApplyInfoVO cmpApplyInfoVo) throws Exception;							//	면접 정보  수정 - 기타
}
