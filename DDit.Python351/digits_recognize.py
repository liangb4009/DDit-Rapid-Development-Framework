# -*- coding: UTF-8 -*-
# @create by MarickLiang, 2018-07-17
#数字识别
import tensorflow as tf
import os
import cv2
from PIL import Image
import ReadDigits
import numpy as np

# WorkSpacePath = os.path.abspath(os.path.join(os.curdir, "Tensorflow_4_models\\"))
# MetaFile = "Tensorflow4.ckpt.meta"
# ModelFile = "Tensorflow4.ckpt"
WorkSpacePath = os.path.abspath(os.path.join(os.curdir, "Tensorflow_5_models\\"))
MetaFile = "Tensorflow5.ckpt-19.meta"
ModelFile = "Tensorflow5.ckpt-19"
SrcImgFile = "SrcHandWrite.jpg"
ImgFile = "HandWrite.jpg"
CropFile = "CropFile"
MetaFilePath = os.path.join(WorkSpacePath, MetaFile)
ModelFilePath = os.path.join(WorkSpacePath, ModelFile)
SrcImgPath = os.path.join(WorkSpacePath, SrcImgFile)
ImgPath = os.path.join(WorkSpacePath,ImgFile)
CropFilePath = os.path.join(WorkSpacePath,CropFile)
EnvInfo = {}
EnvInfo['MetaFilePath']=MetaFilePath
EnvInfo['ModelFilePath']=ModelFilePath
rd = ReadDigits.ReadDigits(EnvInfo)
backGround = cv2.imread(SrcImgPath)
backGround = cv2.resize(backGround,(640,480),0,0,cv2.INTER_LINEAR)
backGround = cv2.cvtColor(backGround,cv2.COLOR_BGR2GRAY)
handWrite = cv2.imread(ImgPath)
handWrite = cv2.resize(handWrite, (640,480),0,0,cv2.INTER_LINEAR)
saveHandWrite = handWrite.copy()
cropHandWrite = Image.fromarray(saveHandWrite)
handWrite = cv2.cvtColor(handWrite,cv2.COLOR_BGR2GRAY)
diff = cv2.absdiff(backGround,handWrite)
handWrite = cv2.threshold(diff,100,255,cv2.THRESH_BINARY)[1]
kernal = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
handWrite = cv2.dilate(handWrite, kernal, iterations=3)
global count
count = 0
while True:
    cv2.imshow("saveHandWrite",saveHandWrite)
    image, cnts, hierarchy = cv2.findContours(handWrite.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    index = 0
    for c in cnts:
        if cv2.contourArea(c) <50 or cv2.contourArea(c) > 400:
            continue
        if cv2.contourArea(c) > 0:
            (x,y,w,h) = cv2.boundingRect(c)
            cv2.rectangle(saveHandWrite,(x,y),(x+w,y+h),(0,255,0),1)
            toCheck = cropHandWrite.crop((x,y,x+w,y+h))
            if(count==0):
                cv2.putText(saveHandWrite, "{}".format(rd.CheckDigit(np.asarray(toCheck))), (x, y - 10),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 1)
                toCheck.save('%s%s%s' % (CropFilePath,index,".jpg"))
        index = index + 1
    count = count + 1
    #如果q键被按下，跳出循环
    if cv2.waitKey(100) & 0xFF == ord('q'):
        break

