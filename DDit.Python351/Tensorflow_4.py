# -*- coding: UTF-8 -*-
#@create by marick, 2018-07-14, 动手实验TensorFlow
#参考文章：https://www.jianshu.com/p/696bde1641d8
import pandas as pd
import numpy as np
import tensorflow as tf
import os
#1 加载数据集，分开输入和结果
train = pd.read_csv(r"C:\Users\CN093128\Desktop\生产管理控制\2018-07-13 No.81 [图像识别]-识别手工数字\all\train.csv")
images = train.iloc[:,1:].values
labels_flat = train.iloc[:,0:1].values.ravel()
#2 处理输入
images = images.astype(np.float)
images = np.multiply(images, 1.0/255.0)
print ('输入数据的数量:(%g,%g)' % images.shape)
image_size = images.shape[1]
print ('输入数据的维度=>{0}'.format(image_size))
image_width = image_height = np.ceil(np.sqrt(image_size)).astype(np.uint8)
print ('图片的长=>{0}\n图片的高=>{1}'.format(image_width,image_height))
x = tf.placeholder('float',shape=[None,image_size], name="x")#数据维度，这里是784, 没有定义行数, 只定义784列
labels_count = np.unique(labels_flat).shape[0]
print ('结果的种类=>{0}'.format(labels_count))
#3 对结果进行One-hot编码
def dense_to_one_hot(label_dense, num_classes):
    num_labels = label_dense.shape[0]
    index_offset = np.arange(num_labels)*num_classes
    labels_one_hot = np.zeros((num_labels, num_classes))
    labels_one_hot.flat[index_offset + label_dense.ravel()] = 1
    return labels_one_hot
labels = dense_to_one_hot(labels_flat,labels_count)
labels = labels.astype(np.uint8)
y = tf.placeholder('float', shape=[None,labels.shape[1]],name="y")#数据种类，这里是10
print ('结果的数量:({0[0]},{0[1]})'.format(labels.shape))
#4 把输入数据分为训练集和样本集
# 把40000个数据作为训练集，把2000个数据作为验证集
VALIDATION_SIZE = 2000
validation_images = images[:VALIDATION_SIZE]
validation_labels = labels[:VALIDATION_SIZE]
train_images = images[VALIDATION_SIZE:]
train_labels = labels[VALIDATION_SIZE:]
#5 对训练集进行分批
batch_size = 100
n_batch = int(len(train_images)/batch_size)#增加int，预防'float' object has no attribute 'astype'错误，参考https://stackoverflow.com/questions/46630676/float-object-cannot-be-interpreted-as-an-integer
#6 创建一个简单的神经网络用来对图片识别
weights = tf.Variable(tf.zeros([784,10]))
biases = tf.Variable(tf.zeros([10]))
result = tf.matmul(x,weights)+biases
prediction = tf.nn.softmax(result,name='y_pred')
#7 创建损失函数，以交叉熵的平均值为衡量
loss = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(labels=y,logits=prediction))
#8 用梯度下降法优化参数
train_step = tf.train.GradientDescentOptimizer(0.1).minimize(loss)
#9 初始化变量
init = tf.global_variables_initializer()
#10 计算准确度
correction_prediction = tf.equal(tf.argmax(y,1),tf.argmax(prediction,1))
accuracy = tf.reduce_mean(tf.cast(correction_prediction,tf.float32))
with tf.Session() as sess:
    #初始化
    sess.run(init)
    #循环50轮
    for epoch in range(50):
        for batch in range(n_batch):
            #按批取出数据训练
            batch_x = train_images[batch*batch_size:(batch+1)*batch_size]
            batch_y = train_labels[batch*batch_size:(batch+1)*batch_size]
            #进行训练
            sess.run(train_step,feed_dict={x:batch_x,y:batch_y})
        #每一轮计算一次准确度
        #注意这里，y:validation_labels如果写成y:validation_images会报错误
        # Cannot feed value of shape (2000, 784) for Tensor 'Placeholder_1:0', which has shape '(?, 10)'
        accuracy_n = sess.run(accuracy,feed_dict={x:validation_images, y:validation_labels})
        print ("第" + str(epoch+1)+ "轮，准确度为:"+str(accuracy_n))
    #保存结果
    WorkSpacePath = os.path.abspath(os.path.join(os.curdir, "Tensorflow_4_models\\"))
    ModelFile = "Tensorflow4.ckpt"
    SavePath = os.path.join(WorkSpacePath, ModelFile)
    print (SavePath)
    tf.train.Saver().save(sess,SavePath)

