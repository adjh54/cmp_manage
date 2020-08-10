package com.techboard.service.itfc.cmpInfo;

import java.util.List;

import org.springframework.stereotype.Service;

import com.techboard.vo.cmpInfo.CmpApplyInfoVO;
import com.techboard.vo.cmpInfo.CmpInfoVO;

@Service("cmpApplyInfoService")
public interface CmpApplyInfoService {
	
	public List<CmpApplyInfoVO> cmpApplyInfoList(CmpApplyInfoVO cmpApplyInfoVo) throws Exception;

	public CmpApplyInfoVO cmpApplyInfoListCnt(CmpApplyInfoVO cmpApplyInfoVo) throws Exception;

	public CmpApplyInfoVO cmpApplyInfoDetail(CmpApplyInfoVO cmpApplyInfoVo) throws Exception;
	
	public int cmpApplyInfoUpdate(CmpApplyInfoVO cmpApplyInfoVo) throws Exception;
	
}
