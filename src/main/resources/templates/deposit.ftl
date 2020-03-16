<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>华创家政服务-预存</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="../css/weui.css"/>
    <link rel="stylesheet" href="../css/weuix.css"/>

    <script src="../js/zepto.min.js"></script>
    <script>

    </script>
</head>

<body ontouchstart class="page-bg">


<div class="weui-pay">
    <h1 class="weui-payselect-title">选择金额付款</h1>
    <p class="weui-payselect-info">充值余额没有使用限制</p>
        <#list types as type>
            <a class="weui-btn weui-btn_primary" href="/pay/deposit?id=${type.id}">${type.name}</a>
        </#list>
    <p class="weui-payselect-info">${users.name},&nbsp;您的当前余额为:&nbsp;${users.money}</p>

</div>
<br>
<br>
<div class="weui-footer weui-footer_fixed-bottom">
    <p class="weui-footer__text">Copyright &copy; 华创家政服务</p>
</div>
</body>
</html>