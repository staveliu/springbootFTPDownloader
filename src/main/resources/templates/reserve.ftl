<#--<!doctype html>-->
<#--<html>-->
<#--<head>-->
<#--    <meta charset="utf-8">-->
<#--    <title></title>-->
<#--    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">-->
<#--    <link rel="stylesheet" href="/css/weui.css"/>-->
<#--    <link rel="stylesheet" href="/css/weuix.css"/>-->

<#--    <script src="/js/zepto.min.js"></script>-->
<#--    <script src="/js/zepto.weui.js"></script>-->
<#--    <script src="/js/clipboard.min.js"></script>-->
<#--    <script src="/js/php.js"></script>-->
<#--    <script src="/js/picker.city.js"></script>-->
<#--</head>-->

<#--<body ontouchstart>-->
<#--<script>-->

<#--    $("#birthday").datetimePicker({-->
<#--        title: '生日',-->
<#--        years:range(1940,2030),-->
<#--        times:function(){return [];},-->
<#--        parse:function(str){-->
<#--            return str.split("-");-->
<#--        },-->
<#--        onChange: function (picker, values, displayValues) {-->
<#--            console.log(values);-->
<#--        }-->
<#--    });-->

<#--    $("#time").datetimePicker({-->
<#--        title: '出发时间',-->
<#--        min: "1990-12-12",-->
<#--        max: "2022-12-12 12:12",-->
<#--        onChange: function (picker, values, displayValues) {-->
<#--            console.log(values);-->
<#--        }-->
<#--    });-->
<#--    $("#time2").datetimePicker({-->
<#--        times: function () {-->
<#--            return [-->
<#--                {-->
<#--                    values: (function () {-->
<#--                        var hours = [];-->
<#--                        for (var i=0; i<24; i++) hours.push(i > 9 ? i : '0'+i);-->
<#--                        return hours;-->
<#--                    })()-->
<#--                },-->
<#--                {-->
<#--                    divider: true,  // 这是一个分隔符-->
<#--                    content: '时'-->
<#--                }-->
<#--            ];-->
<#--        },-->
<#--        onChange: function (picker, values, displayValues) {-->
<#--            console.log(values);-->
<#--        },-->
<#--    });-->
<#--    $("#time3").datetimePicker({-->
<#--        times: function () {-->
<#--            return [-->
<#--                {-->
<#--                    values: ['上午', '下午']-->
<#--                }-->
<#--            ];-->
<#--        },-->
<#--        value: '2012-12-12 上午',-->
<#--        onChange: function (picker, values, displayValues) {-->
<#--            console.log(values);-->
<#--        }-->
<#--    });-->
<#--    $("#time4").datetimePicker({-->
<#--        times: function () {-->
<#--            return [-->
<#--                {-->
<#--                    values: ['上午8点', '下午2点', '晚上8点']-->
<#--                }-->
<#--            ];-->
<#--        },-->
<#--        max: '2013-12-12',-->
<#--        onChange: function (picker, values, displayValues) {-->
<#--            console.log(values);-->
<#--        }-->
<#--    });-->

