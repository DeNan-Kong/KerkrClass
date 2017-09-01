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
     * 上传视频token，发布正式版需要更换QINIU_BUCKET
     *
     * @return 返回上传token
     */
    public void getToken() {
        String token = "error";
        if (!CheckUtil.isNullOrEmpty(
                getSession().getAttribute("userId"))
                ) {
            auth = Auth.create(KeCommon.ACCESS_KEY, KeCommon.SECRET_KEY);

            token = auth.uploadToken(KeCommon.QINIU_VIDEO_BUCKET);
        }
        print(token);
    }

    public void getInfo() {
        printStartLog("获取视频列表方法开始", logger);
        if (CheckUtil.checkNulls(
                keVideos.getUserId())) {
            print("{\"code\":\"1005\",\"message\":\"参数异常\"}");
            printErrorLog("传入的参数为空值,请参考参数日志", logger);

        } else {
            try {
                List<Map> videosList = videosService.getVideosInfo(keVideos);
                JSONObject json = new JSONObject();
                json.element("code", 1000);
                json.element("videoList", JSONArray.fromObject(videosList));

                print(json.toString());
                printEndLog("获取视频列表方法结束", json.toString(), logger);
            } catch (Exception e) {
                printSysErr(e, logger);
            }
        }
    }

    public void upload() {
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone0());

        Auth auth = Auth.create(KeCommon.ACCESS_KEY, KeCommon.SECRET_KEY);
        String upToken = auth.uploadToken(KeCommon.QINIU_VIDEO_BUCKET);
        //本地断点路径
        String localFilePath = "C:\\compositions\\12.jpg";
        //默认不指定key的情况下，以文件内容的hash值作为文件名
        String key = null;

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

    public void upload2() {
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone0());
        //...其他参数参考类注释
        UploadManager uploadManager = new UploadManager(cfg);
        //...生成上传凭证，然后准备上传
        String accessKey = "your access key";
        String secretKey = "your secret key";
        String bucket = "your bucket name";
        //如果是Windows情况下，格式是 D:\\qiniu\\test.png
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

    public static void main(String[] arg) {

        VideosAction videosAction = new VideosAction();
        videosAction.upload();
    }
}
