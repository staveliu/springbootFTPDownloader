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
        function submitReturn(id){
            var sure = confirm("确认回退吗？")
            if (sure){
                $(function(){
                    $.ajax({
                        url: "/waiter/submitReturn",
                        data: {"id":id},
                        dataType: "json",
                        success: function (data) {
                            if (data.state!==200){
                                alert(data.msg)
                            }else{
                                alert("回退成功！")
                                location.href="/waiter/viewReverse?id=" + id
                            }
                        }
                    })
                });
            }else{

            }

        }
        function submitFinish(id){
            var sure = confirm("确认任务已经完成？")
            if (sure){
                $(function(){
                    $.ajax({
                        url: "/waiter/submitFinish",
                        data: {"id":id},
                        dataType: "json",
                        success: function (data) {
                            if (data.state!==200){
                                alert(data.msg)
                            }else{
                                alert("标记完成成功，请尽快完成支付！")
                                location.href="/waiter/viewReverse?id=" + id
                            }
                        }
                    })
                });
            }else{

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

    <div class="weui-form-preview">
        <div class="weui-form-preview__hd">
            <label class="weui-form-preview__label">价格</label>
            <em class="weui-form-preview__value">¥<#if task.price==-1>价格尚未设置<#else>${task.price}</#if></em>
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


        <div class="weui-form-preview__ft">

            <button type="button" class="weui-form-preview__btn weui-form-preview__btn_warning" onclick="submitFinish(${task.tid})">完成订单</button>
            <button type="button" class="weui-form-preview__btn weui-form-preview__btn_warning" onclick="submitReturn(${task.tid})">回退订单</button>

        </div>
    </div>
    <br>

</div>

<br>
<br>
<div class="weui-footer weui-footer_fixed-bottom">
    <p class="weui-footer__text">Copyright &copy; 华创家政服务</p>
</div>
</body>
</html>