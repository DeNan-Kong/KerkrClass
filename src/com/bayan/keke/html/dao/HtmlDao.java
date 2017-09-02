package com.bayan.keke.html.dao;

import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeHtml;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Scope("prototype")
@Repository
public class HtmlDao extends BaseDao {

	/**
	 * 判断是否已注册
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selPhotoInfo(KeHtml keHtml) throws Exception {
		return this.getSqlSession().selectOne("html.selPhotoInfo", keHtml);
	}
	

}
