
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>华创家政服务-预存</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="/css/weui.css"/>
    <link rel="stylesheet" href="/css/weuix.css"/>

    <script src="/js/zepto.min.js"></script>
    <script src="/js/zepto.weui.js"></script>
    <script src="/js/clipboard.min.js"></script>

</head>

<body ontouchstart>
<div class="page-hd">
    <h1 class="page-hd-title">
        正在发起支付，请稍等……
    </h1>
    <p class="page-hd-desc"></p>
</div>



<script type="text/javascript">
    var appId,timeStamp,nonceStr,package,signType,paySign;
        $(function() {
                $.ajax({
                    url: "/pay/wxjsapi",
                    data: {"id":${type.id}},
                    dataType: "json",
                    success: function (result) {
                        appId = result.appId;
                        timeStamp = result.timeStamp;
                        nonceStr = result.nonceStr;
                        package = result.package;
                        signType = result.signType;
                        paySign = result.paySign;
                        if (typeof WeixinJSBridge == "undefined") {
                            if (document.addEventListener) {
                                document.addEventListener('WeixinJSBridgeReady',
                                    onBridgeReady, false);
                            } else if (document.attachEvent) {
                                document.attachEvent('WeixinJSBridgeReady',
                                    onBridgeReady);
                                document.attachEvent('onWeixinJSBridgeReady',
                                    onBridgeReady);
                            }
                        } else {
                            onBridgeReady();
                        }
                    }
                });
        })
    function onBridgeReady(){
        WeixinJSBridge.invoke( 'getBrandWCPayRequest', {
                "appId":appId,     //公众号名称,由商户传入
                "timeStamp":timeStamp,         //时间戳,自1970年以来的秒数
                "nonceStr":nonceStr, //随机串
                "package":package,
                "signType":signType,         //微信签名方式：
                "paySign":paySign //微信签名
            },
            function(res){
                if(res.err_msg == "get_brand_wcpay_request:ok" ) {
                    alert('支付成功');
                    WeixinJSBridge.call('closeWindow');
                    //支付成功后跳转的页面
                }else if(res.err_msg == "get_brand_wcpay_request:cancel"){
                    alert('支付取消');
                    WeixinJSBridge.call('closeWindow');
                }else if(res.err_msg == "get_brand_wcpay_request:fail"){
                    alert('支付失败');
                    WeixinJSBridge.call('closeWindow');
                } //使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok,但并不保证它绝对可靠。
            });
    }
</script>

<br>
<br>
<div class="weui-footer weui-footer_fixed-bottom">

    <p class="weui-footer__text">Copyright &copy; 华创家政服务</p>
</div>
</body>
</html>
<#--<!DOCTYPE html>-->
<#--<html lang="en">-->
<#--<head>-->
<#--    <meta charset="UTF-8">-->
<#--    <title>Title</title>-->
<#--    <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>-->
<#--</head>-->
<#--<body>-->


<#--<script type="text/javascript">-->
<#--    var appId,timeStamp,nonceStr,package,signType,paySign;-->
<#--        $(function() {-->
<#--                alert(1)-->
<#--                $.ajax({-->
<#--                    url: "/pay/wxjsapi",-->
<#--                    data: {"id":${type.id}},-->
<#--                    dataType: "json",-->
<#--                    success: function (result) {-->
<#--                        appId = result.appId;-->
<#--                        timeStamp = result.timeStamp;-->
<#--                        nonceStr = result.nonceStr;-->
<#--                        package = result.package;-->
<#--                        signType = result.signType;-->
<#--                        paySign = result.paySign;-->
<#--                        if (typeof WeixinJSBridge == "undefined") {-->
<#--                            if (document.addEventListener) {-->
<#--                                document.addEventListener('WeixinJSBridgeReady',-->
<#--                                    onBridgeReady, false);-->
<#--                            } else if (document.attachEvent) {-->
<#--                                document.attachEvent('WeixinJSBridgeReady',-->
<#--                                    onBridgeReady);-->
<#--                                document.attachEvent('onWeixinJSBridgeReady',-->
<#--                                    onBridgeReady);-->
<#--                            }-->
<#--                        } else {-->
<#--                            onBridgeReady();-->
<#--                        }-->
<#--                    }-->
<#--                });-->
<#--        })-->
<#--    function onBridgeReady(){-->
<#--        WeixinJSBridge.invoke( 'getBrandWCPayRequest', {-->
<#--                "appId":appId,     //公众号名称,由商户传入-->
<#--                "timeStamp":timeStamp,         //时间戳,自1970年以来的秒数-->
<#--                "nonceStr":nonceStr, //随机串-->
<#--                "package":package,-->
<#--                "signType":signType,         //微信签名方式：-->
<#--                "paySign":paySign //微信签名-->
<#--            },-->
<#--            function(res){-->
<#--                if(res.err_msg == "get_brand_wcpay_request:ok" ) {-->
<#--                    alert('支付成功');-->
<#--                    //支付成功后跳转的页面-->
<#--                }else if(res.err_msg == "get_brand_wcpay_request:cancel"){-->
<#--                    alert('支付取消');-->
<#--                    WeixinJSBridge.call('closeWindow');-->
<#--                }else if(res.err_msg == "get_brand_wcpay_request:fail"){-->
<#--                    alert('支付失败');-->
<#--                    WeixinJSBridge.call('closeWindow');-->
<#--                } //使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok,但并不保证它绝对可靠。-->
<#--            });-->
<#--    }-->
<#--</script>-->

<#--</body>-->
<#--</html>-->