import cv2
import pickle
import numpy as np
import pandas as pd
from keras_facenet import FaceNet
from face_recognition import FaceRecognition
from csv import reader
from csv import writer
from datetime import date
# Load the cascade
face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
fr = FaceRecognition()
fr.load('trainedmodel.pkl')
embedder = FaceNet()

Student_list = ['aparna','anushree','dona','donna','gloria','jibin','jobin','karen','merin','nikitha','shruti']

def markAttendance(list_to_append):
     with open("AttendanceList.csv", "a") as File:
         writer_ = writer(File)
         writer_.writerow(list_to_append)
         File.close()

def convertToExcel():
  df_new = pd.read_csv('AttendanceList.csv')
  # saving xlsx file
  GFG = pd.ExcelWriter('AttendanceList.xlsx')
  df_new.to_excel(GFG, index=False)
  GFG.save()

def recogniseFace(imagePath):
  present_students = list()
  ans = []
  add_to_csv = [str(date.today())]
  result = fr.predict(imagePath)
  #find the result of predictions in list format
  for predicted_values in result["predictions"]:
    present_students.append(predicted_values["person"])
    #find the students identified: remove unknown students
  for person in present_students:
    if (person not in ' UNKNOWN unknown '):
        ans.append(person)
  for person in Student_list:
    if person in ans:
        add_to_csv.append("1")
    else:
        add_to_csv.append("0")
  markAttendance(add_to_csv)
  return add_to_csv