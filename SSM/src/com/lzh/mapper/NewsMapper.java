package com.lzh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lzh.domain.News;
import com.lzh.domain.Page;

public interface NewsMapper {
	//��������
	@Insert("insert into news(title,content,editor,post_time,type,attpic,readcount,href) values(#{title},#{content},#{editor},#{post_time},#{type},#{attpic},#{readcount},#{href})")
	public void insertNews(News news);
	//��idɾ������
	@Delete("delete from news where id=#{id}")
	public void deleteNewById(int id);
	//�޸�����
	@Update("update news set title=#{title},content=#{content},editor=#{editor},post_time=#{post_time},type=#{type},attpic=#{attpic},readcount=#{readcount},href=#{href} where id=#{id}")
	public void updateNew(News news);
	//ͨ��id��ѯ����
	@Select("select * from news where id=#{id}")
	public List<News> getNew(int id);
	//�����͵�������
	@Select("select * from news where type=#{type} order by id desc")
	public List<News> getNewsByType(String type);
	//���ŷ�ҳ
	@Select("select * from news order by id desc limit #{pageIndex},#{pageNum}")
	public List<News> getNews(Page page);
	//��id�����ѯ��������
	@Select("select * from news order by id desc")
	public List<News> getall();
	//ͨ��id��ѯ��������
	@Select("select * from news where id=#{id}")
	public News getOne(int id);
	//��ѯ�Ķ�����������
	@Select("select * from news where readcount=(select max(readcount) from news where type=#{type})")
	public News getMaxByType(String type);
	//���Ķ���������������10��
	@Select("select * from news order by readcount desc limit 1,10")
	public List<News> getByRead();
	//��ѯһ������Ű��Ķ�������10��
	@Select("select * from news where date(post_time) = curdate() order by readcount desc limit 1,10")
	public List<News> getByDateAndRead();
	//��ѯһ�ܵ����Ű��Ķ�������10��
	@Select("select * from news where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(post_time) order by readcount desc limit 1,10")
	public List<News> getByWeekAndRead();
	//��ѯһ�µ����Ű��Ķ�������10��
	@Select("select * from news where DATE_SUB(CURDATE(), INTERVAL 1 MONTH) <= date(post_time) order by readcount desc limit 1,10")
	public List<News> getByMonthAndRead();
	//�����ű���ģ����ѯ����
	@Select("select * from news where title like #{title}")
	public List<News> getNewsLikeTitle(String title);
	
}
