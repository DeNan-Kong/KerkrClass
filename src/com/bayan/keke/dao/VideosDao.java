package com.bayan.keke.dao;

import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeVideos;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Scope("prototype")
@Repository
public class VideosDao extends BaseDao {

    public List<Map> getVideosInfo(KeVideos keVideos) throws Exception{
        return getSqlSession().selectList("videos.getVideosInfo",keVideos);
    }

    public String getOrgId(String userId) throws Exception{
        return getSqlSession().selectOne("videos.getOrgId",userId);
    }
}
