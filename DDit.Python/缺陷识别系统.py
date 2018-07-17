# -*- coding: UTF-8 -*-
#@create by marick, 2018-07-03, 缺陷识别系统
#缺陷识别系统
import tkinter as tk
import tkinter.messagebox as mgbx
from PIL import Image, ImageTk
import os
import cv2
import mvsdk
import ReadWhite
import threading
import time
import datetime
import ReadBottle
import ReadDefects
import numpy as np

#输入ROI区域名字
class InputRoiRegion(tk.Toplevel):
    def __init__(self, parent, application, *args, **kw):
        tk.Toplevel.__init__(self, master=parent, *args, **kw)
        self.title("输入Roi配置信息")
        self.roiRegionSku = None
        self.roiRegionSkuDesc = None
        self.roiRegionCode = 0 #默认选择识别白瓶
        self.roiRegionLeft = None
        self.roiRegionTop = None
        self.roiRegionRight = None
        self.roiRegionBottom = None
        self.parent = parent
        self.application = application
        self.rdb_v = tk.IntVar()
        self.roiRegionCodeLists = [(0,'识别白瓶','W'),(1,'识别污渍','D')]
        self.clas_v = tk.StringVar()
        self.clas_v.set('W')
        for col, text, regionCode in self.roiRegionCodeLists:
            self.rdb_RegionCode = tk.Radiobutton(self, text=text, variable=self.clas_v, value=regionCode, command=self.rdbClass)
            self.rdb_RegionCode.grid(row=0,column=col)
            self.rdb_RegionCode.pack()
        self.btn_Close = tk.Button(self, text="保存Roi区域", command=self.btn_Close)
        self.btn_Close.grid(row=1,column=0)
        self.btn_Close.pack()
        self.protocol('WM_DELETE_WINDOW',self.closeWindow)
    def getRoiRegionCodeByValue(self):
        rtn = 0
        if self.clas_v.get() == "W": rtn = 0
        if self.clas_v.get() == "D": rtn = 1
        return rtn
    def closeWindow(self):
        print '关闭窗体'
    def rdbClass(self):
        self.roiRegionCode = self.getRoiRegionCodeByValue()
    def start(self):
        self.deiconify()
    def btn_Close(self):
        self.parent.event_generate('<<InputRoiRegionQuit>>',when='tail')
        self.iconify()

#选择摄像头类
class SelectCamera(tk.Toplevel):
    def __init__(self, parent, application, *args, **kw):
        tk.Toplevel.__init__(self, master=parent, *args, **kw)
        self.title("选择摄像头")
        self.cameraid = 1#默认使用MindVision摄像头
        self.parent = parent
        self.application = application
        self.rdb_v = tk.IntVar()
        self.cameralists = [(0,"笔记本电脑自带摄像头","D"),(1,"迈德威尔工业摄像头","M")]
        self.clas_v = tk.StringVar()
        self.clas_v.set("M")
        for col, text, cameracode in self.cameralists:
           self.rdb_camera = tk.Radiobutton(self, text=text, variable=self.clas_v, value=cameracode, command=self.rdbClass)
           self.rdb_camera.grid(row=0,column=col)
           self.rdb_camera.pack()
        self.btn_Close = tk.Button(self, text='切换摄像头', command=self.btn_Close)
        self.btn_Close.grid(row=1,column=0)
        self.btn_Close.pack()
        self.protocol('WM_DELETE_WINDOW', self.closeWindow)
    def getCameraidByValue(self):
        rtn = 0
        if self.clas_v.get() == "D": rtn = 0
        if self.clas_v.get() == "M": rtn = 1
        return rtn
    def closeWindow(self):
        print '关闭窗体'
    def rdbClass(self):
        self.cameraid = self.getCameraidByValue()
    def start(self):
        self.deiconify()
    def btn_Close(self):
        self.parent.event_generate('<<SelectCameraQuit>>',when='tail')
        self.iconify()

