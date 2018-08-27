# -*- coding: UTF-8 -*-
from pycomm.ab_comm.slc import Driver as SlcDriver
import logging


if __name__ == '__main__':
    logging.basicConfig(
        filename="SlcDriver.log",
        format="%(levelname)-10s %(asctime)s %(message)s",
        level=logging.DEBUG
    )
    c = SlcDriver()
    if c.open('192.168.1.13'):
        #print (c.write_tag('B3:0/0',1))#排除命令，B3:0/0-B3:0.5，6个
        #print (c.read_tag('T4:0.Pre'))#延时开
        #print (c.read_tag('T4:1.Pre'))#延时关
        #c.write_tag('N7:0',0)
        while True:
            #if(c.read_tag('I:0/0')==0): print 'True'
            print (c.read_tag('B3:0/0'))#计数器
            print (c.read_tag('C5:0.ACC'))
            #print (c.read_tag('N7:1'))#排除次数，B3一次增加一次
    c.close()
