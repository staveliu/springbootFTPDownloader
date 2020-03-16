package com.hc.jz;

import java.util.Random;

public class GenerateMineSweeper {
    //行数
    private int rowSize;
    //列数
    private int colSize;
    //传入的二维数组
    private char[][] map;
    //要生成多少个雷
    private int countMines;
    //初始化一个生成随机数的对象
    private Random random = new Random();

    public GenerateMineSweeper(char[][] map, int countMines) {
        this.rowSize = map.length;
        this.colSize = map[0].length;
        this.map = map;
        this.countMines = countMines;
    }

    public void initMap(){
        for (int i=0;i<rowSize;i++){
            for (int j=0;j<colSize;j++){
                map[i][j]='.';
            }
        }
    }

    //生成雷并返回生成后的二维数组
    public char[][] generate(){
        int row;
        int col;
        initMap();
        for (int i=0;i<countMines;i++){
            do {
                row=random.nextInt(rowSize);
                col=random.nextInt(colSize);
            }while (map[row][col]!='.');
            map[row][col]='*';
            for(int x=row-1;x<=row+1;x++){
                for (int y=col-1;y<=col+1;y++){
                    if (x>=rowSize||y>=rowSize||x<0||y<0){
                        continue;
                    }
                    if (map[x][y]=='.'){
                        map[x][y]='1';
                    }else if (map[x][y]=='*'){
                    }else{
                        map[x][y]=String.valueOf(Integer.parseInt(String.valueOf(map[x][y]))+1).toCharArray()[0];
                    }
                }
            }
        }
        return map;
    }

}
