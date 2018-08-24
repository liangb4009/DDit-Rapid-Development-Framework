# -*- coding: UTF-8 -*-
from pycomm.ab_comm.slc import Driver as SlcDriver

if __name__ == '__main__':
    c = SlcDriver()
    if c.open('192.168.1.13'):
        print ('true')