package com.bayan.keke.service;

import com.bayan.keke.dao.VideosDao;
import com.bayan.keke.vo.KeVideos;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Scope("prototype")
@Service
public class VideosService {
	/* */
	@Resource
	private VideosDao videosDao;

	public List<Map> getVideosInfo(KeVideos keVideos) throws Exception{
		String orgId = videosDao.getOrgId(keVideos.getUserId());
		keVideos.setOrgId(orgId);
		return videosDao.getVideosInfo(keVideos);
	}

	public Boolean saveVideoInfo(KeVideos keVideos) throws Exception{
		int res = videosDao.saveVideoInfo(keVideos);
		if(res > 0)
			return true;
		else
			return false;
	}

}