<#--    $("#time-format").datetimePicker({-->
<#--        title: '自定义格式',-->
<#--        yearSplit: '年',-->
<#--        monthSplit: '月',-->
<#--        dateSplit: '日',-->
<#--        times: function () {-->
<#--            return [  // 自定义的时间-->
<#--                {-->
<#--                    values: (function () {-->
<#--                        var hours = [];-->
<#--                        for (var i=0; i<24; i++) hours.push(i > 9 ? i : '0'+i);-->
<#--                        return hours;-->
<#--                    })()-->
<#--                },-->
<#--                {-->
<#--                    divider: true,  // 这是一个分隔符-->
<#--                    content: '时'-->
<#--                },-->
<#--                {-->
<#--                    values: (function () {-->
<#--                        var minutes = [];-->
<#--                        for (var i=0; i<60; i++) minutes.push(i > 9 ? i : '0'+i);-->
<#--                        return minutes;-->
<#--                    })()-->
<#--                },-->
<#--                {-->
<#--                    divider: true,  // 这是一个分隔符-->
<#--                    content: '分'-->
<#--                }-->
<#--            ];-->
<#--        },-->
<#--        onChange: function (picker, values, displayValues) {-->
<#--            console.log(values);-->
<#--        }-->
<#--    });-->
<#--    $("#time-inline").datetimePicker({-->
<#--        container: '#time-container',-->
<#--        onChange: function (picker, values, displayValues) {-->
<#--            console.log(values);-->
<#--        }-->
<#--    })-->
<#--    $("#years-monthes").datetimePicker({-->
<#--        title: '限定年月',-->
<#--        years: [2017, 2018],-->
<#--        monthes: ['06', '07'],-->
<#--        onChange: function (picker, values, displayValues) {-->
<#--            console.log(values);-->
<#--        }-->
<#--    });-->
<#--</script>-->
<#--<div class="page-hd">-->
<#--    <h1 class="page-hd-title">-->
<#--        在线预约服务-->
<#--    </h1>-->
<#--    <p class="page-hd-desc"></p>-->
<#--</div>-->
<#--<form action="/home/reserveResult" method="post">-->
<#--<div class="weui-cells__title weui-start">1. 填写姓名</div>-->
<#--<div class="weui-form">-->
<#--    <div class="weui-form-li">-->
<#--        <input type="text" class="weui-form-input" name="name" id="name">-->
<#--    </div>-->
<#--</div>-->
<#--<div class="weui-cells__title weui-start">1. 联系电话</div>-->
<#--<div class="weui-form">-->
<#--    <div class="weui-form-li">-->
<#--        <input type="text" class="weui-form-input" name="contact" id="contact">-->
<#--    </div>-->
<#--</div>-->

<#--<div class="weui-cells__title weui-start">1. 区域（区）</div>-->
<#--<div class="weui-form">-->
<#--    <div class="weui-form-li">-->
<#--        <select class="weui-select" name="addr_region" id="addr_region">-->
<#--            <option value="None">请选择区域</option>-->
<#--            <option value="岳麓区">岳麓区</option>-->
<#--            <option value="天心区">天心区</option>-->
<#--            <option value="芙蓉区">芙蓉区</option>-->
<#--            <option value="开福区">开福区</option>-->
<#--            <option value="雨花区">雨花区</option>-->
<#--            <option value="望城区">望城区</option>-->
<#--            <option value="长沙县">长沙县</option>-->
<#--            <option value="株洲市">株洲市</option>-->
<#--            <option value="湘潭市">湘潭市</option>-->
<#--            <option value="宁乡市">宁乡市</option>-->
<#--        </select>-->
<#--    </div>-->
<#--</div>-->

<#--<div class="weui-cells__title weui-start">1. 地区（具体地址）</div>-->
<#--<div class="weui-form">-->
<#--    <div class="weui-form-li">-->
<#--        <input type="text" class="weui-form-input" name="addr_spec" id="addr_spec">-->
<#--    </div>-->
<#--</div>-->

<#--<div class="weui-cells__title weui-start">1. 大概上门时间（我们的服务人员会具体与您沟通时间）</div>-->
<#--    <div class="weui-cell__bd">-->
<#--        <input class="weui-input" id="time4" name="time" type="text" value="2012-12-12 上午8点" readonly="">-->
<#--    </div>-->
<#--    <div class="weui-btn-area">-->
<#--        <button type="submit" class="weui-btn weui-btn_primary" >提交</button>-->
<#--    </div>-->
<#--</form>-->
<#--    <br>-->
<#--<br>-->
<#--<div class="weui-footer weui-footer_fixed-bottom">-->

<#--    <p class="weui-footer__text">Copyright &copy; 华创家政服务</p>-->
<#--</div>-->

<#--</body>-->
<#--</html>-->

<html class="pixel-ratio-1"><head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="/css/weui.css">
    <link rel="stylesheet" href="/css/weuix.css">

    <script src="/js/zepto.min.js"></script>
    <script src="/js/zepto.weui.js"></script>
    <script src="/js/php.js"></script>
</head>

<body ontouchstart="">

<script>
    function submitmethod() {
        var name = document.getElementById("name").value
        var contact = document.getElementById("contact").value
        var address = document.getElementById("address").value
        if (contact === "") {
            alert("手机号不能为空")
            return false
        } else if (name === "") {
            alert("姓名不能为空")
            return false
        } else if (address === "") {
            alert("地址不能为空")
            return false
        } else{
            return true
        }

    }
