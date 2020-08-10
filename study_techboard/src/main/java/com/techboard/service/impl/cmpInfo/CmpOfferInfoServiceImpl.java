package com.techboard.service.impl.cmpInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.techboard.dao.cmpInfo.CmpOfferInfoMapper;
import com.techboard.service.itfc.cmpInfo.CmpOfferInfoService;
import com.techboard.vo.cmpInfo.CmpInfoVO;

@Repository
public class CmpOfferInfoServiceImpl implements CmpOfferInfoService{

	@Autowired
	CmpOfferInfoMapper cmpOfferInfoMapper;

	@Override
	public List<CmpInfoVO> cmpOfferInfoList(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpOfferInfoMapper.cmpOfferInfoList(cmpInfoVo);
	}

	@Override
	public CmpInfoVO cmpOfferInfoListCnt(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpOfferInfoMapper.cmpOfferInfoListCnt(cmpInfoVo);
	}

	@Override
	public CmpInfoVO cmpOfferInfoDetail(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpOfferInfoMapper.cmpOfferInfoDetail(cmpInfoVo);
	}

	@Override
	public int insertCmpOfferInfo(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpOfferInfoMapper.insertCmpOfferInfo(cmpInfoVo);
	}

	@Override
	public int cmpOfferInfoUpdateArrReplyYn(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpOfferInfoMapper.cmpOfferInfoUpdateArrReplyYn(cmpInfoVo);
	}


}
