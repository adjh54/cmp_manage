package com.techboard.service.impl.cmpInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.techboard.dao.cmpInfo.CmpApplyInfoMapper;
import com.techboard.service.itfc.cmpInfo.CmpApplyInfoService;
import com.techboard.vo.cmpInfo.CmpApplyInfoVO;
import com.techboard.vo.cmpInfo.CmpInfoVO;

@Repository
public class CmpApplyInfoServiceImpl implements CmpApplyInfoService{

	@Autowired
	CmpApplyInfoMapper cmpApplyInfoMapper;

	@Override
	public List<CmpApplyInfoVO> cmpApplyInfoList(CmpApplyInfoVO cmpApplyInfoVo) throws Exception {
		return cmpApplyInfoMapper.cmpApplyInfoList(cmpApplyInfoVo);
	}

	@Override
	public CmpApplyInfoVO cmpApplyInfoListCnt(CmpApplyInfoVO cmpApplyInfoVo) throws Exception {
		return cmpApplyInfoMapper.cmpApplyInfoListCnt(cmpApplyInfoVo);
	}

	@Override
	public CmpApplyInfoVO cmpApplyInfoDetail(CmpApplyInfoVO cmpApplyInfoVo) throws Exception {
		return cmpApplyInfoMapper.cmpApplyInfoDetail(cmpApplyInfoVo);
	}

	@Override
	public int cmpApplyInfoUpdate(CmpApplyInfoVO cmpApplyInfoVo) throws Exception {
		return cmpApplyInfoMapper.cmpApplyInfoUpdate(cmpApplyInfoVo);
	}
}