</script>
<div class="container">
    <div class="page-hd">
        <h1 class="page-hd-title">
            在线预约服务
        </h1>
    </div>
    <div class="page-bd-15">

        <p class="page-hd" id="describe_name">${type.name}，服务价格: <#if type.price==-1>项目需要根据实际情况计费<#else>${type.price}</#if>元</p>
        <p class="page-hd" id="describe_content">${type.describe}</p>




        <!--地址需要单独js城市数据-->
        <form name="form1" action="/home/reserveResult" method="post" onsubmit="return submitmethod()">
        <div class="weui-cells weui-cells_form">

            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="name" class="weui-label">姓名</label></div>
                <div class="weui-form-li">
                    <input type="text" class="weui-form-input" name="name" id="name">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="contact" class="weui-label">联系方式</label></div>
                <div class="weui-form-li">
                    <input type="text" class="weui-form-input" name="contact" id="contact">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="time3" class="weui-label">上门时间</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" id="time3"  name="time" type="text" value="2011-11-11 上午" readonly="">
                </div>
            </div>


            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">区域</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" id="start" name="origin" type="text" value="湖南省 长沙市 岳麓区" readonly="" data-code="542521" data-codes="54,5425,542521">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="name" class="weui-label">具体地址</label></div>
                <div class="weui-form-li">
                    <input type="text" class="weui-form-input" name="address" id="address">
                </div>
            </div>

            <div class="weui-btn-area">
                <button type="submit" class="weui-btn weui-btn_primary">提交</button>
            </div>

        </div>
        </form>



        <script src="/js/picker.city.js"></script>

        <script>
            $("#start").cityPicker({
                title: "选择出发地",
                onChange: function (picker, values, displayValues) {
                    console.log(values, displayValues);
                }
            });
            $("#end").cityPicker({
                title: "选择目的地"
            });
            $("#home-city").cityPicker({
                title: "选择目的地",
                showDistrict: false,
                onChange: function (picker, values, displayValues) {
                    console.log(values, displayValues);
                }
            });
        </script>


    </div>


    <br>
    <br>
    <div class="weui-footer weui-footer_fixed-bottom">
        <p class="weui-footer__text">Copyright &copy; 华创家政服务</p>
    </div>
</div>

<script>


    $("#mobile").picker({
        title: "请选择您的电脑",
        cols: [
            {
                textAlign: 'center',
                values: ['苹果','三星','联想']
            }
        ],
        onChange: function(p, v, dv) {
            console.log(p, v, dv);
        },
        onClose: function(p, v, d) {
            console.log("close");
        }
    });


    $("#inline").picker({
        container: '#picker-container',
        cols: [
            {
                textAlign: 'center',
                values: ['苹果','橘子','香蕉','西红柿']
            }
        ],
        onChange: function(p, v, dv) {
            console.log(p, v, dv);
        },
        onClose: function(p, v, d) {
            console.log("close");
        }
    });
</script>

<script>



    $("#time3").datetimePicker({
        times: function () {
            return [
                {
                    values: ['上午', '下午']
                }
            ];
        },
        value: '2012-12-12 上午',
        onChange: function (picker, values, displayValues) {
            console.log(values);
        }
    });
    $("#time4").datetimePicker({
        times: function () {
            return [
                {
                    values: ['上午8点', '下午2点', '晚上8点']
                }
            ];
        },
        max: '2013-12-12',
        onChange: function (picker, values, displayValues) {
            console.log(values);
        }
    });

    $("#time-format").datetimePicker({
        title: '自定义格式',
        yearSplit: '年',
        monthSplit: '月',
        dateSplit: '日',
        times: function () {
            return [  // 自定义的时间
                {
                    values: (function () {
                        var hours = [];
                        for (var i=0; i<24; i++) hours.push(i > 9 ? i : '0'+i);
                        return hours;
                    })()
                },
                {
                    divider: true,  // 这是一个分隔符
                    content: '时'
                },
                {
                    values: (function () {
                        var minutes = [];
                        for (var i=0; i<60; i++) minutes.push(i > 9 ? i : '0'+i);
                        return minutes;
                    })()
                },
                {
                    divider: true,  // 这是一个分隔符
                    content: '分'
                }
            ];
        },
        onChange: function (picker, values, displayValues) {
            console.log(values);
        }
    });
    $("#time-inline").datetimePicker({
        container: '#time-container',
        onChange: function (picker, values, displayValues) {
            console.log(values);
        }
    })
    $("#years-monthes").datetimePicker({
        title: '限定年月',
        years: [2017, 2018],
        monthes: ['06', '07'],
        onChange: function (picker, values, displayValues) {
            console.log(values);
        }
    });
</script>

</body></html>