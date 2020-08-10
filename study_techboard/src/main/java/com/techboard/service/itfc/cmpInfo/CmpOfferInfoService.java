package com.techboard.service.itfc.cmpInfo;

import java.util.List;

import org.springframework.stereotype.Service;

import com.techboard.vo.cmpInfo.CmpApplyInfoVO;
import com.techboard.vo.cmpInfo.CmpInfoVO;

@Service("cmpOfferInfoService")
public interface CmpOfferInfoService {
	
	public List<CmpInfoVO> cmpOfferInfoList(CmpInfoVO cmpInfoVo) throws Exception;

	public CmpInfoVO cmpOfferInfoListCnt(CmpInfoVO cmpInfoVo) throws Exception;
	
	public CmpInfoVO cmpOfferInfoDetail(CmpInfoVO cmpInfoVo) throws Exception;
	
	public int insertCmpOfferInfo(CmpInfoVO cmpInfoVo) throws Exception;					//	회사정보 등록
	
	public int cmpOfferInfoUpdateArrReplyYn(CmpInfoVO cmpInfoVo) throws Exception;
	
}
