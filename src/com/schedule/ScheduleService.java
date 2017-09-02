package com.schedule;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import com.bayan.keke.action.KeCommon;
import com.bayan.keke.dao.SubjectDao;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.vo.KeSubject;
import com.bayan.keke.vo.KeTeaIncomeRcd;

/**
 * 定时任务
 * 
 * @author zx
 * 
 */
public class ScheduleService {

    private static final Logger logger = Logger.getLogger(ScheduleService.class);
    
	/**
	 * 
	 */
	@Resource
	private SubjectDao subjectDao;

    /**
     * 若学生不提交评分，则该组作业状态在0:00会自动评为5颗星，计算学分，并给老师计算钱
     */
    public void autoSetPoint(){
    	
    	try {
    		
        	logger.debug("autoSetPoint开始");
        	
        	// 获取没有评分的学生
        	List<KeSubject> userList = subjectDao.getNoPointUser();
        	
        	// 学分计算
        	int countRight = 0;
        	String beforeGroupId = "";
        	for (KeSubject keSubject : userList) {
				
        		// 同一组作业，只计算一次学分
        		if(!beforeGroupId.equals(keSubject.getGroupId())){
        			
                	//获得学分
        			List<Map<String,Object>> rstList = subjectDao.getErrorResult(keSubject);
                	countRight = 0;
                	for (Map<String,Object> rst : rstList) {
                		int rightNum = Integer.parseInt(rst.get("result").toString());
                		countRight = countRight + rightNum;
        			}
                	Integer point = KeCommon.getPoint(countRight, rstList.size());
                	
                	// 更新学分
                	if(point > 0 ){
                    	//作业结果确认
                		keSubject.setPointAll(point);
                		subjectDao.updatePointAll(keSubject);
                	}
                	
                	beforeGroupId = keSubject.getGroupId();
        		}

//				// 给老师计算钱
//				subjectDao.addMoney(keSubject);
//				
//				// 添加收入记录
//				KeTeaIncomeRcd teaIncomeRcd = new KeTeaIncomeRcd();
//				teaIncomeRcd.setTeacherId(keSubject.getTeacherId());
//				teaIncomeRcd.setAmount(KeConstant.MONEY_ONE);
//				teaIncomeRcd.setType(KeConstant.TYPE_IN);
//				subjectDao.insTeaIncomeRcd(teaIncomeRcd);
			}

    		// 老师评价自动评为5颗星，状态改为已完成
			subjectDao.autoSetPoint();
			
        	logger.debug("autoSetPoint结束");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }


}
