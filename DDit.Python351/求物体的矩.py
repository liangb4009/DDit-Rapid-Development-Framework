import os
import cv2
import ReadBottle

class parent():
    def __init__(self):
        self.srcFolderPath = os.path.abspath(os.path.join(os.curdir, "DefectRecognize\\"))
        self.backGround = "Background.JPG"

if __name__ == "__main__":
    filename = os.path.abspath(os.path.join(os.path.curdir,"DefectRecognize\\SaveSampleForTriggerCap\\20181005_084205.JPG"))
    print (filename)
    img = cv2.imread(filename)
    img2 = img.copy()
    checkHalfWidth = 150
    checkHalfHeight = 100
    color = (0,255,0)
    linewidth = 2
    roiCenter = ReadBottle.ReadBottle(parent()).recognizeRoiCenter(img)
    print (roiCenter)
    while(1):
        cv2.circle(img,roiCenter,2,color,cv2.FONT_HERSHEY_SIMPLEX)
        cv2.line(img, (roiCenter[0], 0), (roiCenter[0], 480), color, 1)
        cv2.rectangle(img, (roiCenter[0] - checkHalfWidth, roiCenter[1] - checkHalfHeight),
                      (roiCenter[0] + checkHalfWidth, roiCenter[1] + checkHalfHeight), color,
                      linewidth)
        cv2.imshow('input',img)
        k = cv2.waitKey(1)
        if k == ord('q'):
            break