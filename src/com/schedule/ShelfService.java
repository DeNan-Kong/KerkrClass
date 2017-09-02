package com.schedule;

import java.util.List;
import javax.annotation.Resource;
import com.bayan.keke.dao.PayDao;
import com.bayan.keke.dao.SubjectDao;

/**
 * 查询所有任务时间小于1小时对应的subject
 * 
 * @author app
 * 
 */
public class ShelfService {

	/**/
	@Resource
	private SubjectDao subjectDao;
	/**/
	@Resource
	private PayDao payDao;
	
	/**
	 * 支付功能
	 * 设置了spring定时任务机制
	 * 所有支付过的用户每天减去1L油量
	 */
	public void jobPay() {
		try {
			//如果有油量剩余的用户，则每天减去1L。
			List<String> user = payDao.shelf();
			if (user.size() > 0) {
				//每天23:59更新减去1L油。
				payDao.updateShelf();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
