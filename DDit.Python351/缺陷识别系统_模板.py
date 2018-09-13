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
        self.btn_Close = tk.Button(self, text='切换摄像头', command=self.btn_Close)
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
        print ('初始化程序变量')
        self.root = root
        self.root.title('缺陷识别系统-多摄像头')
        #选择摄像头相关
        self.cameraid = None#默认读取摄像头为None
        self.selectCamera = SelectCamera(self.root,self)
        self.selectCamera.iconify()
        self.LOOP_INTERVAL_TIME = 1
        #摄像头读取相关
        self.camera = None
        self.camReader = None
        self.lock = threading.Lock()
        self.stop_event = threading.Event()
        self.frames = []
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
        self.lframe = tk.Frame(self.root)
        self.lframe.grid(row=0,column=0)
        self.createWidgets()
        self.bindEvents()
        #颜色相关
        self.blue = (255,0,0)
        self.green = (0,255,0)
        self.red = (0,0,255)
        self.color = self.green
        #线条宽度
        self.linewidth = 2

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
        self.lbl_Msg = tk.Label(self.lframe)
        self.lbl_Msg.grid(row=0,column=0,columnspan=4)
        self.btn_OpenCamera = tk.Button(self.lframe, text="打开摄像头",command=self.btn_OpenCamera)
        self.btn_OpenCamera.grid(row=1,column=0)
        self.btn_Exit = tk.Button(self.lframe, text="退出系统", command=self.btn_Exit)
        self.btn_Exit.grid(row=1,column=2)

    #绑定事件
    def bindEvents(self):
        print ('绑定事件')
        #绑定帧回传事件
        self.root.bind("<<ScannerFrame>>",self.on_frame)
        self.root.protocol('WM_DELETE_WINDOW', self.closeWindow)
        #绑定选择摄像头退出事件
        self.root.bind('<<SelectCameraQuit>>',self.openCamera)

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
        if(self.camera!=None):
            self.camera.release()
        cv2.destroyAllWindows()
        self.root.destroy()

    #点击打开摄像头按钮
    def btn_OpenCamera(self):
        print ('点击打开摄像头按钮')
        self.selectCamera.start()

    #打开摄像头
    def openCamera(self, *args):
        print ('打开摄像头')
        self.cameraid = self.selectCamera.cameraid
        class Handler(object):
            cameraid = self.selectCamera.cameraid
            def need_stop(self_):
                return self.stop_event.is_set()
            def send_frame(self_, frame):
                print ('send_frame')
                self.lock.acquire(True)
                self.frames.append(frame)
                self.lock.release()
                self.root.event_generate('<<ScannerFrame>>', when='tail')
        #切换摄像头前需要关闭前一个摄像头
        if self.camReader != None:
            self.stop_event.set()
            time.sleep(self.LOOP_INTERVAL_TIME)
            if self.camReader.isrun == False:
                print ('关闭前一个摄像头成功')
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
        print ('帧触发事件')
        self.lock.acquire(True)
        frame = self.frames.pop(0)
        self.lock.release()
        _,img = frame
        #先保存原始图像用来生成背景图
        imgSave = img.copy()
        # 在当前帧上写瓶子状态以及时间戳
        cv2.putText(img, "Camera:{}".format(self.cameraid),(10,20),cv2.FONT_HERSHEY_SIMPLEX, 0.5, self.color, self.linewidth)
        cv2.putText(img, datetime.datetime.now().strftime("%A %d %B %Y %I:%M:%S%p"),(10, img.shape[0] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.35, self.color, self.linewidth)

        cv2image = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        self.img = Image.fromarray(cv2image)
        imgtk = ImageTk.PhotoImage(image=self.img)
        self.lbl_Msg.image = imgtk
        self.lbl_Msg.configure(image=imgtk)

    #识别数字事件
    def on_result(self, *args):
        print ('识别数字事件')
        #self.lock.acquire(True)
        #result = self.results.pop(0)
        #self.lock.release()
        #print (result)

def main():
    root = tk.Tk()
    app = Application(root)
    root.mainloop()

main()


