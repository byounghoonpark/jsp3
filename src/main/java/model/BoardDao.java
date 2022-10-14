package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	public int maxnum() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select nvl(max(num),0) from board");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	public boolean insert(Board board) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into board(num,writer,pass,subject," 
					 + "content,file1,regdate,readcnt,grp,grplevel,"
					 + "grpstep,boardid,ip)" 
					 + " values (?,?,?,?,?,?,sysdate,0,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getPass());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getFile1());
			pstmt.setInt(7, board.getGrp());
			pstmt.setInt(8, board.getGrplevel());
			pstmt.setInt(9, board.getGrpstep());
			pstmt.setString(10, board.getBoardid());
			pstmt.setString(11, board.getIp());
			return pstmt.executeUpdate() > 0;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}
	public int boardCount(String boardid) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "select count(*) from board where boardid = ?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardid);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1); //게시물 ~
		} catch(SQLException e) {
			e.printStackTrace();
		} finally { 
			DBConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	public List<Board> list(int pageInt, int limit, String boardid) {
		//pageInt : 조회하고자 하는 페이지번호. 현재페이지
		//limit : 페이지당 보여지는 게시물 건수
		//boardid : 게시판 종류. 1:공지사항, 2:자유게시판, 3:QNA
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from ( " +
					 "select rownum rnum, a.* from ( " +
					 "select * from board where boardid = ? " +
					 "order by grp desc, grpstep asc ) a) " +
					 "where rnum BETWEEN ? and ? ";
		List<Board> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardid);
			/*
			 * pageInt : 1  rum : 1~10
			 * pageInt : 2  rum : 11~20
			 */
			pstmt.setInt(2, (pageInt-1)*limit + 1);  //11
			pstmt.setInt(3, pageInt*limit);			 //20
			rs = pstmt.executeQuery(); //10개의 레코드만 조회
			while(rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setWriter(rs.getString("writer"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setGrp(rs.getInt("grp"));
				b.setGrpstep(rs.getInt("grpstep"));
				b.setGrplevel(rs.getInt("grplevel"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getDate("regdate"));
				list.add(b);
			}
			return list;
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	public Board selectOne(int num) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "select * from board where num=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num")); //여기서 num은 컬럼명
				b.setWriter(rs.getString("writer"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setGrp(rs.getInt("grp"));
				b.setGrplevel(rs.getInt("grplevel"));
				b.setGrpstep(rs.getInt("grpstep"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getDate("regdate"));
				return b;
			} 
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	//조회수 1증가
	public void readcntAdd(int num) {
		String sql = "update board set readcnt = readcnt+1 where num=?";
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
	}
	public boolean update(Board board) {
		String sql = "update board set"
				+ "subject=?,content=?,file1=?"
				+ "where num=?";
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getFile1());
			pstmt.setInt(4, board.getNum());
			return pstmt.executeUpdate()>0;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}
}