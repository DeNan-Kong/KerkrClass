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

		return videosDao.getVideosAll(keVideos);
	}

	public List<Map> getVideosToWeb(KeVideos keVideos) throws Exception{
		return videosDao.getVideosInfo(keVideos);
	}

	public Boolean saveVideoInfo(KeVideos keVideos) throws Exception{
		keVideos = changeValue(keVideos);
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
		keVideos = changeValue(keVideos);
		int res = videosDao.updateInfo(keVideos);
		if(res > 0)
			return true;
		else
			return false;
	}

	public Integer countVideos(KeVideos keVideos) throws Exception{
		return videosDao.countVideos(keVideos);
	}

	private KeVideos changeValue (KeVideos src){
		String[] checkBox = null;
		if( !"".equals(src.getCheckboxValue())){
            checkBox = src.getCheckboxValue().split(",");
        }
		//观看权限,1:所有,2:在校生,3:网校生,4:不能观看
		if(checkBox!= null && checkBox.length >= 1){
			if(checkBox.length == 1){
				src.setWatchAuthor(checkBox[0]);
			}else {
				src.setWatchAuthor("1");
			}
		}else {
			src.setWatchAuthor("4");
		}
		return src;
	}

	public KeVideos getOrgId(String userId) throws Exception{
		return videosDao.getOrgId(userId);
	}
}
