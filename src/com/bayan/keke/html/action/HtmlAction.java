package com.bayan.keke.html.action;

import com.bayan.keke.action.KeCommon;
import com.bayan.keke.base.BaseAction;
import com.bayan.keke.html.service.HtmlService;
import com.bayan.keke.service.SubjectService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.vo.*;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author zx
 *
 */
public class HtmlAction extends BaseAction
    implements ModelDriven<KeHtml>, Preparable {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 2299778301374382990L;

    private static final Logger logger = Logger.getLogger(HtmlAction.class);

    //
    private KeHtml keHtml;

    @Resource
    private SubjectService subjectService;
    @Resource
    private HtmlService htmlService;

    @Override
    public void prepare() throws Exception {
    	keHtml = new KeHtml();
    }

    @Override
    public KeHtml getModel() {
        return keHtml;
    }

    /**
     * 日报请求
     */
    public void shareDaily(){

    	printStartLog("方法开始shareDaily", logger);
    	printParamsLog("分享日报请求参数。", logger);

		// 参数验证
		if (CheckUtil.checkNulls(
				keHtml.getShareId())) {

			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}

        // 获取日报信息
        List<KeDaily> keDailyList = null;
        KeSubject keSubject = new KeSubject();
        
        try {
			// shared 
			Map<String, Object> photoMap = htmlService.selPhotoInfo(keHtml);
			if(photoMap == null){
				print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
				return;
			}
			
			// 分享日报信息
			keSubject.setUserId(photoMap.get("user_id").toString());
			keSubject.setSubjectType(photoMap.get("subject_type").toString());
			keSubject.setCreateTime(photoMap.get("share_time").toString());

			keDailyList = subjectService.dayListSubject(keSubject);
			
	        if(keDailyList==null || keDailyList.size() == 0){
	        	
	        	// 查询历史表
	        	keSubject.setFlg(1);
	        	keDailyList = subjectService.dayListSubject(keSubject);
	        	
	        	if(keDailyList==null || keDailyList.size() == 0){
	        		printDebugLog("没有对应的日报", logger);
	        		
	        		JSONObject json = new JSONObject();
	        		json.element("code", KeConstant.NO_DAILY);
	        		print(json);
	        		return;
	        	}
	        }
        } catch (Exception e) {
            printSysErr(e, logger);
            return;
        }
        
        // 返回前台数据
        KeDailyOpt keDailyOpt = new KeDailyOpt();
        StringBuilder commentBld = new StringBuilder();
        String beforePhotoId = "";
        String beforeCreateTime = "";
        String beforeUpdateTime = "";
        int countRight = 0;
        int countError = 0;
        int title = 1;
        KePhotoResult photoRst = null;
        List<KeMark> pointsRstList = null;
        List<KePhotoResult> photoResultList = new ArrayList<KePhotoResult>();;
        for (int i = 0; i< keDailyList.size(); i++) {
            KeDaily keDaily = keDailyList.get(i);
            
            // 批改作业信息
            KeMark keMark = new KeMark();
            keMark.setPointx(keDaily.getPointx());
            keMark.setPointy(keDaily.getPointy());
            keMark.setDirection(keDaily.getDirection());
            keMark.setContent(keDaily.getReason());
            keMark.setResult(keDaily.getResult());
            
            if(KeConstant.ERROR.equals(keDaily.getResult())){
                countError++;
            }else{
                countRight++;
            }
            
            // 判断是否同一张图片
            if(beforePhotoId.equals(keDaily.getPhotoId())){
            	
            	// 同一张图片只统计错误题目
                pointsRstList.add(keMark);
            }else{
                
            	// 下一张图片的信息统计
                if( i == 0){
                	
                	// 第一张图片
                    beforeCreateTime = keDaily.getCreateTime();
                    beforeUpdateTime = keDaily.getUpdateTime();
                }else{
                    photoRst.setPointsResult(pointsRstList);
                    photoResultList.add(photoRst);
                    
                    if(beforeCreateTime.compareTo(keDaily.getCreateTime()) < 0){
                        beforeCreateTime = keDaily.getCreateTime();
                    }
                    
                    if(beforeUpdateTime.compareTo(keDaily.getUpdateTime()) > 0){
                        beforeUpdateTime = keDaily.getUpdateTime();
                    }
                }

                photoRst = new KePhotoResult();
                photoRst.setPhotoUrl(KeCommon.getUrlSign(keDaily.getPhotoUrl()));

                //模糊图片取得退回的理由,模糊的时候将评论信息显示在模糊图片上
                pointsRstList = new ArrayList<KeMark>();
                if ("INVALID".equals(photoRst.getTaskStatus())){
                	//返回退回理由
                	photoRst.setCause(keDaily.getComment());
				}else{
                	commentBld.append(String.valueOf(title) + "." + keDaily.getComment() + "\n");
                	title = title + 1;
                	pointsRstList.add(keMark);
				}

                beforePhotoId = keDaily.getPhotoId();
            }
        }
        
        photoRst.setPointsResult(pointsRstList);
        photoResultList.add(photoRst);

        //图片信息
        keDailyOpt.setPhotoResult(photoResultList);
        // 该份作业的评级（A，B,C,D,E）
        keDailyOpt.setLevel(getClassInfo(countRight, countError));
        // 老师评语
        keDailyOpt.setComment(commentBld.toString());
        keDailyOpt.setCreateTime(keSubject.getCreateTime());
        keDailyOpt.setCountError(String.valueOf(countError));
        
        JSONObject json = JSONObject.fromObject(keDailyOpt);
        json.element("code", KeConstant.KE_SUCCESS);
        
        String callbackJson = "kerkr(" + json.toString() + ")";

        print(callbackJson);
        
		// 请求结束log
		printEndLog("日报分享结束返回值:", json.toString(), logger);
    }

    /**
     * 获取评级
     * @param countRight
     * @param countError
     * @return
     */
    private String getClassInfo(int countRight,int countError){
    	
    	int total = countRight + countError;
    	if(countRight*100/total >= 96){
    		return "A+";
    	}else if(countRight*100/total >= 90){
    		return "A";
    	}else if(countRight*100/total >= 80){
    		return "B";
    	}else {
    		return "C";
    	}
    }

}
