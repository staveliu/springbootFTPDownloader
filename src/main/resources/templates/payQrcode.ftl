<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="/css/weui.css"/>
    <link rel="stylesheet" href="/css/weuix.css"/>

    <script src="/js/zepto.min.js"></script>
    <script src="/js/zepto.weui.js"></script>
    <script src="/js/clipboard.min.js"></script>



</head>

<body ontouchstart>

<script>

        $(function () {
            $.ajax({
                url: "http://qrapi.market.alicloudapi.com/yunapi/qrencode.html",
                dataType: "json",
                type: 'POST',
                headers: {
                    Authorization: "APPCODE 4ca189e3ab2f42bf96ecdc52b95b0a6f"
                },
                data: {'qrdata': '${qrcodeurl}', 'size': 300},
                success: function (data) {
                    document.getElementById("qrcodesrc").src = data.data.qr_filepath
                }
            })
        })

        function sendRequest() {
            $(function(){
                $.ajax({
                    type:"GET",
                    url:"/pay/qrPayVerify",
                    data:{"id":${taskId}},
                    dataType: "json",
                    async: false,//发送同步请求
                    success: function (data) {
                        if (data.status){
                            clearInterval()
                            alert("订单已完成支付！页面可关闭")
                            WeixinJSBridge.call('closeWindow');
                        }
                    }
                })
            })
        }
        setInterval(sendRequest,1500);

</script>
<div class="page-hd">
    <h1 class="page-hd-title">
        原价:${price}
    </h1>
    <h1 class="page-hd-title">
        现价:${truePrice}
    </h1>
    <h2 class="page-hd-title">
        如果用户支付完成没有返回请返回再点击查看订单查看是否支付成功
    </h2>
    <a><img id="qrcodesrc" src="test"></a>
    <p class="page-hd-desc"></p>
</div>

<br>
<br>
<div class="weui-footer weui-footer_fixed-bottom">

    <p class="weui-footer__text">Copyright &copy; 华创家政服务</p>
</div>
</body>
</html>