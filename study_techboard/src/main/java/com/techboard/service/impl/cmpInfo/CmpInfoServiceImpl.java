package com.techboard.service.impl.cmpInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.techboard.dao.cmpInfo.CmpInfoMapper;
import com.techboard.service.itfc.cmpInfo.CmpInfoService;
import com.techboard.vo.cmpInfo.CmpApplyInfoVO;
import com.techboard.vo.cmpInfo.CmpInfoVO;

@Repository
public class CmpInfoServiceImpl implements CmpInfoService{

	@Autowired
	CmpInfoMapper cmpInfoMapper;

	@Override
	public List<CmpInfoVO> selectCmpInfoList(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.selectCmpInfoList(cmpInfoVo);
	}

	@Override
	public CmpInfoVO selectCmpInfoListCnt(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.selectCmpInfoListCnt(cmpInfoVo);
	}


	@Override
	public CmpInfoVO selectCmpInfoDetail(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.selectCmpInfoDetail(cmpInfoVo);
	}

	@Override
	public int cmpInfoUpdate(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.cmpInfoUpdate(cmpInfoVo);
	}

	@Override
	public int cmpInfoUpdateEtc(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.cmpInfoUpdateEtc(cmpInfoVo);
	}

	@Override
	public int cmpInfoUpdateFavoritesYn(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.cmpInfoUpdateFavoritesYn(cmpInfoVo);
	}

	@Override
	public int cmpInfoUpdateReplyYn(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.cmpInfoUpdateReplyYn(cmpInfoVo);
	}

	@Override
	public int cmpApplyInfoInsert(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.cmpApplyInfoInsert(cmpInfoVo);
	}

	@Override
	public int cmpInfoDelete(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.cmpInfoDelete(cmpInfoVo);
	}

	@Override
	public int cmpInfoUpdateApplyYn(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.cmpInfoUpdateApplyYn(cmpInfoVo);
	}

	@Override
	public int cmpInfoInsert(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.cmpInfoInsert(cmpInfoVo);
	}

	@Override
	public int cmpInfoUpdateGoodYn(CmpInfoVO cmpInfoVo) throws Exception {
		return cmpInfoMapper.cmpInfoUpdateGoodYn(cmpInfoVo);
	}


}
