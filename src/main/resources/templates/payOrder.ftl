<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>华创家政服务-支付</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="../css/weui.css"/>
    <link rel="stylesheet" href="../css/weuix.css"/>

    <script src="../js/zepto.min.js"></script>
    <script>

    </script>
</head>

<body ontouchstart class="page-bg">


<div class="weui-pay">
    <h1 class="weui-payselect-title">请选择支付方式</h1>
    <a class="weui-btn weui-btn_primary" href="/waiter/payQrcode?id=${id}&price=${price}&promo=${promo}">客户扫码微信支付</a>
    <a class="weui-btn weui-btn_primary" href="/waiter/payBalance?id=${id}&price=${price}&promo=${promo}">客户余额支付</a>


</div>
<br>
<br>
<div class="weui-footer weui-footer_fixed-bottom">
    <p class="weui-footer__text">Copyright &copy; 华创家政服务</p>
</div>
</body>
</html>