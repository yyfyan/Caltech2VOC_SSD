import shutil
import os


annotations='G:/dataset/pedsi/Caltech/Caltechx10/train/annotations_1'
imagepath='G:/dataset/pedsi/Caltech/Caltechx10/train/Oimages/'


distimages= 'G:/dataset/pedsi/Caltech/Caltechx10/train/images/'


def movePicture():
	for walk in os.walk(annotations):
		for each in walk[2]:
			pictureName=each.replace('.xml','.jpg')
			imgFile=imagepath + pictureName
			distFile=distimages+pictureName
			shutil.copyfile(imgFile,distFile)
			print(imgFile)


if __name__=="__main__":
	movePicture()
