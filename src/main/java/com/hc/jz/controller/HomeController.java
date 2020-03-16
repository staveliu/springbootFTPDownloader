package com.hc.jz.controller;

import com.hc.jz.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/downloader")
public class HomeController {
    @Autowired
    private HomeService homeService;

    @RequestMapping("/main")
    public String main(){
        return "main";
    }
    @RequestMapping("/start")
    public String start(@RequestParam("username") String username, @RequestParam("password") String password, Model model){
        username = username.toLowerCase();
        if (username==null || password==null){
            model.addAttribute("error","用户名和密码都不能为空！");
            return "errorInfo";
        }else{
            int state = homeService.addDownloader(username,password);
            if (state == 1){
                model.addAttribute("link","http://ftp.hnarzx.com/"+username);
                return "taskSubmitted";
            }else if (state == 2){
                model.addAttribute("error","该FTP已经下载过，只是可能没下载完，请耐心等待<br>您可以登陆http://ftp.hnarzx.com查看FTP文件<br>如有问题请联系我们");
                return "errorInfo";
            }else if (state == 0){
                model.addAttribute("error","FTP用户名或密码错误");
                return "errorInfo";
            }
        }
        model.addAttribute("error","未知错误");
        return "errorInfo";
    }
}