#视频读取类
class CamReader(object):
    def __init__(self,handler):
        self.isrun = False
        self.thread = threading.Thread(target=self.run)
        self.handler = handler
        self.CV_SYSTEM_CACHE_CNT = 5
        self.LOOP_INTERVAL_TIME = 0.2
        print '初始化摄像头'
        #默认打开笔记本电脑摄像头
        self.cameraid = self.handler.cameraid
        self.camera = cv2.VideoCapture(self.cameraid)
        # 设置相机分辨率
        self.camera.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
        self.camera.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)
        # 设置相机触发模式（0：连续   1：软触发   2：外触发）
        self.camera.set(cv2.CAP_PROP_WHITE_BALANCE_BLUE_U, 0)
        # 设置相机曝光模式（80：手动   81：自动）
        self.camera.set(cv2.CAP_PROP_WHITE_BALANCE_BLUE_U, 80)
        # 设置相机曝光时间（单位微秒）
        self.camera.set(cv2.CAP_PROP_BRIGHTNESS, 10 * 1000)
        # 设置增益
        self.camera.set(cv2.CAP_PROP_GAIN, 3)
        # 获取迈德威视(mindvideo)
        self.camera.set(cv2.CAP_PROP_WHITE_BALANCE_BLUE_U, 120)
        api = mvsdk.MvApi(int(self.camera.get(cv2.CAP_PROP_WHITE_BALANCE_BLUE_U)))
        print 'Name:' + api.CameraGetFriendlyName()
        print 'SN:' + api.CameraReadSN()
        print 'MAC:' + api.CameraGigeGetMac()[0]
    def start(self):
        print 'CamReader - start'
        self.thread.start()
    def run(self):
        while True:
            print 'CamReader - run'
            if self.handler.need_stop():
                break
            self.isrun = True
            # explanation for this in
            # http://stackoverflow.com/a/35283646/5781248
            for i in range(0, self.CV_SYSTEM_CACHE_CNT):
                self.camera.read()
            img = self.camera.read()
            self.handler.send_frame(img)
            time.sleep(self.LOOP_INTERVAL_TIME)
        self.camera.release()
        self.isrun = False

