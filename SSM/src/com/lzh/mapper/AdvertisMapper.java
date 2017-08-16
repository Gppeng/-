package com.lzh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lzh.domain.Advertise;
import com.lzh.domain.Page;

public interface AdvertisMapper {
	@Select("select * from advertise limit #{pageIndex},#{pageNum}")
	public List<Advertise> getAll(Page page);
	@Insert("insert into advertise(title,href,pic) values(#{title},#{href},#{pic})")
	public int insert(Advertise advertise);
	@Delete("delete from advertise where id=#{id}")
	public int delete(int id);
	@Update("update advertise set title=#{title},href=#{href},pic=#{pic}")
	public int update(Advertise advertise);
	@Select("select * from advertise where id=#{id}")
	public Advertise getOne(int id);
	@Select("select count(*) from advertise where title is not null")
	public Long getTotal();
}
