package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Engine;
import dto.Keyword;
import dto.User;

public class MyBatisDao {
	private SqlSessionFactory sqlSessionFactory = null;
	 public MyBatisDao(SqlSessionFactory sqlSessionFactory){
	        this.sqlSessionFactory = sqlSessionFactory;
	    }
	 //----------------------------------회원가입-----------------------------------------------
	 public int insert_user(User user){
	        int result = -1;
	        SqlSession session = sqlSessionFactory.openSession(); // SQL 발행, 트랜잭션 제어용 API 제공
	        try {
	        	result = session.insert("UserMapper.insert_user", user);
	        } finally {
	            session.commit();
	            session.close();
	        }
	 
	        return result;
	    }
	 
	//----------------------------------로그인-----------------------------------------------
	 public User login(User loginuser){
		 User user = null;
	        SqlSession session = sqlSessionFactory.openSession();
	        try {
	        	user = session.selectOne("UserMapper.login", loginuser);
	        } finally {
	            session.close();
	        }
	 
	        return user;
	    }
	 
	//----------------------------------id check-----------------------------------------------
	 public int idCheck(String id) {
		  int result = -1;
	        SqlSession session = sqlSessionFactory.openSession(); 
	        try {
	        	result = session.selectOne("UserMapper.idcheck", id);
	        } finally {
	            session.commit();
	            session.close();
	        }
	 
	        return result;
		 
	 }
	 
	 //----------------------------------insert word-----------------------------------------------
	 public void insert_word(Keyword keyword){
	        SqlSession session = sqlSessionFactory.openSession(); // SQL 발행, 트랜잭션 제어용 API 제공
	        try {
	        	session.insert("UserMapper.insert_keyword",keyword);
	        } finally {
	            session.commit();
	            session.close();
	        }
	    }
	 
	//----------------------------------select best word-----------------------------------------------
		 public List<Keyword> selectList(){
			 List<Keyword> list = new ArrayList<Keyword>();
		        SqlSession session = sqlSessionFactory.openSession(); // SQL 발행, 트랜잭션 제어용 API 제공
		        try {
		        	 list = session.selectList("UserMapper.best_list");
		        } finally {
		            session.commit();
		            session.close();
		        }
				return list;
		    }
		 
		//----------------------------------select word list-----------------------------------------------
		 public List<Keyword> select_wordList(){
			 List<Keyword> list = new ArrayList<Keyword>();
		        SqlSession session = sqlSessionFactory.openSession(); // SQL 발행, 트랜잭션 제어용 API 제공
		        try {
		        	 list = session.selectList("UserMapper.word_list");
		        } finally {
		            session.commit();
		            session.close();
		        }
				return list;
		    }
		 
		//----------------------------------insert engine-----------------------------------------------
		 public void insert_engine(Engine engine){
		        SqlSession session = sqlSessionFactory.openSession(); // SQL 발행, 트랜잭션 제어용 API 제공
		        try {
		        	session.insert("UserMapper.insert_engine",engine);
		        } finally {
		            session.commit();
		            session.close();
		        }
		    }
		 
		//----------------------------------select url-----------------------------------------------
		 public String select_url(String word){
		        SqlSession session = sqlSessionFactory.openSession(); // SQL 발행, 트랜잭션 제어용 API 제공
		        String url = null;
		        try {
		        	 url = session.selectOne("UserMapper.select_url",word);
		        } finally {
		            session.commit();
		            session.close();
		        }
				return url;
		    }
	 
}
