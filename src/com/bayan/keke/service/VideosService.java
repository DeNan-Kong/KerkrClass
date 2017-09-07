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
		KeVideos videos = videosDao.getOrgId(keVideos.getUserId());
		if(videos.getOrgId() != null & videos.getGrade() != null){
			keVideos.setOrgId(videos.getOrgId());
			keVideos.setGrade(videos.getGrade());
		}
		return videosDao.getVideosInfo(keVideos);
	}

	public List<Map> getVideosToWeb(KeVideos keVideos) throws Exception{
		return videosDao.getVideosInfo(keVideos);
	}

	public Boolean saveVideoInfo(KeVideos keVideos) throws Exception{
		int res = videosDao.saveVideoInfo(keVideos);
		if(res > 0)
			return true;
		else
			return false;
	}

	public Boolean deleteByStatus(KeVideos keVideos) throws Exception{
		int res = videosDao.deleteByStatus(keVideos);
		if(res > 0)
			return true;
		else
			return false;
	}

	/**
	 * 更新Videos info
	 * @param keVideos
	 * @return
	 * @throws Exception
	 */
	public Boolean updateInfo(KeVideos keVideos) throws Exception{
		int res = videosDao.updateInfo(keVideos);
		if(res > 0)
			return true;
		else
			return false;
	}

	public Integer countVideos(KeVideos keVideos) throws Exception{
		return videosDao.countVideos(keVideos);
	}
}
