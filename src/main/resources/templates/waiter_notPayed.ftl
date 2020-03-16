<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="/css/weui.css"/>
    <link rel="stylesheet" href="/css/weuix.css"/>

    <script src="/js/zepto.min.js"></script>
    <script>
        function checkPay(){
            var id = document.getElementById("id").value
            var price = document.getElementById("price").value
            if (id===""){
                alert("商品ID丢失，请重开页面")
                return false;
            }else if (price===""){
                alert("未定价商品，请输入价格后提交，谢谢")
                return false;
            }else{
                return true;
            }
        }

    </script>
</head>

<body ontouchstart>
<div class="page-hd">
    <h1 class="page-hd-title">
        预约订单
    </h1>
    <p class="page-hd-desc"></p>
</div>

<div class="page-bd">

    <form action="/waiter/pay" method="post" onsubmit="return checkPay()">
    <div class="weui-form-preview">
        <div class="weui-form-preview__hd">
            <label class="weui-form-preview__label">价格</label>
            <em class="weui-form-preview__value">¥
                <#if task.price==-1>
                    <input class="weui-form-input" type="text" placeholder="请输入实际价格" name="price" id="price">
                <#else>
                    ${task.price}
                    <input type="hidden" value="${task.price}" name="price" id="price">
                </#if></em>
        </div>
        <div class="weui-form-preview__bd">
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">提交时间</label>
                <span class="weui-form-preview__value">${task.submit_time}</span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">套餐名称</label>
                <span class="weui-form-preview__value">${task.type_name}</span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">服务描述</label>
                <span class="weui-form-preview__value">${task.describe}</span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">姓名</label>
                <span class="weui-form-preview__value">${task.name}</span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">地址</label>
                <span class="weui-form-preview__value">${task.address}</span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">联系电话</label>
                <span class="weui-form-preview__value">${task.contact}</span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">预约时间</label>
                <span class="weui-form-preview__value">${task.reverse_time}</span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">状态</label>
                <span class="weui-form-preview__value b-red">${task.state}</span>
            </div>
        </div>

        <div class="weui-cells__title weui-start"> 优惠码:</div>
        <div class="weui-form-li">
            <input class="weui-form-input" name="promo" id="promo"/>
        </div>
            <input type="hidden" value="${task.tid}" name="id" value="id">
        <div class="weui-form-preview__ft">

            <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_warning" >支付</button>

        </div>

    </div>
    </form>
    <br>

</div>

<br>
<br>
<div class="weui-footer weui-footer_fixed-bottom">
    <p class="weui-footer__text">Copyright &copy; 华创家政服务</p>
</div>
</body>
</html>