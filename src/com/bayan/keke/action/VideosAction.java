package com.bayan.keke.action;

import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.VideosService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.vo.KeVideos;
import com.bayan.keke.vo.MyPutRet;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.storage.persistent.FileRecorder;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

import javax.annotation.Resource;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

public class VideosAction extends BaseAction implements
        ModelDriven<KeVideos>, Preparable {
    //输出日志
    private static final Logger logger = Logger.getLogger(VideosAction.class);
    /* */
    @Resource
    private VideosService videosService;
    /* */
    private Auth auth = null;
    /* */
    private KeVideos keVideos;

    /* */
    public KeVideos getModel() {
        return keVideos;
    }

    /* */
    public void prepare() throws Exception {
        keVideos = new KeVideos();
    }

    /**
     * 上传视频token，发布正式版需要更换 QINIU_BUCKET
     * clientUpload
     * @return 返回上传token
     */
    public void getToken() {
        //跨域
        getResponse().setHeader("Access-Control-Allow-Origin","*");

        if (!CheckUtil.isNullOrEmpty(
                getSession().getAttribute("userId"))
                ) {
            auth = Auth.create(KeCommon.ACCESS_KEY, KeCommon.SECRET_KEY);
            String userId = String.valueOf(getSession().getAttribute("userId"));
            String key = KeCommon.createKey(userId);//bucket：key形式是用来限制客户端上传的名字必须和服务端一致才可以。

            StringMap putPolicy = new StringMap();
            //putPolicy.put("callbackUrl", getRequest().getContextPath()+ "/uploadCallBackVideos.jspx");
            putPolicy.put("returnBody", "{\"key\":\"$(key)\",\"hash\":\"$(etag)\",\"bucket\":\"$(bucket)\",\"fsize\":\"$(fsize)\",\"ext\":\"$(ext)\",\"length\":$(avinfo.video.duration)}");
            //putPolicy.put("callbackBody ", "{\"key\":\"$(key)\",\"hash\":\"$(etag)\",\"bucket\":\"$(bucket)\",\"fsize\":$(fsize)}");
            //putPolicy.put("callbackBodyType", "application/json");
            //putPolicy.putNotEmpty("saveKey",key);
            long expireSeconds = 3600;
            String upToken = auth.uploadToken(KeCommon.QINIU_VIDEO_BUCKET, null, expireSeconds, putPolicy);
            //String upToken = auth.uploadToken(KeCommon.QINIU_VIDEO_BUCKET);
            JSONObject jsonObject = new JSONObject();
            jsonObject.element("uptoken",upToken);
            print(jsonObject);
        }
    }

    /**
     * 七牛云视频信息持久化数据库
     * by kdn
     */
    public void uploadCallBack() {
        printStartLog("视频上传信息回调方法开始", logger);
        printParamsLog("视频上传信息回调参数:", logger);
        try{
            if (CheckUtil.checkNulls(
                    keVideos.getOrgId(),
                    keVideos.getVideoUrl(),
                    keVideos.getTitle())
                    ){
                printErrorLog("参数异常！",logger);
            }else{
                String topicImgUrl = keVideos.getVideoUrl() + "?vframe/jpg/offset/7";//截取第七帧
                keVideos.setTopicImg(topicImgUrl);
                boolean res = videosService.saveVideoInfo(keVideos);
                JSONObject j = new JSONObject();
                j.element("result",res);
                j.element("message","call back videos info result!");
                print(j);
            }

        }catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    /**
     * android & ios 获取接口
     * by kdn
     */
    public void getInfo() {
        printStartLog("获取视频列表方法开始", logger);
        if (CheckUtil.checkNulls(
                keVideos.getUserId())) {
            print("{\"code\":\"1005\",\"message\":\"参数异常\"}");
            printErrorLog("传入的参数为空值,请参考参数日志", logger);

        } else {
            try {
                KeVideos videos = videosService.getOrgId(keVideos.getUserId());
                Boolean watch =false;
                if(videos.getWatchAuthor() != null){
                    Integer watchAuthor = Integer.parseInt(videos.getWatchAuthor());
                    watch = (watchAuthor==1 || watchAuthor==3);
                }
                if(videos.getOrgId() != null & videos.getGrade() != null){
                    keVideos.setOrgId(videos.getOrgId());
                    keVideos.setGrade(videos.getGrade());
                    //keVideos.setWatchAuthor(videos.getWatchAuthor());
                }
                List<Map> videosList = videosService.getVideosInfo(keVideos);
                for(Map m: videosList){
                    if(m.containsKey("videoUrl") ){
                        String qiniuUrl = KeCommon.getPubURL(m.get("videoUrl").toString());
                        m.put("videoUrl",qiniuUrl);
                    }
                    if(m.containsKey("topicImg") ){
                        String qiniuUrl = KeCommon.getPubURL(m.get("topicImg").toString());
                        m.put("topicImg",qiniuUrl);
                    }
                }
                JSONObject json = new JSONObject();
                json.element("code", 1000);
                json.element("videoList", JSONArray.fromObject(videosList));
                json.element("watch",watch);
                print(json.toString());
                printEndLog("获取视频列表方法结束", json.toString(), logger);
            } catch (Exception e) {
                printSysErr(e, logger);
            }
        }
    }

    /**
     * by kdn
     */
    public void delete() {
        printStartLog("delete方法开始", logger);
        try {
            if (CheckUtil.isNullOrEmpty(
                    keVideos.getId())) {
                print("{\"code\":\"1005\",\"message\":\"参数异常\"}");
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
            } else {
                boolean res = videosService.deleteByStatus(keVideos);
                JSONObject json = new JSONObject();
                json.element("code", 1000);
                json.element("message", res);
                print(json);
            }
        } catch (Exception e) {
            printSysErr(e, logger);
        }

    }

    /**
     * by kdn
     */
    public void update() {
        printStartLog("update方法开始", logger);
        try {
            if (CheckUtil.isNullOrEmpty(
                    keVideos.getId())) {
                print("{\"code\":\"1005\",\"message\":\"参数异常\"}");
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
            } else {
                boolean res = videosService.updateInfo(keVideos);
                JSONObject json = new JSONObject();
                json.element("code", 1000);
                json.element("message", res);
                print(json);
            }
        } catch (Exception e) {
            printSysErr(e, logger);
        }

    }

    /**
     * by kdn 170906
     */
    public void getListToWeb(){
        printStartLog("getListToWeb方法开始", logger);
        printParamsLog("getListToWeb查询处理参数:", logger);
        //分页参数
        int start = (getPage() - 1) * getRows();
        keVideos.setStart(start);
        keVideos.setSize(getRows());
        if (CheckUtil.isNullOrEmpty(
                keVideos.getOrgId())) {
            return;
        }else {
            try {
                //查询总数
                int rstCount = videosService.countVideos(keVideos);
                //查询详情
                List<Map> list = videosService.getVideosToWeb(keVideos);
                for(Map<String,String> m: list){
                    if(m.containsKey("videoUrl") ){
                        String qiniuUrl = KeCommon.getPubURL(m.get("videoUrl").toString());
                        m.put("videoUrl",qiniuUrl);
                    }
                    if(m.containsKey("createTime") ){
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                        m.put("createTime",sdf.format(m.get("createTime")));
                    }
                }
                // 返回结果
                JSONArray jsonList = JSONArray.fromObject(list);
                JSONObject json = new JSONObject();
                json.element("total", rstCount);
                json.element("rows", jsonList.toString());
                print(json);
                // 请求结束log
                printEndLog("查询结束返回值:", json.toString(), logger);

            } catch (Exception e) {
                printSysErr(e, logger);
            }
        }
    }

    /**
     * java sever upload to qi-niu
     * by kdn
     */
    public void serverUpload() {
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone0());
        String upToken = getUpToken();
        //本地断点路径
        String localFilePath = "C:\\compositions\\12.jpg";
        //默认不指定key的情况下，以文件内容的hash值作为文件名
        String key = "server-upload";

        String localTempDir = Paths.get(System.getenv("java.io.tmpdir"), KeCommon.QINIU_VIDEO_BUCKET).toString();
        try {
            //设置断点续传文件进度保存目录
            FileRecorder fileRecorder = new FileRecorder(localTempDir);
            UploadManager uploadManager = new UploadManager(cfg, fileRecorder);
            try {
                Response response = uploadManager.put(localFilePath, key, upToken);
                //Response response = uploadManager.put(byteInputStream,key,upToken,null, null);
                //解析上传成功的结果
                DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
                System.out.println(putRet.key);
                System.out.println(putRet.hash);

                MyPutRet myPutRet = response.jsonToObject(MyPutRet.class);
                System.out.println(myPutRet.toString());
            } catch (QiniuException ex) {
                Response r = ex.response;
                System.err.println(r.toString());
                try {
                    System.err.println(r.bodyString());
                } catch (QiniuException ex2) {
                    //ignore
                }
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }

    }

    public void serverUpload2() {
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone0());
        //...其他参数参考类注释
        UploadManager uploadManager = new UploadManager(cfg);
        //...生成上传凭证，然后准备上传

        String localFilePath = "C:\\compositions\\12.jpg";
        //默认不指定key的情况下，以文件内容的hash值作为文件名
        String key = null;

        Auth auth = Auth.create(KeCommon.ACCESS_KEY, KeCommon.SECRET_KEY);
        String upToken = auth.uploadToken(KeCommon.QINIU_VIDEO_BUCKET);

        try {
            Response response = uploadManager.put(localFilePath, key, upToken);
            //解析上传成功的结果
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            System.out.println(putRet.key);
            System.out.println(putRet.hash);
        } catch (QiniuException ex) {
            Response r = ex.response;
            System.err.println(r.toString());
            try {
                System.err.println(r.bodyString());
            } catch (QiniuException ex2) {
                //ignore
            }
        }

    }

    private String getUpToken() {
        Auth auth = Auth.create(KeCommon.ACCESS_KEY, KeCommon.SECRET_KEY);
        StringMap putPolicy = new StringMap();
        putPolicy.put("returnBody", "{\"key\":\"$(key)\",\"hash\":\"$(etag)\",\"bucket\":\"$(bucket)\",\"fsize\":$(fsize)}");
        long expireSeconds = 3600;
        String upToken = auth.uploadToken(KeCommon.QINIU_VIDEO_BUCKET, null, expireSeconds, putPolicy);
        return upToken;
    }

}
