# -*- coding: UTF-8 -*-
# @create by marick, 2018-07-01
# 识别空瓶Demo
# 导入必要的软件包
import datetime
import cv2
import os

# 初始背景
background = cv2.imread(os.path.abspath(os.path.join(os.curdir,"WhiteBottle\\background.JPG")))
resize = cv2.resize(background, (640, 480), interpolation=cv2.INTER_CUBIC)
backgroundGray = cv2.cvtColor(resize, cv2.COLOR_BGR2GRAY)

#获取当前图片
current = cv2.imread(os.path.abspath(os.path.join(os.curdir,"WhiteBottle\\normal.JPG")))
resize = cv2.resize(current, (640, 480), interpolation=cv2.INTER_CUBIC)
currentGray = cv2.cvtColor(resize, cv2.COLOR_BGR2GRAY)

#查找图像边缘
ddepth = cv2.CV_32F
gradX = cv2.Sobel(current, ddepth=ddepth, dx=1, dy=0, ksize=-1)
gradY = cv2.Sobel(current, ddepth=ddepth, dx=0, dy=1, ksize=-1)
gradient = cv2.subtract(gradX, gradY)
gradient = cv2.convertScaleAbs(gradient)
thresh = cv2.threshold(gradient, 225, 255, cv2.THRESH_BINARY)[1]

# 计算当前帧和第一帧的不同
frameDelta = cv2.absdiff(backgroundGray, currentGray)
thresh2 = cv2.threshold(frameDelta, 25, 255, cv2.THRESH_BINARY)[1]

# 扩展阀值图像填充孔洞，然后找到阀值图像上的轮廓
kernal = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
thresh2 = cv2.dilate(thresh2, kernal, iterations=3)
image, cnts, hierarchy = cv2.findContours(thresh2.copy(), cv2.RETR_EXTERNAL,
                                          cv2.CHAIN_APPROX_SIMPLE)
color = "normal"
min_area = 100000
# 遍历轮廓
for c in cnts:
    if cv2.contourArea(c) <= min_area:
        continue
    #print cv2.contourArea(c)
    # 计算轮廓的边界框
    (x, y, w, h) = cv2.boundingRect(c)

    # 对二值化处理图像中，画轮廓部分绘制直方图
    thresh_hiscv = thresh[(y+h/2):y+h, x:x+w]
    #print thresh_hiscv
    histcv = cv2.calcHist(thresh_hiscv,[0],None,[256],[0,256])
    percentage = histcv[0]/(histcv[0]+histcv[255])
    if(percentage>0.95): color = "white"
    #围绕物体画一个矩形
    if color <>"white":
        cv2.rectangle(current, (x, y), (x + w, y + h), (0, 255, 0), 2)
    else:
        cv2.rectangle(current, (x, y), (x + w, y + h), (0, 0, 255), 2)
    text = color + " bottle " + "is Occupied"

    # 在当前帧上写瓶子状态以及时间戳
    cv2.putText(current, "Bottle Status: {}".format(text), (10, 20),
                cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 2)
    cv2.putText(current, datetime.datetime.now().strftime("%A %d %B %Y %I:%M:%S%p"),
                (10, current.shape[0] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.35, (0, 0, 255), 1)
while True:
    # 显示当前帧并记录用户是否按下按键
    cv2.imshow("Current", current)
    cv2.imshow("thresh", thresh)
    cv2.imshow("thresh_hiscv",thresh_hiscv)
    cv2.imshow("thresh2",thresh2)
    if cv2.waitKey(100) & 0xFF == ord('q'):
        break

cv2.destroyAllWindows()


