<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>华创家政服务</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="/css/weui.css"/>
    <link rel="stylesheet" href="/css/weuix.css"/>

    <script src="/js/swipe.js"></script>
    <script src="/js/zepto.min.js"></script>
    <script src="/js/zepto.weui.js"></script>
    <script src="/js/clipboard.min.js"></script>
    <script>
        $(function(){
            $('#slide1').swipeSlide({
                autoSwipe:true,//自动切换默认是
                speed:3000,//速度默认4000
                continuousScroll:true,//默认否
                transitionType:'cubic-bezier(0.22, 0.69, 0.72, 0.88)',//过渡动画linear/ease/ease-in/ease-out/ease-in-out/cubic-bezier
                lazyLoad:true,//懒加载默认否
                firstCallback : function(i,sum,me){
                    me.find('.dot').children().first().addClass('cur');
                },
                callback : function(i,sum,me){
                    me.find('.dot').children().eq(i).addClass('cur').siblings().removeClass('cur');
                }
            });

            $('#slide2').swipeSlide({
                autoSwipe:true,//自动切换默认是
                speed:3000,//速度默认4000
                continuousScroll:true,//默认否
                transitionType:'cubic-bezier(0.22, 0.69, 0.72, 0.88)',//过渡动画linear/ease/ease-in/ease-out/ease-in-out/cubic-bezier
                lazyLoad:true,//懒加载默认否
                firstCallback : function(i,sum,me){
                    me.find('.dot').children().first().addClass('cur');
                },
                callback : function(i,sum,me){
                    me.find('.dot').children().eq(i).addClass('cur').siblings().removeClass('cur');
                }
            });
            $('#slide3').swipeSlide({
                autoSwipe:true,//自动切换默认是
                speed:3000,//速度默认4000
                continuousScroll:true,//默认否
                transitionType:'ease-in'
            });



        })
    </script>
</head>

<body ontouchstart>
<div class="container">
    <div class="page-hd">
        <h1 class="page-hd-title tcenter">
            欢迎使用华创家政服务
        </h1>
    </div>
    <div class="slide" id="slide1">
        <ul style="transition: all 0.3s cubic-bezier(0.22, 0.69, 0.72, 0.88) 0s; transform: translate3d(-635px, 0px, 0px);"><li style="transition: all 0s cubic-bezier(0.22, 0.69, 0.72, 0.88) 0s; transform: translate3d(-635px, 0px, 0px);">
                <a href="javascript:;">
                    <img src="/slide/3.jpg" alt="">
                </a>
                <div class="slide-desc">华创家政合影</div>
            </li>
            <li style="transition: all 0s cubic-bezier(0.22, 0.69, 0.72, 0.88) 0s; transform: translate3d(0px, 0px, 0px);">
                <a href="javascript:;">
                    <img src="/slide/1.jpg" alt="">
                </a>
                <div class="slide-desc">华创家政合影</div>
            </li>
            <li style="transition: all 0s cubic-bezier(0.22, 0.69, 0.72, 0.88) 0s; transform: translate3d(635px, 0px, 0px);">
                <a href="javascript:;">
                    <img src="/slide/2.jpg" alt="">
                </a>
                <div class="slide-desc">华创家政前台</div>
            </li>
            <li style="transition: all 0s cubic-bezier(0.22, 0.69, 0.72, 0.88) 0s; transform: translate3d(1270px, 0px, 0px);">
                <a href="javascript:;">
                    <img src="/slide/3.jpg" alt="">
                </a>
                <div class="slide-desc">华创家政合影</div>
            </li>
            <li style="transition: all 0s cubic-bezier(0.22, 0.69, 0.72, 0.88) 0s; transform: translate3d(1905px, 0px, 0px);">
                <a href="javascript:;">
                    <img src="/slide/1.jpg" alt="">
                </a>
                <div class="slide-desc">华创家政合影</div>
            </li></ul>
        <div class="dot">
            <span class=""></span>
            <span class="cur"></span>
            <span class=""></span>
        </div>
    </div>
    <br>
    <div class="weui-avatar-circle center">
        <img src="${avatar}">
        <span class="weui-icon-success weui-icon-safe-warn"></span>
    </div>
    <p class="page-hd-desc tcenter">${name},&nbsp;您的账户余额为${money}</p>



    <#list types as type>
    <li class="weui-news-item">
        <div class="weui-news-inners">
            <div class="weui-news-title">${type.name}</div>
            <div class="weui-news-text">
                <p class="weui-news-p">${type.describe}</p>
            </div>
            <div class="weui-news-info">
                <div class="weui-news-infoitem">

                    <span>价格:&nbsp;<#if type.price==-1>未定价<#else>${type.price}</#if>元</span>
                </div>
                <a href="/home/reserve?tid=${type.tid}"><div class="weui-btn_mini">点击下单</div></a>
            </div>
        </div>

    </li>

    </#list>


    <br>
    <br>
    <div class="weui-footer weui-footer_fixed-bottom">

        <p class="weui-footer__text">Copyright &copy; 华创家政服务</p>
    </div>


</div>

</body>
</html>