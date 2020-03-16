<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>FTP全自动代下载</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="/css/weui.css"/>
    <link rel="stylesheet" href="/css/weuix.css"/>

    <script src="/js/zepto.min.js"></script>
    <script src="/js/zepto.weui.js"></script>
    </head>
<body>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(function() {
        $("#checkDownload").click(() => {
            let username = $.trim($("#username").val())
            $.ajax({
                url: "/check",
                type: 'post',
                dataType: 'json',
                data: {"username": username},
                success: function (data) {
                    document.getElementById("result").innerText = data.result;
                }
            })
        })
    })
</script>
<div class="page-hd">
    <h2 class="page-hd-title">
        请输入老师FTP信息
    </h2>
    <p class="page-hd-desc"></p>
</div>
<form method="post" action="/downloader/start">
<div class="weui-cells__title">请填写信息</div>

<div class="weui-cells weui-cells_form">

    <div class="weui-cell">
        <div class="weui-cell__hd">
            <label class="weui-label">FTP用户名</label>
        </div>
        <div class="weui-cell__bd">
            <input class="weui-input" placeholder="请输入FTP用户名" type="text" name="username" id="username">
        </div>

    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd">
            <label class="weui-label">FTP密码</label>
        </div>
        <div class="weui-cell__bd">
            <input class="weui-input" placeholder="请输入FTP密码" type="text" name="password" id="password">
        </div>

    </div>

</div>


<div class="weui-cells__tips">请认真填写，错误将会无法正常下载</div>

<!--<label for="weuiAgree" class="weui-agree">-->
<!--    <input id="weuiAgree" class="weui-agree__checkbox" type="checkbox">-->
<!--    <span class="weui-agree__text">-->
<!--                阅读并同意<a href="javascript:void(0);">《相关条款》</a>-->
<!--            </span>-->
<!--</label>-->


<div class="weui-btn-area">
    <button type="submit" class="weui-btn weui-btn_primary" id="submitBtn">确定</button>
</div>

    <div class="weui-btn-area">
        <button type="button" class="weui-btn weui-btn_primary" id="checkDownload" >查询下载进度</button>
    </div>
    <div class="weui-cells__tips"><font color="red"><span id="result"></span></font></div>

</form>
<br>
<br>

<div class="weui-footer weui-footer_fixed-bottom">
    <p class="weui-footer__text">Copyright &copy; 科大妙妙屋</p>
</div>
</body>
</html>