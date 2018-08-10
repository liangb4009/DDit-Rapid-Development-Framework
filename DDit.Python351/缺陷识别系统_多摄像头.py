# -*- coding: UTF-8 -*-
#@create by marick, 2018-08-02, 缺陷识别系统,支持多摄像头
#缺陷识别系统
import tkinter as tk
import tkinter.messagebox as mgbx
from PIL import Image, ImageTk
import os
import cv2
import mvsdk
import threading
import time
import datetime
import ReadWhite

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
           #self.rdb_camera.pack()
        self.btn_Close = tk.Button(self, text='切换摄像头', command=self.btn_Close, name="btn_Close")
        self.btn_Close.grid(row=1,column=0)
        #self.btn_Close.pack()
        self.protocol('WM_DELETE_WINDOW', self.closeWindow)
    def getCameraidByValue(self):
        rtn = 0
        if self.clas_v.get() == "D": rtn = 0
        if self.clas_v.get() == "M": rtn = 1
        return rtn
    def closeWindow(self):
        print ('关闭窗体')
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
        self.event = threading.Event()
        self.handler = handler
        self.CV_SYSTEM_CACHE_CNT = 5
        self.LOOP_INTERVAL_TIME = 0.2
        print ('初始化摄像头')
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
        print ('Name:' + api.CameraGetFriendlyName())
        print ('SN:' + api.CameraReadSN())
        print ('MAC:' + api.CameraGigeGetMac()[0])
    def start(self):
        print ('CamReader - start')
        self.thread.start()
    def run(self):
        while True:
            print ('CamReader - run')
            if self.handler.need_stop():
                break
            # explanation for this in
            # http://stackoverflow.com/a/35283646/5781248
            for i in range(0, self.CV_SYSTEM_CACHE_CNT):
                self.camera.read()
            img = self.camera.read()
            self.handler.send_frame(img)
            time.sleep(self.LOOP_INTERVAL_TIME)
        self.camera.release()

