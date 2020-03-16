<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>华创家政服务-关联订单</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="/css/weui.css"/>
    <link rel="stylesheet" href="/css/weuix.css"/>

    <script src="/js/zepto.min.js"></script>
    <script>
        function submitAssign() {
            var others = document.getElementById("others").value;
            var dutyUid = document.getElementById("dutyUid").value;
            $(function () {
                $.ajax({
                    url: "/manage/submitAssign",
                    data: {"id":${task.tid},"others": others,"dutyUid":dutyUid},
                    dataType: "json",
                    success: function (data) {
                        if (data.state!==200){
                            alert(data.msg)
                        }else{
                            alert("分配完成！")
                            location.href="/manage/listNoAssignTasks"
                        }
                    }
                })
            })
        }

    </script>
</head>

<body ontouchstart>
<div class="page-hd">
    <h1 class="page-hd-title">
        关联订单给服务员（请先联系客户获得具体需求）
    </h1>
    <p class="page-hd-desc"></p>
</div>

<div class="page-bd">

    <div class="weui-form-preview">
        <div class="weui-form-preview__hd">
            <label class="weui-form-preview__label">价格</label>
            <em class="weui-form-preview__value">¥$ <#if task.price==-1>价格尚未设置<#else>${task.price}</#if></em>
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
                <span class="weui-form-preview__value b-red">${task.reverse_time}</span>
            </div>
        </div>
        <div class="weui-cells__title">选择负责服务人</div>
        <div class="weui-cells weui-cells_split">
            <div class="weui-cell weui_cell_select">
                <select class="weui-select" name="dutyUid" id="dutyUid">
                    <#list dutyUsers as dutyUser>
                        <option value="${dutyUser.uid}">${dutyUser.name}, ${dutyUser.mobile}</option>
                    </#list>
                </select>
            </div>
        </div>

        <div class="weui-cells__title weui-start"> 客户具体需求</div>
        <div class="weui-form-li">
            <textarea class="weui-form-area" name="others" id="others" rows="5" cols="60"></textarea>
        </div>
        <div class="weui-form-preview__ft">




            <div class="weui-btn-area">
                <button type="button" class="weui-btn weui-btn_primary" onclick="submitAssign()">提交</button>
            </div>
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