#应用程序类
class Application(object):
    #初始化程序变量
    def __init__(self, root):
        print '初始化程序变量'
        self.root = root
        self.root.title('缺陷识别系统')
        #加载Roi区域
        self.loadRoi = False
        self.roiCenter = (0,0)
        #选择摄像头相关
        self.cameraid = None#默认读取摄像头为None
        self.selectCamera = SelectCamera(self.root,self)
        self.selectCamera.iconify()
        self.LOOP_INTERVAL_TIME = 1
        #瓶子状态相关
        self.bottlestatus = "OK"
        #摄像头读取相关
        self.camera = None
        self.camReader = None
        self.lock = threading.Lock()
        self.stop_event = threading.Event()
        self.frames = []
        #鼠标相关
        self.mouseorg = (0,0)
        self.mouseend = (0,0)
        self.mouseCenterlinebegin = (0,0)
        self.mouseCenterlineend = (0,0)
        self.drawRectangle = False
        self.mouseCenterlineMatch = False
        self.mouseCenterlineMatchRegionWidth = 0
        self.mouseCenterlineMatchRegionHight = 0
        self.roiRegion = (0,0,0,0)
        self.mouseCenterlineMatchWhiteAsst = False
        self.mouseCenterlineMatchDefectAsst = False
        #保存ROI区域相关
        self.isSaveroi = False
        self.roiRegions = [[0,(0,0,0,0)],[1,(0,0,0,0)]]#roiRegions存放用户设置所有roi区域，目前有识别白瓶，识别瑕疵两个区域；[0,(0,0,0,0)]表示识别白瓶，[1,(0,0,0,0)]表示识别瑕疵瓶
        self.SrcForWhite = cv2.imread(os.path.abspath(os.path.join(os.curdir,"DefectRecognize\\White.JPG")))
        self.SrcForDefects = cv2.imread(os.path.abspath(os.path.join(os.curdir, "DefectRecognize\\Defects.JPG")))
        self.Srcs = [[0,self.SrcForWhite],[1,self.SrcForDefects]]#Srcs存放roi区域原图片，[0,self.SrcForWhite]存放白色图片，[1,self.SrcForDefects]存放瑕疵图片
        self.inputRoiRegion = InputRoiRegion(self.root,self)
        self.inputRoiRegion.iconify()
        #图片路径相关
        self.srcFolderPath = os.path.abspath(os.path.join(os.curdir, "DefectRecognize\\"))
        self.backGround = "Background.JPG"
        self.roi = "Roi.JPG"
        self.roiForWhite = "RoiWhite.JPG"
        self.roiForDefects = "RoiDefects.JPG"
        self.white = "White.JPG"
        self.defects = "Defects.JPG"
        self.lframe = tk.Frame(self.root)
        self.lframe.pack(side=tk.TOP)
        self.createWidgets()
        self.bindEvents()
        #识别瓶子
        self.ReadBottle = ReadBottle.ReadBottle(self)
        #识别空白瓶
        self.isReadWhite = False
        self.ReadWhite = ReadWhite.ReadWhite(self)
        #识别瓶上污渍
        self.isReadDefects = False
        self.ReadDefects = ReadDefects.ReadDefects(self)
        #颜色相关
        self.blue = (255,0,0)
        self.green = (0,255,0)
        self.red = (0,0,255)
        self.color = self.green
        #线条宽度
        self.linewidth = 2
        #辨识结果
        self.totalResult = True
    #点击右上角X关闭事件
    def closeWindow(self):
        print '点击右上角X关闭事件'
        if(mgbx.askyesno("系统提示","确认退出系统么?")==True):
            self.quit()
        else:
            return

    #创建控件
    def createWidgets(self):
        print '创建控件'
        self.lbl_Msg = tk.Label(self.lframe)
        self.lbl_Msg.grid(row=0,column=0,columnspan=4)
        self.btn_OpenCamera = tk.Button(self.lframe, text="打开摄像头",command=self.btn_OpenCamera)
        self.btn_OpenCamera.grid(row=1,column=0)
        self.btn_SetBg = tk.Button(self.lframe, text="保存背景图", command=self.btn_SetBg)
        self.btn_SetBg.grid(row=1,column=1)
        self.btn_LoadRoi = tk.Button(self.lframe, text="加载关注区域", command=self.btn_LoadRoi)
        self.btn_LoadRoi.grid(row=1, column=2)
        self.btn_SetRoi = tk.Button(self.lframe, text="保存关注区域",command=self.btn_SetRoi)
        self.btn_SetRoi.grid(row=1,column=3)
        self.btn_ReadWhite = tk.Button(self.lframe, text="识别白瓶", command=self.btn_ReadWhite)
        self.btn_ReadWhite.grid(row=2, column=0)
        self.btn_ReadDefects = tk.Button(self.lframe, text="识别瓶上污渍", command=self.btn_ReadDefects)
        self.btn_ReadDefects.grid(row=2, column=1)
        self.btn_Exit = tk.Button(self.lframe, text="退出系统", command=self.btn_Exit)
        self.btn_Exit.grid(row=2,column=2)

    #绑定事件
    def bindEvents(self):
        print '绑定事件'
        #绑定键盘事件
        self.root.bind('<Control-s>',self.ctrl_S)
        #绑定鼠标事件
        self.root.bind('<ButtonPress-1>',self.bp_1)
        self.root.bind('<Motion>',self.motion)
        self.root.bind('<ButtonRelease-1>',self.br_1)
        #绑定帧回传事件
        self.root.bind("<<ScannerFrame>>",self.on_frame)
        self.root.protocol('WM_DELETE_WINDOW', self.closeWindow)
        #绑定选择摄像头退出事件
        self.root.bind('<<SelectCameraQuit>>',self.openCamera)
        #绑定输入roi区域退出事件
        self.root.bind('<<InputRoiRegionQuit>>',self.SetRoi)

    #加载关注区域
    def btn_LoadRoi(self):
        if self.loadRoi == True:
            self.loadRoi = False
            self.btn_LoadRoi.configure(text="加载关注区域")
        else:
            self.loadRoi = True
            self.btn_LoadRoi.configure(text="关闭关注区域")

    #保存ROI区域信息到文本文件，并存储图像
    def btn_SetRoi(self):
        print '保存ROI区域信息到文本文件，并存储图像'
        self.inputRoiRegion.start()

    #输入roi区域退出事件
    def SetRoi(self,*args):
        print '输入roi区域退出事件'
        self.isSaveroi = True
        rtn = False
        if(mgbx.askyesno("系统提示","你确认将选中区域信息保存？")==True):
            try:
                rtn = True
            except SystemError as e:
                mgbx.showerror("系统提示", "请先用鼠标左键选择ROI区域")
            if rtn:
                #roiRegionCode=0表示识别白瓶
                if self.inputRoiRegion.roiRegionCode == 0:
                    self.roiRegions[0][1] = self.roiRegion
                    self.imgSave.crop(self.roiRegion).save(os.path.join(self.srcFolderPath, self.roiForWhite))
                    self.Srcs[0][1] = self.imgSave.crop(self.roiRegion)
                #roiRegionCode=1表示识别瑕疵
                if self.inputRoiRegion.roiRegionCode == 1:
                    self.roiRegions[1][1] = self.roiRegion
                    self.imgSave.crop(self.roiRegion).save(os.path.join(self.srcFolderPath, self.roiForDefects))
                    self.Srcs[1][1] = self.imgSave.crop(self.roiRegion)
                mgbx.showinfo("设置ROI","设置ROI成功!")
            else:
                mgbx.showinfo("设置ROI","设置ROI失败!")
            #设置self.isSaveroi为False，目的是点击“设置Roi区域后”，能够绘制出Roi区域并显示在屏幕上
            self.isSaveroi = False
        else:
            self.isSaveroi = False
            return

    #鼠标时间，松开鼠标左键
    def br_1(self,event):
        print '鼠标事件，松开鼠标左键'
        #点击“保存ROI区域"按钮，鼠标结束位置为self.roiRegion保存的x,y
        #否则，鼠标开始位置为当前鼠标x,y
        if self.isSaveroi == True:
            self.mouseend = (self.roiRegion[2],self.roiRegion[3])
        else:
            self.mouseend = (event.x,event.y)
        self.drawRectangle = False

    #鼠标事件，按下鼠标左键并移动
    def motion(self,event):
        print '鼠标事件，按下鼠标左键并移动'
        if self.drawRectangle == True:
            self.mouseend = (event.x, event.y)
            self.roiRegion = (min(self.mouseorg[0],event.x),
                              min(self.mouseorg[1],event.y),
                              max(self.mouseorg[0],event.x),
                              max(self.mouseorg[1],event.y))

    #鼠标事件，按下鼠标左键
    def bp_1(self,event):
        print '鼠标事件，按下鼠标左键'
        self.drawRectangle = True
        self.mouseCenterlineMatch = False
        #点击“保存ROI区域"按钮，鼠标开始位置为self.roiRegion保存左上角的x,y
        #否则，鼠标开始位置为当前鼠标x,y
        if self.isSaveroi == True:
            self.mouseorg = (self.roiRegion[0],self.roiRegion[1])
        else:
            self.mouseorg = (event.x,event.y)

    #键盘事件，按下Ctrl+S
    def ctrl_S(self):
        print '键盘事件，按下Ctrl+S'

    #退出系统
    def btn_Exit(self):
        print '退出系统'
        if(mgbx.askyesno("系统提示","确认退出系统么?")==True):
            self.quit()
        else:
            return

    #通用推退出系统方法，适用于Exit按钮和右上角X
    def quit(self):
        self.stop_event.set()
        if(self.camera!=None):
            self.camera.release()
        cv2.destroyAllWindows()
        self.root.destroy()

    #识别白瓶
    def btn_ReadWhite(self):
        print '识别白瓶'
        if self.isReadWhite == True:
            self.isReadWhite = False
            self.btn_ReadWhite.configure(text="开始识别白瓶")
        else:
            self.isReadWhite = True
            self.btn_ReadWhite.configure(text="结束识别白瓶")

    #识别瓶上污渍
    def btn_ReadDefects(self):
        print '识别瓶上污渍'
        if self.isReadDefects == True:
            self.isReadDefects = False
            self.btn_ReadDefects.configure(text="开始识别瓶上污渍")
        else:
            self.isReadDefects = True
            self.btn_ReadDefects.configure(text="结束识别瓶上污渍")

    #设置背景图像
    def btn_SetBg(self):
        print '设置背景图像'
        self.imgSave.save(os.path.join(self.srcFolderPath,self.backGround))
        mgbx.showinfo("设置背景图像","设置背景图像成功")

    #点击打开摄像头按钮
    def btn_OpenCamera(self):
        print '点击打开摄像头按钮'
        self.selectCamera.start()

    #打开摄像头
    def openCamera(self, *args):
        print '打开摄像头'
        self.cameraid = self.selectCamera.cameraid
        class Handler(object):
            cameraid = self.selectCamera.cameraid
            def need_stop(self_):
                return self.stop_event.is_set()
            def send_frame(self_, frame):
                print 'send_frame'
                self.lock.acquire(True)
                self.frames.append(frame)
                self.lock.release()
                self.root.event_generate('<<ScannerFrame>>', when='tail')
        #切换摄像头前需要关闭前一个摄像头
        if self.camReader != None:
            self.stop_event.set()
            time.sleep(self.LOOP_INTERVAL_TIME)
            if self.camReader.isrun == False:
                print '关闭前一个摄像头成功'
                self.camReader = None
        #打开另一个摄像头前，清除停止标记
        self.stop_event.clear()
        # 保证只打开一个线程
        if self.camReader == None:
            self.camReader = CamReader(Handler())
            self.camReader.start()
        # 打开摄像头后，设置roiRegion为初始值，保证Roiregion信息输出为(0,0,0,0)
        self.roiRegion = (0,0,0,0)

    #帧触发事件
    def on_frame(self, *args):
        #初始化各种临时结果
        isWhite = False
        isDefects = False
        print '帧触发事件'
        self.lock.acquire(True)
        frame = self.frames.pop(0)
        self.lock.release()
        _,img = frame
        #先保存原始图像用来生成背景图
        imgSave = img.copy()
        # 在当前帧上写瓶子状态以及时间戳
        cv2.putText(img, "Camera:{}".format(self.cameraid),(10,20),cv2.FONT_HERSHEY_SIMPLEX, 0.5, self.color, self.linewidth)
        cv2.putText(img, "Bottle Status:{}".format(self.bottlestatus), (10, 40),cv2.FONT_HERSHEY_SIMPLEX, 0.5, self.color, self.linewidth)
        cv2.putText(img, "Match:{}".format(self.mouseCenterlineMatch), (10, 60), cv2.FONT_HERSHEY_SIMPLEX, 0.5,self.color, self.linewidth)
        cv2.putText(img, datetime.datetime.now().strftime("%A %d %B %Y %I:%M:%S%p"),(10, img.shape[0] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.35, self.color, self.linewidth)
        #如果加载关注区域,使用Roi图片轮廓画矩形
        #否则，使用鼠标框选区域画矩形
        if self.loadRoi == True:
            #使用Roi图片轮廓画矩形
            print '使用Roi图片轮廓画矩形'
            self.roiCenter = self.ReadBottle.recognizeRoiCenter(img)
            cv2.line(img,(self.roiCenter[0],0),(self.roiCenter[0],480),(0,0,255),1)
        else:
            # 使用鼠标框选区域画矩形
            print '使用鼠标框选区域画矩形'
            # 选择区域的中心点划一条垂直直线作为参考线
            print '选择区域的中心点划一条垂直直线作为参考线'
            # 选择区域中心点
            self.roiCenter = self.ReadBottle.recognizeRoiCenter(img)
            # 通过区域中心点绘制垂直直线作为参考线
            cv2.line(img,(self.roiCenter[0],0),(self.roiCenter[0],480),self.color, self.linewidth)
            # 如果已经松开鼠标,表示绘制图片区域结束，需要从保存的ROI区域设置鼠标开始结束位置
            # 如果已经松开鼠标,并且参考线与辅助先重合，需要根据保存参考线获得鼠标开始结束位置
            if self.drawRectangle == False:
                self.mouseorg = (self.roiRegion[0],self.roiRegion[1])
                self.mouseend = (self.roiRegion[2],self.roiRegion[3])
                if self.mouseCenterlineMatch == True:
                    self.mouseorg = (self.mouseCenterlinebegin[0]-self.mouseCenterlineMatchRegionWidth/2,self.mouseCenterlinebegin[1])
                    self.mouseend = (self.mouseCenterlinebegin[0]+self.mouseCenterlineMatchRegionWidth/2,self.mouseCenterlineend[1])
            #遍历roiRegions所有roiRegion，绘制每个roi区域矩形
            #同时需要绘制每个roi区域矩形的辅助线
            #在每个区域矩形左上角标注提示
            for roiRegion in self.roiRegions:
                cv2.rectangle(img, (roiRegion[1][0],roiRegion[1][1]),(roiRegion[1][2],roiRegion[1][3]),self.color,self.linewidth)
                mouseCenterlinebegin = (roiRegion[1][0]+(roiRegion[1][2]-roiRegion[1][0])/2,roiRegion[1][1])
                mouseCenterlineend = (roiRegion[1][0]+(roiRegion[1][2]-roiRegion[1][0])/2,roiRegion[1][3])
                cv2.line(img,mouseCenterlinebegin,mouseCenterlineend,self.color,self.linewidth)
                if roiRegion[0] == 0:
                    cv2.putText(img, "{}".format("white roi"),(roiRegion[1][0],roiRegion[1][1]-10),cv2.FONT_HERSHEY_SIMPLEX,0.5,self.color,self.linewidth)
                if roiRegion[0] == 1:
                    cv2.putText(img, "{}".format("defect roi"),(roiRegion[1][0],roiRegion[1][1]-10),cv2.FONT_HERSHEY_SIMPLEX,0.5,self.color,self.linewidth)
            #绘制当前正在绘制的roi区域矩形
            if self.isSaveroi == False: cv2.rectangle(img, self.mouseorg, self.mouseend, self.color, self.linewidth)
            # 获取参考线开始坐标和结束坐标
            self.mouseCenterlinebegin = (self.mouseorg[0]+(self.mouseend[0]-self.mouseorg[0])/2,self.mouseorg[1])
            self.mouseCenterlineend = (self.mouseorg[0]+(self.mouseend[0]-self.mouseorg[0])/2,self.mouseend[1])
            #画一条直线作为辅助线
            if self.isSaveroi == False: cv2.line(img,self.mouseCenterlinebegin,self.mouseCenterlineend,self.color, self.linewidth)
            #判定辅助线和参考线是否重合
            if(self.mouseCenterlinebegin[0]>=self.roiCenter[0]-1 and self.mouseCenterlinebegin[0]<=self.roiCenter[0]+1):
                self.mouseCenterlineMatch = True
                self.mouseCenterlineMatchRegionWidth = self.mouseend[0]-self.mouseorg[0]
                self.mouseCenterlineMatchRegionHight = self.mouseend[1]-self.mouseorg[1]
                self.drawRectangle = False
            else:
                self.mouseCenterlineMatch = False
            #识别白瓶
            if self.isReadWhite == True:
                print '正在识别白瓶'
                if self.mouseCenterlineMatch == True:
                    print '辅助线和参考线重合，保存白瓶图片'
                    self.imgSave.crop(self.roiRegions[0][1]).save(os.path.join(self.srcFolderPath, self.white))
                    print '找出背景图和白瓶图片所有不同，返回所有不同区域返回'
                    resultForReadWhite = self.ReadWhite.checkWhite(np.asarray(self.imgSave.crop(self.roiRegions[0][1])))
                    if resultForReadWhite == True:
                        isWhite = True
                    else:
                        isWhite = False
            else:
                print '没有识别白瓶'
            #识别瓶上污渍
            if self.isReadDefects == True:
                print '正在识别瓶上污渍'
                if self.mouseCenterlineMatch == True:
                    print '辅助线和参考线重合，保存污渍瓶图片'
                    self.imgSave.crop(self.roiRegions[1][1]).save(os.path.join(self.srcFolderPath, self.defects))
                    print '找出背景图和污渍瓶图片所有不同，返回所有不同区域返回'
                    rtnResult, rtnRegions = self.ReadDefects.checkDefects(np.asarray(self.Srcs[1][1]),np.asarray(self.imgSave.crop(self.roiRegions[1][1])))
                    if rtnResult == True:
                        isDefects = True
                        for rtnRegion in rtnRegions:
                            cv2.rectangle(img, (self.roiRegions[1][1][0]+rtnRegion[0],self.roiRegions[1][1][1]+rtnRegion[1]), (self.roiRegions[1][1][0]+rtnRegion[2],self.roiRegions[1][1][1]+rtnRegion[3]), self.color, self.linewidth)
                    else:
                        isDefects = False
            else:
                print '没有识别瓶上污渍'
            #根据各种情况，设置一个总结果，根据总结果，设置文字颜色
            if isWhite == True or isDefects == True:
                self.totalResult = False
            else:
                self.totalResult = True
            #如果最后结果是False，设置颜色为空色，否则设置颜色为绿色
            if self.totalResult == False:
                self.color = self.red
                self.bottlestatus = "NG"
            else:
                self.color = self.green
                self.bottlestatus = "OK"
        cv2image = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        cv2imageSave = cv2.cvtColor(imgSave, cv2.COLOR_BGR2RGB)
        self.img = Image.fromarray(cv2image)
        self.imgSave = Image.fromarray(cv2imageSave)
        imgtk = ImageTk.PhotoImage(image=self.img)
        self.lbl_Msg.image = imgtk
        self.lbl_Msg.configure(image=imgtk)

def main():
    root = tk.Tk()
    app = Application(root)
    root.mainloop()

main()


