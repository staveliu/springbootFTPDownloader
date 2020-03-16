package com.hc.jz.util;


import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

/**
 * @Author: YafengLiang
 * @Description:
 * @Date: Created in  16:40 2018/12/5
 */
public class FtpDownloadUtil {
    private Logger logger = LoggerFactory.getLogger(FtpDownloadUtil.class);
    private FTPClient ftpClient;
 private String HOST="202.175.31.139";
//private String HOST="112.3.24.48";
    private int PORT=21;

    private String LOCAL_DIRECTORY;

    private String USERNAME;
    private String PASSWORD;

    public FtpDownloadUtil(String USERNAME, String PASSWORD) {
        this.USERNAME = USERNAME;
        this.PASSWORD = PASSWORD;
        this.LOCAL_DIRECTORY = "C:/nginx-1.14.2/html/"+USERNAME+"/";
    }

    public boolean login(){
        try {
            ftpClient = new FTPClient();
            ftpClient.connect(HOST, PORT);
            boolean state = ftpClient.login(USERNAME, PASSWORD);

            //设置编码
            ftpClient.setControlEncoding("GBK");
            ftpClient.setBufferSize(8096);
            return state;
        }catch (IOException e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 判断给定的路径是文件还是文件夹
     * @param path
     * @return
     * @throws IOException
     */
    public boolean isDirectory(String path) throws IOException{
        //如果是文件，就会返回false
        //如果文件夹或文件名中含有中文，这里要转换一下，不然会返回false
        return ftpClient.changeWorkingDirectory(new String(path.getBytes(), StandardCharsets.ISO_8859_1));
    }

    /**
     * 判断本地路径是否存在，不存在就创建路径
     * @param path
     */
    public void makeDirs(String path){
        File localFile = new File(LOCAL_DIRECTORY+path);
        if(!localFile.exists()){
            System.out.println(localFile.getName());
            localFile.mkdirs();
        }
    }

    /**
     * 下载单个文件
     * @param dir
     * @throws IOException
     */
    public  void downloadFile(String dir) throws IOException{
        File file = new File(LOCAL_DIRECTORY + dir);
        OutputStream os = new FileOutputStream(file);
        ftpClient.setControlEncoding("GBK");
        ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
        //如果文件名中含有中文，retrieveFile文件时会找不到FTP上的文件，导致保存在本地的是一个空文件，所以也要转换一下
        ftpClient.retrieveFile(new String(file.getName().getBytes(), StandardCharsets.ISO_8859_1), os);
        os.close();
    }

    /**
     * 下载任务，递归调用，循环下载所有目录下的文件
     * @param path
     * @throws IOException
     */
    public void doDownload(String path) throws IOException {
        //创建本地目录

        makeDirs(path);
        //切换工作目录
        ftpClient.changeWorkingDirectory(new String(path.getBytes(), StandardCharsets.ISO_8859_1));
        //获取目录下的文件列表

        String[] fileNames = ftpClient.listNames();

        //循环下载FTP目录下的文件
        for(String fname:fileNames){
            System.out.println(isDirectory(path+"/"+fname));
//            if (fname.equals(".")||fname.equals("..")){
//                continue;
//            }
            if(isDirectory(path+"/"+fname)){
                //递归调用
                doDownload(path+"/"+fname);
            }else{
                //下载单个文件
                downloadFile(path+"/"+fname);
            }
        }
    }

    /**
     * 实时同步ftp目录文件到本地
     */

//    public static void main(String[] args) throws IOException {
//        //连接FTP服务器
//        login("fi_stu","M5nYU#2d");
//        //全目录下载
//        MyRun myRun = new MyRun();
//        new Thread(myRun).start();
//        //testUpload();
//    }
//


}
