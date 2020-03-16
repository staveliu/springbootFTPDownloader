package com.hc.jz;

public class TestGenerator {
    public static void main(String[] args){
        final int row = 40;
        final int col = 40;
        final int mine = 300;
        //定义一个10*10的图
        char[][] map = new char[row][col];
        //初始化一个generate对象
        GenerateMineSweeper generateMineSweeper = new GenerateMineSweeper(map,mine);
        //把generate雷以后的图放到一个新数组
        char[][] afterGenerator = generateMineSweeper.generate();
        //输出查看
        for (int i=0;i<row;i++){
            for (int j=0;j<col;j++){
                System.out.print(afterGenerator[i][j]+" ");
            }
            System.out.println();
        }


    }
}
