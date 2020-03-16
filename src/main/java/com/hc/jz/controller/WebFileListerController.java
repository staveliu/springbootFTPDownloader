package com.hc.jz.controller;


import org.apache.http.HttpResponse;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class WebFileListerController {

    @RequestMapping("/file")
    public void file(@RequestParam("route")String route, HttpServletRequest request, HttpServletResponse response){

    }
}
