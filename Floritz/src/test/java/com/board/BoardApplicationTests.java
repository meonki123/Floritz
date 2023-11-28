package com.board;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.board.mapper.BoardMapper;

@SpringBootTest
class BoardApplicationTests {

	@Autowired
	private  DataSource   ds;
	
	@Autowired
	private  SqlSession   sqlSession;
	
	@Autowired
	private  BoardMapper  boardMapper;
	
	@Test
	void contextLoads() {
	}
	
	// datasource 연결 테스트
	@Test
	public  void  testConnection() throws SQLException {
		System.out.println("연결전:" + ds );
		Connection  conn = ds.getConnection();
		System.out.println("연결후:" + ds );
		conn.close();
	} 
	
	// test
	@Test
	public  void  test1() {
		double  n1 = 10;
		double  n2 = 3;
		double  n  = n1 / n2;
		System.out.println( n );
	//	assertEquals(n, 3.5);
		assertEquals(n, 3.5, 0.5); // 0.5 : 오차범위
	}
	
	// sqlSession test
	@Test
	public  void testSqlSession() {
		System.out.println("sqlSession:" + sqlSession);
	}
	
/*
 * // insertBoard test
 * 
 * @Test public void testInsert() { BoardVo vo = new BoardVo();
 * vo.setTitle("제목입니다"); vo.setContent("내용입니다"); vo.setWriter("글쓴이");
 * boardMapper.boardInsert(vo); System.out.println("저장되었습니다"); }
 * 
 */
 }












