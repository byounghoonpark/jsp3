package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;

public class MemberMybatisDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String,Object> map = new HashMap<>();
	//mem 내용을 db에 insert
	public boolean insert(Member mem) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).insert(mem);
			if (cnt > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;			
	}
	public Member selectOne(String id) {
		SqlSession session = MybatisConnection.getConnection();
		try {
				return session.getMapper(cls).selectOne(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}
	public boolean update(Member mem) {
		SqlSession session = MybatisConnection.getConnection();
		
		try {
			int cnt =session.getMapper(cls).update(mem);
			return cnt > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}
	public boolean delete(String id) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			int cnt =session.getMapper(cls).delete(id);
			return cnt > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}
	public List<Member> list() {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).select();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}
	public boolean updatePass(String id, String pass) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			int cnt =session.getMapper(cls).updatepass(id,pass);
			return cnt > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}
	public String idSearch(String email,String tel) {
		SqlSession session = MybatisConnection.getConnection();
		
		map.clear();
		map.put("email", email);
		map.put("tel", tel);
		map.put("column", "id");
		try {
				return session.getMapper(cls).search(map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}
	public String pwSearch(String id, String email, String tel) {
		SqlSession session = MybatisConnection.getConnection();
		
		map.clear();
		map.put("id", id);
		map.put("email", email);
		map.put("tel", tel);
		map.put("column", "pass");
		try {
				return session.getMapper(cls).search(map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}
}

