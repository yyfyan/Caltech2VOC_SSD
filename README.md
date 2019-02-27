# Caltech2VOC_SSD

I use:
min_gt_height: 20
occlevel: 0.2
only person

get SSD model MR：**15%MR**

first add pdollar_toolbox and code3.2.1 to your matlab path, then replace the dbInfo.m file.

1.run SSD_Caltech2VOC.m
pic-->jpg  anno-->txt

2.run SSD_Caltech2VOC.m
setting paras,including hight,occlevel,object class

3.run txt2Xml.py
changed the path including your setting

4.run move_jpgto.py
changed the path including your setting

5.run txt2xmlnew.py
changed the path including your setting


