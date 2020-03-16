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
    <h1 class="weui-payselect-title">请在下方输入您的充值卡密码来充值</h1>
    <p class="weui-payselect-info">充值余额没有使用限制</p>

    <form action="/pay/cardDeposit" method="post">

    <div class="weui-cell">
        <div class="weui-cell__hd">
            <label class="weui-label">卡密</label>
        </div>
        <div class="weui-cell__bd">
            <input class="weui-input" placeholder="请在此输入充值卡密码" type="text" name="card" id="card">
        </div>


    </div>
    <div class="weui-btn-area">
        <button type="submit" class="weui-btn weui-btn_primary" id="btn">充值</button>
    </div>

    </form>


    <p class="weui-payselect-info">${users.name},&nbsp;您的当前余额为:&nbsp;${users.money}</p>

</div>
<br>
<br>
<div class="weui-footer weui-footer_fixed-bottom">
    <p class="weui-footer__text">Copyright &copy; 华创家政服务</p>
</div>
</body>
</html>