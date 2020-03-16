package com.hc.jz;

import javax.swing.*;
import javax.swing.border.LineBorder;
import java.awt.*;
import java.awt.event.*;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MineSweeper {
    public static void main(String arg[]) {
        new win_Start().frameLaunch();
    }
}

class win_Start {
    Frame installWin = null;
    TextField tf_lage = null;
    TextField tf_number = null;

    public void frameLaunch() {
        installWin = new Frame();
        installWin.setBounds(300, 300, 300, 500);
        installWin.setTitle("设置");
        installWin.setVisible(true);
        installWin.setLayout(null);
        installWin.setBackground(new Color(235, 235, 235));
        installWin.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                installWin.setVisible(false);
                System.exit(0);
            }
        });
        Label l1 = new Label("  输入棋盘大小(8-16)：");
        l1.setFont(new Font("宋体", Font.BOLD, 18));
        Label l2 = new Label("  输入地雷数(大于等于8)：");
        l2.setFont(new Font("宋体", Font.BOLD, 16));
        Button sure = new Button("启动");
        l1.setBounds(50, 50, 200, 50);
        l2.setBounds(50, 200, 200, 50);
        sure.setBounds(50, 350, 200, 100);
        sure.addActionListener((ActionListener) new sureLaunch());
        l1.setBackground(new Color(245, 245, 245));
        l2.setBackground(new Color(245, 245, 245));
        tf_lage = new TextField();
        tf_number = new TextField();
        tf_lage.setBounds(100, 100, 100, 50);
        tf_number.setBounds(100, 250, 100, 50);
        tf_lage.setFont(new Font("宋体", Font.BOLD, 38));
        tf_number.setFont(new Font("宋体", Font.BOLD, 38));
        installWin.add(l1);
        installWin.add(l2);
        installWin.add(tf_lage);
        installWin.add(tf_number);
        installWin.add(sure);
    }

    class sureLaunch implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            int number = 0;
            int lage = 0;
            try {
                lage = Integer.parseInt(tf_lage.getText());
                number = Integer.parseInt(tf_number.getText());
            } catch (Exception ae) {
                JOptionPane.showMessageDialog(null, "错误!  请输入数字!", "出现错误!", JOptionPane.ERROR_MESSAGE);
                return;
            }
            if (lage > 7 && lage < 17 && number <= lage * lage) {
                if (number >= 8) {
                    // 启动下一步Frame.
                    installWin.setVisible(false);
                    new mainFrame(lage, number).mainFrameLaunch();
                } else
                    JOptionPane.showMessageDialog(null, "错误!  输入范围应大于等于8!", "出现错误!", JOptionPane.ERROR_MESSAGE);
            } else
                JOptionPane.showMessageDialog(null, "错误!  输入范围有误!", "出现错误!", JOptionPane.ERROR_MESSAGE);
        }
    }

    class mainFrame {
        boolean timeStop = true;
        private int lage = 0;
        private int number = 0;
        private int[][] around = { { -1, 0 }, { -1, 1 }, { 0, 1 }, { 1, 1 }, { 1, 0 }, { 1, -1 }, { 0, -1 },
                { -1, -1 } };
        JPanel p_mine = null;
        Panel p_main = null;
        TextField tf_time = null;
        JButton[][] Mine = null;
        timeStart timeStartLaunch = new timeStart();

        mainFrame(int lage, int number) {
            this.lage = lage;
            this.number = number;
            Mine = new JButton[lage][lage];
        }

        public void mainFrameLaunch() {
            Frame mainFrame = new Frame();
            mainFrame.setBackground(new Color(230, 230, 250));
            mainFrame.setTitle("扫雷");
            mainFrame.setBounds(200, 200, 150 + (35 * lage), 350 + (35 * lage));
            mainFrame.setVisible(true);
            mainFrame.setLayout(null);
            Panel p_time = new Panel();
            p_time.setLayout(null);
            p_time.setBounds((150 + (35 * lage)) / 2 - 100, 50, 200, 50);
            p_time.setBackground(new Color(245, 245, 245));
            Button b_reStart = new Button("重新开始");
            b_reStart.setFont(new Font("宋体", Font.BOLD, 36));
            b_reStart.setBounds((150 + (35 * lage)) / 2 - 100, 200 + (35 * lage), 200, 100);
            b_reStart.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    for (int a = 0; a < lage; a++) {
                        for (int b = 0; b < lage; b++) {
                            Mine[a][b].setIcon(null);
                            Mine[a][b].setText("");
                            String thisName = Mine[a][b].getName();
                            thisName = thisName.replace("@", "");
                            Mine[a][b].setName(thisName);
                            Mine[a][b].setBackground(new Color(176, 196, 222));
                            timeStop = true;
                            new Thread(new timeStart()).start();
                        }
                    }
                }
            });
            p_main = new Panel();
            p_main.setBackground(new Color(245, 245, 245));
            p_main.setBounds(75, 150, 35 * lage, 35 * lage);
            p_main.setLayout(null);
            Panel p_background = new Panel();
            p_background.setBounds(73, 147, (35 * lage) + 4, (35 * lage) + 4);
            p_background.setBackground(new Color(176, 196, 222));

            // 计算时间.
            {
                Label l_time = new Label(" 时间：");
                l_time.setBounds(0, 0, 80, 50);
                l_time.setFont(new Font("宋体", Font.BOLD, 28));
                tf_time = new TextField();
                tf_time.setEditable(false);
                tf_time.setFont(new Font("宋体", Font.BOLD, 40));
                tf_time.setBackground(Color.WHITE);
                tf_time.setBounds(90, 0, 110, 50);
                new Thread(timeStartLaunch).start();
                p_time.add(l_time);
                p_time.add(tf_time);
            }
            mainFrame.add(p_time);
            mainFrame.add(b_reStart);
            mainFrame.add(p_main);
            mainFrame.add(p_background);
            addMineButton();
            // 可以addMineButton.
            mainFrame.addWindowListener(new WindowAdapter() {
                public void windowClosing(WindowEvent e) {
                    mainFrame.setVisible(false);
                    System.exit(0);
                }
            });
        }

        public void addMineButton() {
            for (int a = 0; a < lage; a++) {
                for (int b = 0; b < lage; b++) {
                    // 可以运行
                    Mine[a][b] = new JButton();
                    Mine[a][b].setName("0_<x>" + a + "</x><y>" + b + "</y>");
                    Mine[a][b].setBackground(new Color(176, 196, 222));
                    Mine[a][b].setBorder(new LineBorder(new Color(112, 128, 144)));
                    Mine[a][b].addMouseListener((MouseListener) new mouseTry());
                    Mine[a][b].setBounds(a * 35, b * 35, 35, 35);
                    p_main.add(Mine[a][b]);
                    // 可以add
                }
            }
            addMine();
        }

        public void addMine() {
            // 埋雷方法
            Random r = new Random();
            int i = 0;
            while (i < number) {
                int x = r.nextInt(lage);
                int y = r.nextInt(lage);
                String nameList = Mine[x][y].getName();
                char[] nameCharList = nameList.toCharArray();

                if (nameCharList[0] == 48) {
                    nameList = nameList.replaceFirst("0", "1");
                    Mine[x][y].setName(nameList);
                } else
                    continue;
                // 可以随机
                i++;
                // 0为有累 1没雷
            }
        }

        public void showMine() {
            ImageIcon mine = new ImageIcon("image/mine.gif");
            timeStop = false;
            for (int a = 0; a < lage; a++) {
                for (int b = 0; b < lage; b++) {
                    String name = Mine[a][b].getName();
                    char[] nameList = name.toCharArray();
                    int isHave = (int) nameList[0];
                    if (isHave == 49) {
                        Mine[a][b].setIcon(mine);
                    }
                }
            }
        }

        class mouseTry implements MouseListener {
            JButton jb = null;
            ImageIcon flag = new ImageIcon("image/flag.jpg");
            ImageIcon bloom = new ImageIcon("image/blood.gif");

            public void mouseClicked(MouseEvent e) {
                jb = (JButton) e.getSource();
                if (e.getButton() == 3) {
                    if (jb.getName().contains("@") == false) {
                        if (jb.getName().contains("^")) {
                            jb.setIcon(null);
                            String afterName = jb.getName();
                            afterName = afterName.replace("^", "");
                            jb.setName(afterName);
                        } else {
                            String jbName = jb.getName();
                            jbName = jbName + "^";
                            jb.setName(jbName);
                            jb.setIcon(flag);
                        }
                    }
                } else if (e.getButton() == 1) {
                    String name = jb.getName();
                    String mineHave = name.substring(0, 1);
                    // System.out.print(name);
                    // System.out.println(mineHave);
                    int have = Integer.parseInt(mineHave);
                    if (name.contentEquals("^") == false) {
                        if (have == 1) {
                            jb.setBackground(Color.RED);
                            jb.setIcon(bloom);
                            showMine();
                            JOptionPane.showMessageDialog(null, "失败！", "提示", JOptionPane.ERROR_MESSAGE);
                        } else if (have == 0) {
                            // 检查四周有没有雷
                            {
                                String mineName = jb.getName();
                                mineName = mineName.substring(1, mineName.length());
                                mineName = mineName.replace("_", "");
                                int jbY = 0, jbX = 0;
                                // 截取字符设定坐标.
                                String regexX = "<x>(.*)</x>";
                                Pattern patternX = Pattern.compile(regexX);
                                Matcher matcherX = patternX.matcher(mineName);// 匹配类
                                while (matcherX.find()) {
                                    jbX = Integer.parseInt(matcherX.group(1));
                                }
                                String regexY = "<y>(.*)</y>";
                                Pattern patternY = Pattern.compile(regexY);
                                Matcher matcherY = patternY.matcher(mineName);// 匹配类
                                while (matcherY.find()) {
                                    jbY = Integer.parseInt(matcherY.group(1));// 打印中间字符
                                }
                                // 检查四周是否有雷.
                                {
                                    cheakMine(jbX, jbY);
                                    cheakWin();
                                }
                            }
                        }
                    }
                }
            }

            public void cheakWin() {
                int cheakNumber = 0;
                for (int a = 0; a < lage; a++) {
                    for (int b = 0; b < lage; b++) {
                        String mineName = Mine[a][b].getName();
                        if (mineName.contains("@")) {
                            cheakNumber++;
                        }
                        if (cheakNumber == lage * lage - number) {
                            String timeWin = tf_time.getText();
                            tf_time.setText(timeWin);
                            timeStop = false;
                            JOptionPane.showMessageDialog(null, "成功！  用时：" + timeWin, "提示", JOptionPane.ERROR_MESSAGE);
                        }
                    }
                }
            }

            public void cheakMine(int jbX, int jbY) {
                Mine[jbX][jbY].setName(Mine[jbX][jbY].getName() + "@");
                int MineNumber = 0;
                for (int i = 0; i < 8; i++) {
                    int jb_X = jbX + around[i][0];
                    int jb_Y = jbY + around[i][1];
                    if (jb_X >= 0 && jb_X < lage && jb_Y >= 0 && jb_Y < lage) {
                        // System.out.println(jb_X + " " + jb_Y);
                        try {
                            String jbName1 = Mine[jb_X][jb_Y].getName();
                            // System.out.println(jbName1);
                            String jbMine = jbName1.substring(0, 1);
                            int Mine1 = Integer.parseInt(jbMine);
                            if (Mine1 == 1) {
                                MineNumber++;
                            }
                        } catch (Exception ae1) {
                            // DoNothing
                        }
                    }
                }
                if (MineNumber != 0) {
                    Mine[jbX][jbY].setFont(new Font("宋体", Font.BOLD, 32));
                    Mine[jbX][jbY].setBackground(Color.WHITE);
                    Mine[jbX][jbY].setText("" + MineNumber);
                } else if (MineNumber == 0) {
                    Mine[jbX][jbY].setBackground(Color.WHITE);
                    for (int i = 0; i < 8; i++) {
                        int jb_X = jbX + around[i][0];
                        int jb_Y = jbY + around[i][1];
                        try {
                            boolean flag = Mine[jb_X][jb_Y].getName().contains("@");
                            if (jb_X >= 0 && jb_X < lage && jb_Y >= 0 && jb_Y < lage && flag == false) {
                                cheakMine(jb_X, jb_Y);
                            }
                        } catch (ArrayIndexOutOfBoundsException ae) {
                            ;
                        }

                    }
                }
            }

            public void mousePressed(MouseEvent e) {
            }

            public void mouseReleased(MouseEvent e) {
            }

            public void mouseEntered(MouseEvent e) {
            }

            public void mouseExited(MouseEvent e) {
            }
        }

        class timeStart extends Thread {
            public void run() {
                int time = 0;
                while (timeStop) {
                    tf_time.setText("" + time + "秒");
                    // 可以输出.可以暂停.
                    try {
                        sleep(1000);
                    } catch (InterruptedException ae) {
                        System.out.println("sleep Error");
                    }
                    time = time + 1;
                }
            }
        }
    }
}