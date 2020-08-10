package com.techboard.dao.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.techboard.vo.cmpInfo.CmpApplyInfoVO;
import com.techboard.vo.common.ConfManageInfoVO;

@Mapper
public interface ConfManageInfoMapper {
	
	public List<ConfManageInfoVO> confManageInfoList(ConfManageInfoVO confManageInfoVO) throws Exception; 	//	형상관리 정보 목록 조회
	
}
