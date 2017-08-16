package com.lzh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.lzh.domain.Discuss;
import com.lzh.domain.News;
import com.lzh.domain.Page;
import com.lzh.domain.User;

public interface DiscussMapper {
	@Select("select * from discuss limit #{pageIndex},#{pageNum}")
	public List<Discuss> getAll(Page page);
	//根据did查询数据
	@Select("select u.trueName,u.pic,u.userName,n.title,d.* from user u,news n,discuss d where did=#{did} and u.id=d.uid and n.id=d.nid order by id desc")
	@Results({
		@Result(property="id", column = "id",id = true),
		@Result(property="uid", column = "uid"),
		@Result(property="post_time", column = "post_time"),
		@Result(property="content", column = "content"),
		@Result(property="nid", column = "nid"),
		@Result(property="did", column = "did"),
		@Result(property="user",column="uid",one=@One(select="getUser")),
		@Result(property="news" ,column="nid",one=@One(select="getNews")),
	})
	public List<Discuss> getByDid(int did);
	//根据新闻查询评论
	@Select("select u.trueName,u.pic,u.userName,n.title,d.* from user u,news n,discuss d where nid=#{nid} and u.id=d.uid and n.id=d.nid order by id desc")
	@Results({
		@Result(property="id", column = "id",id = true),
		@Result(property="uid", column = "uid"),
		@Result(property="post_time", column = "post_time"),
		@Result(property="content", column = "content"),
		@Result(property="nid", column = "nid"),
		@Result(property="did", column = "did"),
		@Result(property="user",column="uid",one=@One(select="getUser")),
		@Result(property="news" ,column="nid",one=@One(select="getNews")),
	})
	public List<Discuss> getByNid(int nid);
	@Select("select count(*) from discuss where content is not null")
	public long getTotal();
	//删除评论
	@Delete("delete from discuss where id = #{id}")
	public int delete(int id);
	//插入评论
	@Insert("insert into discuss(uid,post_time,content,nid,did) values(#{uid},#{post_time},#{content},#{nid},#{did})")
	public int insert(Discuss discuss);
	@Insert("insert into discuss(uid,post_time,content,nid,did) values(#{uid},#{post_time},#{content},#{nid},#{did})")
	public void insertDiscuss(Discuss discuss);
	@Select("select * from user u where u.id=#{uid}")
	public User getUser();
	@Select("select * from news n where n.id=#{nid}")
	public News getNews();
	@Select("select * from discuss  where id=#{id}")
	public Discuss getById(int id);
}