#应用程序类
class Application(object):
    #初始化程序变量
    def __init__(self, root):
        print ('初始化程序变量')
        self.root = root
        self.root.title('缺陷识别系统-多摄像头')
        #选择摄像头相关
        self.cameraid0 = None#默认读取摄像头为None
        self.cameraid1 = None#默认读取摄像头为None
        self.cameraid2 = None#默认读取摄像头为None
        self.cameraid3 = None#默认读取摄像头为None
        self.cameraid4 = None#默认读取摄像头为None
        self.selectCamera = SelectCamera(self.root,self)
        self.selectCamera.iconify()
        self.LOOP_INTERVAL_TIME = 4
        #摄像头读取相关
        self.camera = None
        self.camReader0 = None
        self.camReader1 = None
        self.camReader2 = None
        self.camReader3 = None
        self.camReader4 = None
        self.lock = threading.Lock()
        self.stop_event = threading.Event()
        self.frames0 = []
        self.frames1 = []
        self.frames2 = []
        self.frames3 = []
        self.frames4 = []
        #图片路径相关
        self.srcFolderPath = os.path.abspath(os.path.join(os.curdir, "DefectRecognize\\"))
        self.backGround = "Background.JPG"
        self.roi = "Roi.JPG"
        self.roiForWhite = "RoiWhite.JPG"
        self.roiForDefects = "RoiDefects.JPG"
        self.roiForDigits = "RoiDigits.JPG"
        self.white = "White.JPG"
        self.defects = "Defects.JPG"
        self.digits = "Digits.JPG"
        #程序界面控件相关
        self.lframe = tk.Frame(self.root)
        self.lframe.grid(row=0,column=0)
        self.rframe = tk.Frame(self.root)
        self.rframe.grid(row=0,column=1)
        self.createWidgets()
        self.bindEvents()
        #颜色相关
        self.blue = (255,0,0)
        self.green = (0,255,0)
        self.red = (0,0,255)
        self.color = self.green
        #线条宽度
        self.linewidth = 2
        #打开摄像头按钮相关
        self.isCameraOpen = False
        self.isCameraClose = False
        #拍摄照片
        self.Images = {}
        #拍摄白瓶照片
        self.WhiteImages = {}
        #鼠标相关
        self.drawRectangle = False
        self.mouseorg = (0,0)
        self.mouseend = (0,0)
        self.mouseevent = None
        #ROI区域相关
        self.roiForWhite = {}
        self.isSaveRoiForWhite = False
        self.isSaveRoiForWhite1 = False
        self.isSaveRoiForWhite2 = False
        self.isSaveRoiForWhite3 = False
        self.isSaveRoiForWhite4 = False
        #检测结果相关
        self.ReadWhite = ReadWhite.ReadWhite(self)
        self.checkResults = {}
    #点击右上角X关闭事件
    def closeWindow(self):
        print ('点击右上角X关闭事件')
        if(mgbx.askyesno("系统提示","确认退出系统么?")==True):
            self.quit()
        else:
            return
    #创建控件
    def createWidgets(self):
        print ('创建控件')
        #视频显示区
        self.lbl_Msg_0 = tk.Label(self.lframe, text="本机摄像头")
        self.lbl_Msg_0.grid(row=0,column=0,columnspan=2)
        self.lbl_Msg_1 = tk.Label(self.lframe, text="摄像头1")
        self.lbl_Msg_1.grid(row=0,column=2,columnspan=2)
        self.lbl_Msg_2 = tk.Label(self.lframe, text="摄像头2")
        self.lbl_Msg_2.grid(row=1,column=0,columnspan=2)
        self.lbl_Msg_3 = tk.Label(self.lframe, text="摄像头3")
        self.lbl_Msg_3.grid(row=1,column=2,columnspan=2)
        self.lbl_Msg_4 = tk.Label(self.lframe, text="摄像头4")
        self.lbl_Msg_4.grid(row=2,column=0,columnspan=2)
        self.btn_OpenCamera = tk.Button(self.lframe, text="打开摄像头", command=self.btn_OpenCamera)
        self.btn_OpenCamera.grid(row=3,column=0)
        self.btn_SaveROIForWhite = tk.Button(self.lframe, text="保存区域", command=self.save_ROIForWhite)
        self.btn_SaveROIForWhite.grid(row=3,column=1)
        self.btn_GetPictures = tk.Button(self.lframe, text="抓拍照片", command=self.btn_GetPictures)
        self.btn_GetPictures.grid(row=3, column=2)
        self.btn_GetWhitePictures = tk.Button(self.lframe, text="抓拍白瓶", command=self.btn_GetWhitePictures)
        self.btn_GetWhitePictures.grid(rows=4, column=0)
        self.btn_GetCheckResults = tk.Button(self.lframe, text="检测结果", command=self.btn_GetCheckResults)
        self.btn_GetCheckResults.grid(row=4, column=1)
        self.btn_Exit = tk.Button(self.lframe, text="退出系统", textvariable="退出系统", command=self.btn_Exit)
        self.btn_Exit.grid(row=4,column=2)
        #抓取照片显示区
        self.lbl_Pic_0 = tk.Label(self.rframe, text="")
        self.lbl_Pic_0.grid(row=0,column=0)
        self.lbl_Pic_1 = tk.Label(self.rframe, text="")
        self.lbl_Pic_1.grid(row=1,column=0)
        self.lbl_Pic_2 = tk.Label(self.rframe, text="")
        self.lbl_Pic_2.grid(row=2,column=0)
        self.lbl_Pic_3 = tk.Label(self.rframe, text="")
        self.lbl_Pic_3.grid(row=3,column=0)
        self.lbl_Pic_4 = tk.Label(self.rframe, text="")
        self.lbl_Pic_4.grid(row=4,column=0)
        #抓取白瓶ROI区域显示区
        self.lbl_Pic_5 = tk.Label(self.rframe, text="")
        self.lbl_Pic_5.grid(row=0, column=1)
        self.lbl_Pic_6 = tk.Label(self.rframe, text="")
        self.lbl_Pic_6.grid(row=1, column=1)
        self.lbl_Pic_7 = tk.Label(self.rframe, text="")
        self.lbl_Pic_7.grid(row=2, column=1)
        self.lbl_Pic_8 = tk.Label(self.rframe, text="")
        self.lbl_Pic_8.grid(row=3, column=1)
        self.lbl_Pic_9 = tk.Label(self.rframe, text="")
        self.lbl_Pic_9.grid(row=4,column=1)
    #得到检测结果
    def btn_GetCheckResults(self):
        print ('得到检测结果')
        print (self.ReadWhite.checkWhite(self.WhiteImages[1]))
        print(self.ReadWhite.checkWhite(self.WhiteImages[2]))
        print(self.ReadWhite.checkWhite(self.WhiteImages[3]))
        print(self.ReadWhite.checkWhite(self.WhiteImages[4]))
    #抓拍白瓶
    def btn_GetWhitePictures(self):
        print ('抓拍白瓶')
        if self.camReader0!= None and self.selectCamera.cameraid == 0:
            imgtk5 = ImageTk.PhotoImage(image=Image.fromarray(self.WhiteImages[0]))
            self.lbl_Pic_5.image = imgtk5
            self.lbl_Pic_5.configure(image=imgtk5)
        else:
            imgtk6 = ImageTk.PhotoImage(image=Image.fromarray(self.WhiteImages[1]))
            imgtk7 = ImageTk.PhotoImage(image=Image.fromarray(self.WhiteImages[2]))
            imgtk8 = ImageTk.PhotoImage(image=Image.fromarray(self.WhiteImages[3]))
            imgtk9 = ImageTk.PhotoImage(image=Image.fromarray(self.WhiteImages[4]))
            self.lbl_Pic_6.image = imgtk6
            self.lbl_Pic_6.configure(image=imgtk6)
            self.lbl_Pic_7.image = imgtk7
            self.lbl_Pic_7.configure(image=imgtk7)
            self.lbl_Pic_8.image = imgtk8
            self.lbl_Pic_8.configure(image=imgtk8)
            self.lbl_Pic_9.image = imgtk9
            self.lbl_Pic_9.configure(image=imgtk9)
    #抓拍照片
    def btn_GetPictures(self):
        print ('抓拍照片')
        if self.camReader0!= None and self.selectCamera.cameraid == 0:
            imgtk0 = ImageTk.PhotoImage(image=Image.fromarray(self.Images[0]))
            self.lbl_Pic_0.image = imgtk0
            self.lbl_Pic_0.configure(image=imgtk0)
        else:
            imgtk1 = ImageTk.PhotoImage(image=Image.fromarray(self.Images[1]))
            imgtk2 = ImageTk.PhotoImage(image=Image.fromarray(self.Images[2]))
            imgtk3 = ImageTk.PhotoImage(image=Image.fromarray(self.Images[3]))
            imgtk4 = ImageTk.PhotoImage(image=Image.fromarray(self.Images[4]))
            self.lbl_Pic_1.image = imgtk1
            self.lbl_Pic_1.configure(image=imgtk1)
            self.lbl_Pic_2.image = imgtk2
            self.lbl_Pic_2.configure(image=imgtk2)
            self.lbl_Pic_3.image = imgtk3
            self.lbl_Pic_3.configure(image=imgtk3)
            self.lbl_Pic_4.image = imgtk4
            self.lbl_Pic_4.configure(image=imgtk4)
    #绑定事件
    def bindEvents(self):
        print ('绑定事件')
        #绑定帧回传事件
        self.root.bind("<<ScannerFrame0>>",self.on_frame0)
        self.root.bind("<<ScannerFrame1>>",self.on_frame1)
        self.root.bind("<<ScannerFrame2>>",self.on_frame2)
        self.root.bind("<<ScannerFrame3>>",self.on_frame3)
        self.root.bind("<<ScannerFrame4>>",self.on_frame4)
        self.root.protocol('WM_DELETE_WINDOW', self.closeWindow)
        #绑定选择摄像头退出事件
        self.root.bind('<<SelectCameraQuit>>',self.openCamera)
        #绑定鼠标事件
        self.root.bind("<ButtonPress-1>",self.bp_l)
        self.root.bind("<Motion>",self.motion)
        self.root.bind("<ButtonRelease-1>",self.br_l)
    #退出系统
    def btn_Exit(self):
        print ('退出系统')
        if(mgbx.askyesno("系统提示","确认退出系统么?")==True):
            self.quit()
        else:
            return
    #通用退出系统方法，适用于Exit按钮和右上角X
    def quit(self):
        self.stop_event.set()
        time.sleep(self.LOOP_INTERVAL_TIME)
        if(self.camera!=None):
            self.camera.release()
        cv2.destroyAllWindows()
        self.root.destroy()
    #点击打开摄像头按钮
    def btn_OpenCamera(self):
        if self.isCameraOpen == False:
            self.isCameraOpen = True
            self.btn_OpenCamera.configure(text="切换摄像头")
        else:
            self.isCameraOpen = False
            self.btn_OpenCamera.configure(text="切换摄像头")
        self.selectCamera.start()
    #重新排列图片位置
    def reArrangeGrid(self):
        #如果选择电脑自带摄像头,所有图像合并在一起，只显示Label0
        if self.selectCamera.cameraid == 0:
            self.lbl_Msg_0.grid(row=0,column=0, columnspan=2)
            self.lbl_Msg_4.grid_forget()
            self.lbl_Msg_3.grid_forget()
            self.lbl_Msg_2.grid_forget()
            self.lbl_Msg_1.grid_forget()
            self.lbl_Pic_0.grid(row=0,column=0)
            self.lbl_Pic_1.grid_forget()
            self.lbl_Pic_2.grid_forget()
            self.lbl_Pic_3.grid_forget()
            self.lbl_Pic_4.grid_forget()
            self.lbl_Pic_5.grid(row=0,column=1)
            self.lbl_Pic_6.grid_forget()
            self.lbl_Pic_7.grid_forget()
            self.lbl_Pic_8.grid_forget()
            self.lbl_Pic_9.grid_forget()
        #如果选择MindVision摄像头，只显示Label1,2,3,4, Label0放到第一个位置
        if self.selectCamera.cameraid == 1:
            self.lbl_Msg_1.grid(row=0,column=0, columnspan=2)
            self.lbl_Msg_2.grid(row=0,column=2, columnspan=2)
            self.lbl_Msg_3.grid(row=1,column=0, columnspan=2)
            self.lbl_Msg_4.grid(row=1,column=2, columnspan=2)
            self.lbl_Msg_0.grid_forget()
            self.lbl_Pic_1.grid(row=0,column=0)
            self.lbl_Pic_2.grid(row=1,column=0)
            self.lbl_Pic_3.grid(row=2,column=0)
            self.lbl_Pic_4.grid(row=3,column=0)
            self.lbl_Pic_0.grid_forget()
            self.lbl_Pic_6.grid(row=0,column=1)
            self.lbl_Pic_7.grid(row=1,column=1)
            self.lbl_Pic_8.grid(row=2,column=1)
            self.lbl_Pic_9.grid(row=3,column=1)
            self.lbl_Pic_5.grid_forget()

        self.root.update()
    #打开摄像头
    def openCamera(self, *args):
        print ('重新排列图片')
        self.reArrangeGrid()
        print ('打开摄像头')
        #公用句柄0
        class Handler0(object):
            cameraid = 0
            def need_stop(self_):
                return self.stop_event.is_set()
            def send_frame(self_, frame):
                self.lock.acquire(True)
                self.frames0.append(frame)
                self.lock.release()
                self.root.event_generate('<<ScannerFrame0>>', when='tail')
        #公用句柄1
        class Handler1(object):
            cameraid = 1
            def need_stop(self_):
                return self.stop_event.is_set()
            def send_frame(self_, frame):
                self.lock.acquire(True)
                self.frames1.append(frame)
                self.lock.release()
                self.root.event_generate('<<ScannerFrame1>>', when='tail')
        #公用句柄2
        class Handler2(object):
            cameraid = 2
            def need_stop(self_):
                return self.stop_event.is_set()
            def send_frame(self_, frame):
                self.lock.acquire(True)
                self.frames2.append(frame)
                self.lock.release()
                self.root.event_generate('<<ScannerFrame2>>', when='tail')
        #公用句柄3
        class Handler3(object):
            cameraid = 3
            def need_stop(self_):
                return self.stop_event.is_set()
            def send_frame(self_, frame):
                print ('send_frame')
                self.lock.acquire(True)
                self.frames3.append(frame)
                self.lock.release()
                self.root.event_generate('<<ScannerFrame3>>', when='tail')
        #公用句柄4
        class Handler4(object):
            cameraid = 4
            def need_stop(self_):
                return self.stop_event.is_set()
            def send_frame(self_, frame):
                print ('send_frame')
                self.lock.acquire(True)
                self.frames4.append(frame)
                self.lock.release()
                self.root.event_generate('<<ScannerFrame4>>', when='tail')
        # 保证只打开一个线程
        if self.camReader0 == None and self.selectCamera.cameraid==0:
            self.camReader0 = CamReader(Handler0())
            self.camReader0.start()
        # 保证只打开一个线程
        if self.camReader1 == None and self.selectCamera.cameraid==1:
            self.camReader1 = CamReader(Handler1())
            self.camReader1.start()
        # 保证只打开一个线程
        if self.camReader2 == None and self.selectCamera.cameraid == 1:
            self.camReader2 = CamReader(Handler2())
            self.camReader2.start()
        # 保证只打开一个线程
        if self.camReader3 == None and self.selectCamera.cameraid == 1:
            self.camReader3 = CamReader(Handler3())
            self.camReader3.start()
        # 保证只打开一个线程
        if self.camReader4 == None and self.selectCamera.cameraid == 1:
            self.camReader4 = CamReader(Handler4())
            self.camReader4.start()
    #帧触发事件
    def on_frame4(self, *args):
        #初始化各种临时结果
        print ('帧触发事件4')
        self.cameraid4 = 4
        #获取四个图像各自帧
        self.lock.acquire(True)
        frame4 = self.frames4.pop(0)
        self.lock.release()
        _,img4 = frame4
        # 在当前帧上写瓶子状态以及时间戳
        cv2.putText(img4, "Camera:{}".format(self.cameraid4),(10,20),cv2.FONT_HERSHEY_SIMPLEX, 0.5, self.color, self.linewidth)
        cv2.putText(img4, datetime.datetime.now().strftime("%A %d %B %Y %I:%M:%S%p"),(10, img4.shape[0] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.35, self.color, self.linewidth)

        cv2image4 = cv2.cvtColor(img4, cv2.COLOR_BGR2RGB)
        cv2image4_resize_1 = cv2.resize(cv2image4,(320,240),0,0,cv2.INTER_CUBIC)
        # 在当前帧上写绘制矩形
        if(self.isSaveRoiForWhite4==True):
            cv2.rectangle(cv2image4_resize_1, self.roiForWhite[3][0], self.roiForWhite[3][1], self.color, self.linewidth)
        if(self.isSaveRoiForWhite4==False and self.checkInRegionN(4)):
            cv2.rectangle(cv2image4_resize_1,self.mouseorg,self.mouseend, self.color,self.linewidth)
            self.roiForWhite[3] = (self.mouseorg,self.mouseend)
            self.WhiteImages[4] = cv2image4_resize_1[self.roiForWhite[3][0][1]+self.linewidth:self.roiForWhite[3][1][1]-self.linewidth,self.roiForWhite[3][0][0]+self.linewidth:self.roiForWhite[3][1][0]-self.linewidth]
        cv2image4_resize_2 = cv2.resize(cv2image4,(160,120),0,0,cv2.INTER_CUBIC)
        self.Images[4] = cv2image4_resize_2
        self.img4 = Image.fromarray(cv2image4_resize_1)
        imgtk4 = ImageTk.PhotoImage(image=self.img4)
        #图像显示在Label上
        self.lbl_Msg_4.image = imgtk4
        self.lbl_Msg_4.configure(image=imgtk4)
    def on_frame3(self, *args):
        #初始化各种临时结果
        print ('帧触发事件3')
        self.cameraid3 = 3
        #获取四个图像各自帧
        self.lock.acquire(True)
        frame3 = self.frames3.pop(0)
        self.lock.release()
        _,img3 = frame3
        # 在当前帧上写瓶子状态以及时间戳
        cv2.putText(img3, "Camera:{}".format(self.cameraid3),(10,20),cv2.FONT_HERSHEY_SIMPLEX, 0.5, self.color, self.linewidth)
        cv2.putText(img3, datetime.datetime.now().strftime("%A %d %B %Y %I:%M:%S%p"),(10, img3.shape[0] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.35, self.color, self.linewidth)

        cv2image3 = cv2.cvtColor(img3, cv2.COLOR_BGR2RGB)
        cv2image3_resize_1 = cv2.resize(cv2image3,(320,240),0,0,cv2.INTER_CUBIC)
        # 在当前帧上写绘制矩形
        if(self.isSaveRoiForWhite3==True):
            cv2.rectangle(cv2image3_resize_1, self.roiForWhite[2][0], self.roiForWhite[2][1], self.color, self.linewidth)
        if(self.isSaveRoiForWhite3 == False and self.checkInRegionN(3)):
            cv2.rectangle(cv2image3_resize_1,self.mouseorg,self.mouseend, self.color,self.linewidth)
            self.roiForWhite[2] = (self.mouseorg,self.mouseend)
            self.WhiteImages[3] = cv2image3_resize_1[self.roiForWhite[2][0][1]+self.linewidth:self.roiForWhite[2][1][1]-self.linewidth,self.roiForWhite[2][0][0]+self.linewidth:self.roiForWhite[2][1][0]-self.linewidth]

        cv2image3_resize_2 = cv2.resize(cv2image3,(160,120),0,0,cv2.INTER_CUBIC)
        self.Images[3] = cv2image3_resize_2
        self.img3 = Image.fromarray(cv2image3_resize_1)
        imgtk3 = ImageTk.PhotoImage(image=self.img3)
        #图像显示在Label上
        self.lbl_Msg_3.image = imgtk3
        self.lbl_Msg_3.configure(image=imgtk3)
    def on_frame2(self, *args):
        # 初始化各种临时结果
        print('帧触发事件2')
        self.cameraid2 = 2
        # 获取四个图像各自帧
        self.lock.acquire(True)
        frame2 = self.frames2.pop(0)
        self.lock.release()
        _, img2 = frame2
        # 在当前帧上写瓶子状态以及时间戳
        cv2.putText(img2, "Camera:{}".format(self.cameraid2), (10, 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, self.color,
                    self.linewidth)
        cv2.putText(img2, datetime.datetime.now().strftime("%A %d %B %Y %I:%M:%S%p"), (10, img2.shape[0] - 10),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.35, self.color, self.linewidth)

        cv2image2 = cv2.cvtColor(img2, cv2.COLOR_BGR2RGB)
        cv2image2_resize_1 = cv2.resize(cv2image2, (320, 240), 0, 0, cv2.INTER_CUBIC)
        # 在当前帧上写绘制矩形
        if(self.isSaveRoiForWhite2==True):
            cv2.rectangle(cv2image2_resize_1,self.roiForWhite[1][0],self.roiForWhite[1][1],self.color,self.linewidth)
        if(self.isSaveRoiForWhite2==False and self.checkInRegionN(2)):
            cv2.rectangle(cv2image2_resize_1,self.mouseorg,self.mouseend, self.color,self.linewidth)
            self.roiForWhite[1] = (self.mouseorg,self.mouseend)
            self.WhiteImages[2] = cv2image2_resize_1[self.roiForWhite[1][0][1]+self.linewidth:self.roiForWhite[1][1][1]-self.linewidth,self.roiForWhite[1][0][0]+self.linewidth:self.roiForWhite[1][1][0]-self.linewidth]
        # 在当前帧上写绘制矩形
        cv2image2_resize_2 = cv2.resize(cv2image2, (160, 120), 0, 0, cv2.INTER_CUBIC)
        self.Images[2] = cv2image2_resize_2

        self.img2 = Image.fromarray(cv2image2_resize_1)
        imgtk2 = ImageTk.PhotoImage(image=self.img2)

        # 图像显示在Label上
        self.lbl_Msg_2.image = imgtk2
        self.lbl_Msg_2.configure(image=imgtk2)
    def on_frame1(self, *args):
        # 初始化各种临时结果
        print('帧触发事件1')
        self.cameraid1 = 1
        # 获取四个图像各自帧
        self.lock.acquire(True)
        frame1 = self.frames1.pop(0)
        self.lock.release()
        _, img1 = frame1
        # 在当前帧上写瓶子状态以及时间戳
        cv2.putText(img1, "Camera:{}".format(self.cameraid1), (10, 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, self.color,
                    self.linewidth)
        cv2.putText(img1, datetime.datetime.now().strftime("%A %d %B %Y %I:%M:%S%p"), (10, img1.shape[0] - 10),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.35, self.color, self.linewidth)
        # 显示当前帧到Label上
        cv2image1 = cv2.cvtColor(img1, cv2.COLOR_BGR2RGB)
        # 对帧图像进行大小变换
        cv2image1_resize_1 = cv2.resize(cv2image1, (320, 240), 0, 0, cv2.INTER_CUBIC)
        # 在当前帧上写绘制矩形
        if(self.isSaveRoiForWhite1==True):
            cv2.rectangle(cv2image1_resize_1,self.roiForWhite[0][0],self.roiForWhite[0][1],self.color,self.linewidth)
        if(self.isSaveRoiForWhite1==False and self.checkInRegionN(1)):
            cv2.rectangle(cv2image1_resize_1,self.mouseorg,self.mouseend, self.color,self.linewidth)
            self.roiForWhite[0] = (self.mouseorg,self.mouseend)
            self.WhiteImages[1] = cv2image1_resize_1[self.roiForWhite[0][0][1]+self.linewidth:self.roiForWhite[0][1][1]-self.linewidth,self.roiForWhite[0][0][0]+self.linewidth:self.roiForWhite[0][1][0]-self.linewidth]
        cv2image1_resize_2 = cv2.resize(cv2image1, (160,120), 0,0, cv2.INTER_CUBIC)
        # 保存160*120大小图像作为截图
        self.Images[1] = cv2image1_resize_2
        # 显示320*240大小图像作为实时图像
        self.img1 = Image.fromarray(cv2image1_resize_1)
        imgtk1 = ImageTk.PhotoImage(image=self.img1)
        # 图像显示在Label上
        self.lbl_Msg_1.image = imgtk1
        self.lbl_Msg_1.configure(image=imgtk1)
    def on_frame0(self, *args):
        #初始化各种临时结果
        print ('帧触发事件')
        self.cameraid0 = 0
        #获取四个图像各自帧
        self.lock.acquire(True)
        frame0 = self.frames0.pop(0)
        self.lock.release()
        _,img0 = frame0
        # 在当前帧上写瓶子状态以及时间戳
        cv2.putText(img0, "Camera:{}".format(self.cameraid0),(10,20),cv2.FONT_HERSHEY_SIMPLEX, 0.5, self.color, self.linewidth)
        cv2.putText(img0, datetime.datetime.now().strftime("%A %d %B %Y %I:%M:%S%p"),(10, img0.shape[0] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.35, self.color, self.linewidth)

        cv2image0 = cv2.cvtColor(img0, cv2.COLOR_BGR2RGB)
        cv2image0_resize_1 = cv2.resize(cv2image0,(320,240),0,0,cv2.INTER_CUBIC)
        cv2image0_resize_2 = cv2.resize(cv2image0,(160,120),0,0,cv2.INTER_CUBIC)
        self.Images[0] = cv2image0_resize_2

        self.img0 = Image.fromarray(cv2image0_resize_1)
        imgtk0 = ImageTk.PhotoImage(image=self.img0)

        #图像显示在Label上
        self.lbl_Msg_0.image = imgtk0
        self.lbl_Msg_0.configure(image=imgtk0)
    #松开鼠标左键
    def br_l(self,event):
        print ('鼠标事件，松开鼠标左键')
        self.mouseend = (event.x,event.y)
        self.drawRectangle = False
        self.mouseevent = event
        if (self.checkInRegionN(1)==True and self.mouseend != self.mouseorg): self.isSaveRoiForWhite1 = True
        if (self.checkInRegionN(2)==True and self.mouseend != self.mouseorg): self.isSaveRoiForWhite2 = True
        if (self.checkInRegionN(3)==True and self.mouseend != self.mouseorg): self.isSaveRoiForWhite3 = True
        if (self.checkInRegionN(4)==True and self.mouseend != self.mouseorg): self.isSaveRoiForWhite4 = True
        self.mouseorg = (0,0)
        self.mouseend = (0,0)
    #按下鼠标左键并移动
    def motion(self,event):
        print ('鼠标事件，按下鼠标左键并移动')
        if self.drawRectangle == True:
            self.mouseend = (event.x, event.y)
        self.mouseevent = event
    #按下鼠标左键
    def bp_l(self,event):
        print ('鼠标事件，按下鼠标左键')
        self.drawRectangle = True
        self.mouseorg = (event.x,event.y)
        self.mouseevent = event
    #保存白瓶1的ROI区域
    def save_ROIForWhite(self):
        print ('保存白瓶1的ROI区域')
        if self.isSaveRoiForWhite == False:
            self.isSaveRoiForWhite = True
            self.btn_SaveROIForWhite.configure(text="重绘区域")
        else:
            self.isSaveRoiForWhite = False
            self.isSaveRoiForWhite1 = False
            self.isSaveRoiForWhite2 = False
            self.isSaveRoiForWhite3 = False
            self.isSaveRoiForWhite4 = False
            self.btn_SaveROIForWhite.configure(text="保存区域")
    #判断鼠标位置在第几张图片
    #n:第n张图片
    #如果mouseorg在第n张图片，返回True，否则返回False
    def checkInRegionN(self,n):
        print('判断鼠标位置在第几张图片')
        c = self.mouseevent.widget['text']
        rtn = False
        if (n==1 and c=="摄像头1"): rtn = True
        if (n==2 and c=="摄像头2"): rtn = True
        if (n==3 and c=="摄像头3"): rtn = True
        if (n==4 and c=="摄像头4"): rtn = True
        return rtn

def main():
    root = tk.Tk()
    app = Application(root)
    root.mainloop()

main()


