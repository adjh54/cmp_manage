package com.techboard.service.itfc.cmpInfo;

import java.util.List;

import org.springframework.stereotype.Service;

import com.techboard.vo.cmpInfo.CmpApplyInfoVO;
import com.techboard.vo.cmpInfo.CmpInfoVO;

@Service("cmpInfoService")
public interface CmpInfoService {
	
	public List<CmpInfoVO> selectCmpInfoList(CmpInfoVO cmpInfoVo) throws Exception;

	public CmpInfoVO selectCmpInfoListCnt(CmpInfoVO cmpInfoVo) throws Exception;
	
	public int cmpInfoInsert(CmpInfoVO cmpInfoVO) throws Exception;
	
	public CmpInfoVO selectCmpInfoDetail(CmpInfoVO cmpInfoVo) throws Exception;
	
	public int cmpInfoUpdate(CmpInfoVO cmpInfoVO) throws Exception;

	public int cmpInfoUpdateEtc(CmpInfoVO cmpInfoVO) throws Exception;
	
	public int cmpInfoUpdateFavoritesYn(CmpInfoVO cmpInfoVO) throws Exception;
	
	public int cmpInfoUpdateReplyYn(CmpInfoVO cmpInfoVO) throws Exception;

	public int cmpInfoUpdateGoodYn(CmpInfoVO cmpInfoVO) throws Exception;

	public int cmpApplyInfoInsert(CmpInfoVO cmpInfoVO) throws Exception;
	
	public int cmpInfoDelete(CmpInfoVO cmpInfoVO) throws Exception;

	public int cmpInfoUpdateApplyYn(CmpInfoVO cmpInfoVO) throws Exception;
	
	public List<CmpInfoVO> selectCmpInfoListTotalDownLoad(CmpInfoVO cmpInfoVo) throws Exception; 			//	회사 정보 목록 전체 다운로드
	
	public List<CmpInfoVO> selectCmpInfoListConditionDownLoad(CmpInfoVO cmpInfoVo) throws Exception; 		//	회사 정보 목록 상태 다운로드
	
}
