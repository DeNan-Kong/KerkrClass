/*global Qiniu */
/*global plupload */
/*global FileProgress */
/*global hljs */

$(function () {
    var uploader = Qiniu.uploader({
        disable_statistics_report: true,
        makeLogFunc: 1,
        runtimes: 'html5,flash,html4', //上传模式,依次退化
        browse_button: 'pickfiles',//上传选择的点选按钮，**必需**
        container: 'container',//上传区域DOM ID，默认是browser_button的父元素，
        drop_element: 'container', //最大文件体积限制
        max_file_size: '1000mb',//最大文件体积限制
        //flash_swf_url: '/js/plupload/Moxie.swf',
        dragdrop: true,//开启可拖曳上传
        chunk_size: '8mb', //分块上传时，每片的体积
        multi_selection: false,// 设置一次只能选择一个文件
        max_retries: 6,// 上传失败最大重试次数
        uptoken_url: 'getTokenVideos.jspx',//设置请求qiniu-token的url
        //Ajax请求upToken的Url，**强烈建议设置**（服务端提供）  /
        /*uptoken_func: function(){
            var ajax = new XMLHttpRequest();
            ajax.open('GET', $('#uptoken_url').val(), false);
            ajax.setRequestHeader("If-Modified-Since", "0");
            ajax.send();
            if (ajax.status === 200) {
                var res = JSON.parse(ajax.responseText);
                console.log('custom uptoken_func:' + res.uptoken);
                return res.uptoken;
            } else {
                console.log('custom uptoken_func err');
                return '';
            }
        },*/
        //domain: "http://ovhr8lih9.bkt.clouddn.com/",
        domain: $("#domain").val() ,//bucket 域名，下载资源时用到，**必需**
        get_new_uptoken: true, //设置上传文件的时候是否每次都重新获取新的token
        // downtoken_url: '/downtoken',// Ajax请求downToken的Url，私有空间时使用，JS-SDK将向该地址POST文件的key和domain，服务端返回的JSON必须包含url字段，url值为该文件的下载地址
        unique_names: false,              // 默认false，key为文件名。若开启该选项，JS-SDK会为每个文件自动生成key（文件名）
        save_key: false,                  // 默认false。若在服务端生成uptoken的上传策略中指定了sava_key，则开启，SDK在前端将不对key进行任何处理

        auto_start: false,//选择文件后自动上传，若关闭需要自己绑定事件触发上传
        log_level: 5,
        filters : {
            prevent_duplicates: true,
            // Specify what files to browse for
            mime_types: [
                {title : "flv files", extensions : "flv"}, // 限定flv后缀上传格式上传
                {title : "Video files", extensions : "flv,mpg,mpeg,avi,wmv,asf,rm,rmvb,mkv,m4v,mp4"} // 限定flv,mpg,mpeg,avi,wmv,mov,asf,rm,rmvb,mkv,m4v,mp4后缀格式上传

                //{title : "Zip files", extensions : "zip"} // 限定zip后缀上传
            ]
        },
        init: {
            'BeforeChunkUpload': function (up, file) {
                console.log("before chunk upload:", file.name);
            },
            'FilesAdded': function (up, files) {
                $('table').show();
                $('#success').hide();
                plupload.each(files, function (file) {
                    console.log('filetype: ' + file.type);
                    isUpload = true;
                    // file.album_name=album_name;
                    var progress = new FileProgress(file, 'fsUploadProgress');
                    progress.setStatus("等待...");
                    progress.bindUploadCancel(up);
                });
            },
            'BeforeUpload': function (up, file) {
                console.log("this is a beforeupload function from init");
                var progress = new FileProgress(file, 'fsUploadProgress');
                var chunk_size = plupload.parseSize(this.getOption('chunk_size'));
                if (up.runtime === 'html5' && chunk_size) {
                    progress.setChunkProgess(chunk_size);
                }
            },
            'UploadProgress': function (up, file) {
                var progress = new FileProgress(file, 'fsUploadProgress');
                var chunk_size = plupload.parseSize(this.getOption('chunk_size'));
                progress.setProgress(file.percent + "%", file.speed, chunk_size);
            },
            'UploadComplete': function () {
                $('#success').show();
            },
            'FileUploaded': function (up, file, info) {
                var res = $.parseJSON(info.response);
                var checked = [];
                $(".watch-author").click(function(){
                    checked = [];
                    $('input[name="k-type"]:checked').each(function(){
                        checked.push($(this).val());
                    });
                    console.log(checked);
                });
                var data = {
                    "orgId":$('#orgId').val(),
                    "title": $('#title').val(),
                    "description": $('#description').val(),
                    "grade": $('#k-grade').val(),
                    "videoUrl": res.key,
                    "hash": res.hash,
                    "fsize": res.fsize,
                    "length": parseInt(res.length),
                    "checkboxValue": checked
                }
                $.ajax({
                    url:'uploadCallBackVideos.jspx',
                    type:'POST', //GET
                    async:false,    //或false,是否异步
                    data: data,
                    timeout:5000,    //超时时间
                    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                    success:function(data,textStatus,jqXHR){
                        if(data.result){
                            var progress = new FileProgress(file, 'fsUploadProgress');
                            progress.setComplete(up, info);
                            alert("上传成功！");
                        }else{
                            var progress = new FileProgress(file, 'fsUploadProgress');
                            progress.bindUploadCancel(up);
                            console.log(jqXHR.responseText);
                        }
                    }
                })

            },
            'Error': function (up, err, errTip) {
                $('table').show();
                var progress = new FileProgress(err.file, 'fsUploadProgress');
                progress.setError();
                progress.setStatus(errTip);
            }
            ,
            'Key': function(up, file) {
                var exname = file.name.toLowerCase().split('.').splice(-1);
                var key = createUniqueCode(exname);
                //key = Qiniu.getFileExtension(file.name);
                // do something with key
                return key
            }
        }
    });
    uploader.bind('FilesAdded', function () {
        console.log("hello man, a file added");
    });
    uploader.bind('BeforeUpload', function () {
        console.log("hello man, i am going to upload a file");
    });
    uploader.bind('FileUploaded', function () {
        console.log('hello man,a file is uploaded');
    });
    $('#up_load').on('click', function () {
        var title = $('#title').val();
        //var description = $('#description').val();
        if(title == null || title == ""){
            alert("请输入标题！");
        }else {
            uploader.start();
        }
    });
    $('#stop_load').on('click', function () {
        uploader.stop();
    });
    $('#retry').on('click', function () {
        uploader.stop();
        uploader.start();
    });
    $('#container').on(
        'dragenter',
        function (e) {
            e.preventDefault();
            $('#container').addClass('draging');
            e.stopPropagation();
        }
    ).on('drop', function (e) {
        e.preventDefault();
        $('#container').removeClass('draging');
        e.stopPropagation();
    }).on('dragleave', function (e) {
        e.preventDefault();
        $('#container').removeClass('draging');
        e.stopPropagation();
    }).on('dragover', function (e) {
        e.preventDefault();
        $('#container').addClass('draging');
        e.stopPropagation();
    });

    $('#show_code').on('click', function () {
        $('#myModal-code').modal();
        $('pre code').each(function (i, e) {
            hljs.highlightBlock(e);
        });
    });


    $('body').on('click', 'table button.btn', function () {
        $(this).parents('tr').next().toggle();
    });


    var getRotate = function (url) {
        if (!url) {
            return 0;
        }
        var arr = url.split('/');
        for (var i = 0, len = arr.length; i < len; i++) {
            if (arr[i] === 'rotate') {
                return parseInt(arr[i + 1], 10);
            }
        }
        return 0;
    };

    $('#myModal-img .modal-body-footer').find('a').on('click', function () {
        var img = $('#myModal-img').find('.modal-body img');
        var key = img.data('key');
        var oldUrl = img.attr('src');
        var originHeight = parseInt(img.data('h'), 10);
        var fopArr = [];
        var rotate = getRotate(oldUrl);
        if (!$(this).hasClass('no-disable-click')) {
            $(this).addClass('disabled').siblings().removeClass('disabled');
            if ($(this).data('imagemogr') !== 'no-rotate') {
                fopArr.push({
                    'fop': 'imageMogr2',
                    'auto-orient': true,
                    'strip': true,
                    'rotate': rotate,
                    'format': 'png'
                });
            }
        } else {
            $(this).siblings().removeClass('disabled');
            var imageMogr = $(this).data('imagemogr');
            if (imageMogr === 'left') {
                rotate = rotate - 90 < 0 ? rotate + 270 : rotate - 90;
            } else if (imageMogr === 'right') {
                rotate = rotate + 90 > 360 ? rotate - 270 : rotate + 90;
            }
            fopArr.push({
                'fop': 'imageMogr2',
                'auto-orient': true,
                'strip': true,
                'rotate': rotate,
                'format': 'png'
            });
        }

        $('#myModal-img .modal-body-footer').find('a.disabled').each(function () {

            var watermark = $(this).data('watermark');
            var imageView = $(this).data('imageview');
            var imageMogr = $(this).data('imagemogr');

            /*if (watermark) {//水印
                fopArr.push({
                    fop: 'watermark',
                    mode: 1,
                    image: 'http://www.b1.qiniudn.com/images/logo-2.png',
                    dissolve: 100,
                    gravity: watermark,
                    dx: 100,
                    dy: 100
                });
            }*/

            if (imageView) {
                var height;
                switch (imageView) {
                    case 'large':
                        height = originHeight;
                        break;
                    case 'middle':
                        height = originHeight * 0.5;
                        break;
                    case 'small':
                        height = originHeight * 0.1;
                        break;
                    default:
                        height = originHeight;
                        break;
                }
                fopArr.push({
                    fop: 'imageView2',
                    mode: 3,
                    h: parseInt(height, 10),
                    q: 100,
                    format: 'png'
                });
            }

            if (imageMogr === 'no-rotate') {
                fopArr.push({
                    'fop': 'imageMogr2',
                    'auto-orient': true,
                    'strip': true,
                    'rotate': 0,
                    'format': 'png'
                });
            }
        });

        var newUrl = Qiniu.pipeline(fopArr, key);

        var newImg = new Image();
        img.attr('src', 'images/loading.gif');
        newImg.onload = function () {
            img.attr('src', newUrl);
            img.parent('a').attr('href', newUrl);
        };
        newImg.src = newUrl;
        return false;
    });

});

function createUniqueCode(ex_name){
    var dataStr = new Date().format("yyMMddhhmmss").toString();
    return dataStr + this.generateMixed(4)+ "." +ex_name;
}

//指定位数随机码
function generateMixed(n) {
    var jschars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    var res = "";
    for(var i = 0; i < n ; i ++) {
        var id = Math.ceil(Math.random()*35);
        res += jschars[id];
    }
    return res;
}