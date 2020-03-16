package com.hc.jz.service;

import com.hc.jz.util.FtpDownloadUtil;
import com.hc.jz.util.SpringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class DownloadThread implements Runnable {
    private String username;
    private String password;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Autowired
    private HomeService homeService;

    @Override
    public void run() {
        homeService = SpringUtils.getBean("homeService");
        FtpDownloadUtil ftpDownloadUtil = new FtpDownloadUtil(username,password);
        ftpDownloadUtil.login();
        try {
            ftpDownloadUtil.doDownload("//");
            System.out.println(this.username);
            homeService.updateStatus(this.username,2);
        } catch (IOException e) {
            e.printStackTrace();
            homeService.updateStatus(this.username,3);
        }finally {
            Thread.currentThread().interrupt();
        }
    }
}
