package com.bayan.keke.html.service;

import com.bayan.keke.html.dao.HtmlDao;
import com.bayan.keke.vo.KeHtml;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 
 * @author zx
 *
 */
@Scope("prototype")
@Service
public class HtmlService {
	
	/**
	 * 
	 */
	@Resource
	private HtmlDao htmlDao;

	/**
	 * 判断是否已注册
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selPhotoInfo(KeHtml keHtml) throws Exception {
		return htmlDao.selPhotoInfo(keHtml);
	}
}
