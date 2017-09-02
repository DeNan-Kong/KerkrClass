<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>上传视频</title>
        <script src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
        <link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    </head>
    <body>
    <div class="row" style="margin-top: 20px;">
    <div class="col-md-12">
        <div id="container">
            <a class="btn btn-default btn-lg " id="pickfiles" href="#" >
                <i class="glyphicon glyphicon-plus"></i>
                <span>选择文件</span>
            </a>
            <a class="btn btn-default btn-lg " id="up_load"  href="#" >
                <span>确认上传</span>
            </a>
            <a class="btn btn-default btn-lg " id="stop_load"  href="#" >
                <span>暂停上传</span>
            </a>
            <a class="btn btn-default btn-lg " id="retry"  href="#" >
                <span>重试</span>
            </a>
        </div>
    </div>
    <div style="display:none" id="success" class="col-md-12">
        <div class="alert-success">
            队列全部文件处理完毕
        </div>
    </div>
        <div class="col-md-12 ">
            <table class="table table-striped table-hover text-left"   style="margin-top:40px;display:none">
                <thead>
                <tr>
                    <th class="col-md-4">Filename</th>
                    <th class="col-md-2">Size</th>
                    <th class="col-md-6">Detail</th>
                </tr>
                </thead>
                <tbody id="fsUploadProgress">
                </tbody>
            </table>
        </div>
    </div>
    <script type="text/javascript" src="js/plupload/plupload.full.min.js"></script>
    <script type="text/javascript" src="js/plupload/i18n/zh_CN.js"></script>
    <script type="text/javascript" src="js/qiniu.js"></script>
     </body>
<script>
    //引入Plupload 、qiniu.js后

    varuploader = Qiniu.uploader({
        runtimes:'html5,flash,html4',//上传模式,依次退化

        browse_button:'pickfiles',//上传选择的点选按钮，**必需**

        uptoken_url:'/token',//Ajax请求upToken的Url，**强烈建议设置**（服务端提供）// uptoken : '', //若未指定uptoken_url,则必须指定 uptoken ,uptoken由其他程序生成// unique_names: true, // 默认 false，key为文件名。若开启该选项，SDK为自动生成上传成功后的key（文件名）。// save_key: true, // 默认 false。若在服务端生成uptoken的上传策略中指定了 `sava_key`，则开启，SDK会忽略对key的处理

        domain: 'http://qiniu-plupload.qiniudn.com/', //bucket 域名，下载资源时用到，**必需**

        get_new_uptoken: false, //设置上传文件的时候是否每次都重新获取新的token

        container: 'container', //上传区域DOM ID，默认是browser_button的父元素，

        max_file_size: '1000mb', //最大文件体积限制

        flash_swf_url: 'js/plupload/Moxie.swf', //引入flash,相对路径

        max_retries: 3, //上传失败最大重试次数

        dragdrop: true, //开启可拖曳上传

        multi_selection: false,// 设置一次只能选择一个文件

        drop_element: 'container', //拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传

        chunk_size: '4mb', //分块上传时，每片的体积

        auto_start: true, //选择文件后自动上传，若关闭需要自己绑定事件触发上传

        init: {
            'FilesAdded': function(up, files) {
                $('table').show();
                $('#success').hide();
                plupload.each(files, function(file) {
                    var progress = new FileProgress(file, 'fsUploadProgress');
                    progress.setStatus("等待...");
                });
            },
            'BeforeUpload': function(up, file) {
                var progress = new FileProgress(file, 'fsUploadProgress');
                var chunk_size = plupload.parseSize(this.getOption('chunk_size'));
                if (up.runtime === 'html5' && chunk_size) {
                    progress.setChunkProgess(chunk_size);
                }
            },
            'UploadProgress': function(up, file) {

                $("#percent").css("width",file.percent + "%")

            },

            'UploadComplete': function() {

                $("#percent").css("width",0 + '%');

            },

            'FileUploaded': function(up, file, info) {

                var domain = up.getOption('domain');

                var res = JSON.parse(info);

                var sourceLink ='http://'+domain + '/'+res.key;   //如果后台已经拼接了‘http’这里就不用拼接了

                var imageInfo = Qiniu.imageInfo(res.key);//获取图片原始大小

                //imageInfo.format  图片格式   imageInfo.width  图片宽   imageInfo.height 图片高

                console.log(imageInfo);   //  Object {format: "png", width: 580, height: 446, colorModel: "rgba"}

                self.albumDetailModel.tempShowPicUrl = sourceLink;

                self.albumDetailModel.filesize = self.switchByteToM(file.size);

                self.scope.$apply();

            },

            'Error': function(up, err, errTip) {

                alert(errTip);

            }

        },

//        filters : {
//
//            max_file_size : '100mb',
//
//            prevent_duplicates: true,  // 是否允许选取重复的文件,为true时表示不允许,为false时表示允许,默认为false
//
//            // Specify what files to browse for
//
//            mime_types: [
//
//                {title : "Image files", extensions : "jpg,png,jpeg,bmp"} // 限定jpg,jpeg,png等后缀上传
//
//            ]
//
//        },



//限制上传视频格式

        filters : {

            max_file_size : '100mb',

            prevent_duplicates: true,

            mime_types: [      {title : "flv files", extensions : "flv"}, //限定flv后缀上传格式上传

                {title : "Video files", extensions : "flv,mpg,mpeg,avi,wmv,mov,asf,rm,rmvb,mkv,m4v,mp4"}, //限定flv,mpg,mpeg,avi,wmv,mov,asf,rm,rmvb,mkv,m4v,mp4后缀格式上传

                {title : "Image files", extensions : "jpg,gif,png"}, //限定jpg,gif,png后缀上传

                {title : "Zip files", extensions : "zip"} //限定zip后缀上传

            ]

        }
    });

    // domain 为七牛空间（bucket)对应的域名，选择某个空间后，可通过"空间设置->基本设置->域名设置"查看获取

    // uploader 为一个plupload对象，继承了所有plupload的方法，参考http://plupload.com/docs
</script>
</html>