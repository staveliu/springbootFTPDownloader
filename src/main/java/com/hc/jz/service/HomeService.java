package com.hc.jz.service;

import com.hc.jz.JzApplication;
import com.hc.jz.domain.Download;
import com.hc.jz.domain.DownloadRepository;
import com.hc.jz.util.FtpDownloadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;

@Service
public class HomeService {
    @Autowired
    private DownloadRepository downloadRepository;

    public Download getDownloader(String username){
        return downloadRepository.findByFtpUsername(username);
    }
    public Integer addDownloader(String username,String password){
        FtpDownloadUtil ftpDownloadUtil = new FtpDownloadUtil(username,password);
        boolean state = ftpDownloadUtil.login();
        if (state){
            Download exist = downloadRepository.findByFtpUsername(username);
            if (exist!=null && exist.getStatus()!=3){
                return 2;
            }else {
                DownloadThread downloadThread = new DownloadThread();
                downloadThread.setPassword(password);
                downloadThread.setUsername(username);
                JzApplication.getExecutorService().execute(downloadThread);
                Download download = new Download();
                download.setStartTime(new Timestamp(System.currentTimeMillis()));
                download.setFtpUsername(username);
                download.setFtpPassword(password);
                download.setStatus(1);
                downloadRepository.save(download);
                return 1;
            }
        }else{
            return 0;
        }
    }
    public boolean updateStatus(String username,Integer status){
        if (downloadRepository.updateStatus(username,status)>0){
            return true;
        }else{
            return false;
        }
    }
}
