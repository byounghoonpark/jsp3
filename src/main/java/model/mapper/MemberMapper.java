package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	
	@Select("insert into member"
	+ " (id,pass,name,gender,tel,email,picture)"
	+ " values (#{id},#{pass},#{name},#{gender},"
		            +"#{tel},#{email},#{picture})")
	int insert(Member mem);
	
	@Select("select * From member where id= #{id}")
	Member selectOne(String id);

	@Update( "update member set name=#{name},gender=#{gender},"
			+ "email=#{email},tel=#{tel},picture=#{picture} "
			+ "where id=#{id}")
	int update(Member mem);
	
	@Delete( "delete from member where id=#{id}")
	int delete(String id);

	@Select("select * from member")
	List<Member> select();
	
	@Update("update member set pass=#{pass} where id=#{id}")
	int updatepass
	    (@Param("id")String id, @Param("pass")String pass);

	@Select({"script>",
			"select ${column} from member",
			"<trim prefix='where' prefixOverrides='AND||OR'>",
			"<if test='id != null'>and id=#{id}</if>",
			"<if test='email != null'>and email=#{email}</if>",
			"<if test='tel != null'>and tel=#{tel}</if>",
			"</trim>",
	        "</script>"})	
	String search(Map<String, Object> map);

	
	
	
	
	

}
