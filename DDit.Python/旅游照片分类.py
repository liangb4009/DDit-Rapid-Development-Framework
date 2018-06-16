# -*- coding: UTF-8 -*-
#@create by marick, 2018-06-06, 旅游照片分类
#图片分类到不同文件夹
import tkinter as tk
from PIL import Image, ImageTk
import os
import shutil

class Application(tk.Frame):

    def __init__(self, master=None):
        tk.Frame.__init__(self, master)
        self.curIndex = 0
        self.localFileLists = [];
        self.rdb_v = tk.IntVar()
        self.classics = [(0,"animal","A"),(1,"house","H"),(2,"people","P"),(3,"sea","S")]
        self.clas_v = tk.StringVar()
        self.clas_v.set("A")
        self.srcFolderPath = os.path.abspath(os.path.join(os.curdir,"Travel\\all\\"))
        self.trgFolderPath = os.path.abspath(os.path.join(os.curdir,"Travel\\"))
        self.pack()
        self.createWidgets()


    def createWidgets(self):
        self.loadLocalFileLists(self.srcFolderPath)
        self.img_Label = tk.Label(self)
        self.img_Label.grid(row=0,column=0,columnspan=4)
        self.btn_Preview = tk.Button(self, text="Preview",command=self.preview)
        self.btn_Preview.grid(row=1,column=0)
        self.btn_Next = tk.Button(self,text="Next",command=self.nextview)
        self.btn_Next.grid(row=1,column=1)
        for col, text, direction in self.classics:
            self.rdb_clas = tk.Radiobutton(self,text=text,variable=self.clas_v,value=direction,command=self.rdbClass)
            self.rdb_clas.grid(row=3,column=col)
        self.setImage()

    def pickImage(self,srcFilePath,trgFilePath):
        print srcFilePath + "-->" + trgFilePath
        shutil.copy(srcFilePath,trgFilePath)


    def getClassesFolderName(self):
        rtn = ""
        if self.clas_v.get() == "A": rtn = "animal"
        if self.clas_v.get() == "H": rtn = "house"
        if self.clas_v.get() == "P": rtn = "people"
        if self.clas_v.get() == "S": rtn = "sea"
        return rtn

    def rdbClass(self):
        print str(self.rdb_v.get()) + "," + self.clas_v.get()
        srcFilePath = os.path.join(self.srcFolderPath,self.localFileLists[self.curIndex])
        trgFilePathForClasses = self.trgFolderPath + "\\" + self.getClassesFolderName() + "\\" + self.localFileLists[self.curIndex]
        self.pickImage(srcFilePath,trgFilePathForClasses)
        self.nextview()

    def rdbChange(self):
        print str(self.rdb_v.get())

    def setImage(self):
        self.img =  Image.open(os.path.join(self.srcFolderPath,self.localFileLists[self.curIndex]))
        photo =  ImageTk.PhotoImage(self.img)
        self.img_Label.configure(image=photo)
        self.img_Label.image = photo

    def preview(self):
        if(self.curIndex>=1): self.curIndex = self.curIndex - 1
        #print self.curIndex
        self.setImage()

    def nextview(self):
        if(self.curIndex<len(self.localFileLists)-1): self.curIndex = self.curIndex + 1
        #print self.curIndex
        self.setImage()

    def loadLocalFileLists(self, localFilePath):
        if(os.path.exists(localFilePath)):
            print(localFilePath+' exists!')
            for f in os.listdir(localFilePath):
                self.localFileLists.append(f)
        else:
            print(localFilePath+' doesn''t exist!')

root = tk.Tk()
app = Application(master=root)
app.mainloop()



