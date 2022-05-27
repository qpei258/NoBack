package com.noback.group.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.noback.group.vo.MemberVO;
import com.noback.group.vo.SignVO;


/**
 * 전자결제관련 Mybatis 사용 메서드
 */
public interface SignMapper {

	public SignVO getSign(int sign_num); //(처리해야할)결제서류 읽기
	public SignVO getSignn(int sign_num); //내가 작성한 결제서류 확인
	
	public int insertSign(SignVO sign); //결제 서류 작성
	
	public ArrayList<SignVO> listSign(String searchText, RowBounds rb);//결제 올린 서류리스트 

	public int getTotal(String searchText);//글개수 조회용

	public ArrayList<MemberVO> getMember(String name);//회원 정보 검색(결제문서 불러올떄 쓰는거)

	public MemberVO member(String num);//회원 정보 검색(수신자 찾을떄 쓰는거)

	public int complete(SignVO sign);//글 수정

	public ArrayList<SignVO> listSign2(Map<String, String> map, RowBounds rb);//결제 대기중인 서류리스트




}