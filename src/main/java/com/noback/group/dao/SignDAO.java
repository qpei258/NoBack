package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.noback.group.vo.SignVO;

@Repository
public class SignDAO {
	@Autowired
	SqlSession sqlSession;
	
	//SingMapper mapper = sqlSession.getMapper(SignMapper.class);
	
	//글쓰기
		public int write(SignVO sign) {
			SignMapper mapper = sqlSession.getMapper(SignMapper.class);
			int result = 0;
			result = mapper.insertSign(sign);
			return result;		
		}
}
