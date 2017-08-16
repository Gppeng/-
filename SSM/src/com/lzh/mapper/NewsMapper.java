package com.lzh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lzh.domain.News;
import com.lzh.domain.Page;

public interface NewsMapper {
	//插入新闻
	@Insert("insert into news(title,content,editor,post_time,type,attpic,readcount,href) values(#{title},#{content},#{editor},#{post_time},#{type},#{attpic},#{readcount},#{href})")
	public void insertNews(News news);
	//按id删除新闻
	@Delete("delete from news where id=#{id}")
	public void deleteNewById(int id);
	//修改新闻
	@Update("update news set title=#{title},content=#{content},editor=#{editor},post_time=#{post_time},type=#{type},attpic=#{attpic},readcount=#{readcount},href=#{href} where id=#{id}")
	public void updateNew(News news);
	//通过id查询新闻
	@Select("select * from news where id=#{id}")
	public List<News> getNew(int id);
	//按类型倒序新闻
	@Select("select * from news where type=#{type} order by id desc")
	public List<News> getNewsByType(String type);
	//新闻分页
	@Select("select * from news order by id desc limit #{pageIndex},#{pageNum}")
	public List<News> getNews(Page page);
	//按id倒序查询所有新闻
	@Select("select * from news order by id desc")
	public List<News> getall();
	//通过id查询新闻所有
	@Select("select * from news where id=#{id}")
	public News getOne(int id);
	//查询阅读量最大的类型
	@Select("select * from news where readcount=(select max(readcount) from news where type=#{type})")
	public News getMaxByType(String type);
	//按阅读量倒叙排列新闻10条
	@Select("select * from news order by readcount desc limit 1,10")
	public List<News> getByRead();
	//查询一天的新闻按阅读量排序10条
	@Select("select * from news where date(post_time) = curdate() order by readcount desc limit 1,10")
	public List<News> getByDateAndRead();
	//查询一周的新闻按阅读量排序10条
	@Select("select * from news where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(post_time) order by readcount desc limit 1,10")
	public List<News> getByWeekAndRead();
	//查询一月的新闻按阅读量排序10条
	@Select("select * from news where DATE_SUB(CURDATE(), INTERVAL 1 MONTH) <= date(post_time) order by readcount desc limit 1,10")
	public List<News> getByMonthAndRead();
	//按新闻标题模糊查询新闻
	@Select("select * from news where title like #{title}")
	public List<News> getNewsLikeTitle(String title);
	
}
