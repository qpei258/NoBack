package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.noback.group.vo.ReceiverVO;
import com.noback.group.vo.SignVO;


/**
 * 전자결제관련 Mybatis 사용 메서드
 */
public interface SignMapper {

	public SignVO getSign(int sign_num);

	public int insertSign(SignVO sign);
	public int insertReceiver(ReceiverVO receiver);
	
	public ArrayList<SignVO> listSign(String searchText, RowBounds rb);

	public int getTotal(String searchText);
	
	

}