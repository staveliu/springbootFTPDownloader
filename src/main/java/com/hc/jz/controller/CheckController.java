package com.hc.jz.controller;

import com.hc.jz.domain.CheckStatus;
import com.hc.jz.domain.Download;
import com.hc.jz.service.HomeService;
import org.hibernate.annotations.Check;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CheckController {
    @Autowired
    private HomeService homeService;

    @RequestMapping("/check")
    public CheckStatus checkResult(@RequestParam("username")String username){
        Download download = homeService.getDownloader(username);
        CheckStatus checkStatus = new CheckStatus();
        if (download==null){
            checkStatus.setStatus(0);
            checkStatus.setResult("错误，没有找到这个任务");
        }else{
            checkStatus.setStatus(download.getStatus());
            if (download.getStatus()==1){
                checkStatus.setResult("正在下载中，还没下载完，请耐心等待");
            }else if (download.getStatus()==2){
                checkStatus.setResult("下载完毕，您可以在http://ftp.hnarzx.com/"+download.getFtpUsername()+"下载你的文件");
            }else if (download.getStatus()==3){
                checkStatus.setResult("下载出错，原因：未知。您可以尝试重新下载");
            }
        }
        return checkStatus;
    }
}
