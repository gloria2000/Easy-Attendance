from contextlib import _RedirectStream
from distutils.log import debug
from email import message
from fileinput import filename
from itertools import count
from attendance import convertToExcel, recogniseFace
from flask import Flask , request, jsonify , current_app, send_from_directory,send_file, redirect
import werkzeug
import os
from flask_sqlalchemy import SQLAlchemy
from datetime import date

Student_list = ['aparna','anushree','dona','donna','gloria','jibin','jobin','karen','merin','nikitha','shruti']

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///User.sqlite3'
db = SQLAlchemy(app)

class attendance(db.Model):
   id = db.Column('id', db.Integer, primary_key = True)
   date = db.Column(db.String(100))
   status = db.Column(db.String(20)) 


   def __init__(self, date, name, status):
    self.date = date
    self.status = status


@app.route("/upload",methods = ["POST"])
def upload():

    if (request.method =="POST"):
        imagefile = request.files['image']
        filename = werkzeug.utils.secure_filename(imagefile.filename)
        imagefile.save("./uploaded/" + filename)
        present_students = recogniseFace("./uploaded/" + filename)
        countAbsent = present_students.count("0")
        status = "".join(present_students[1:])

    return {
        'attendance' : status,
        'countAbsent': str(countAbsent)
        }
      
@app.route('/download')
def downloadFile ():
     convertToExcel()
     path = "AttendanceList.xlsx"
     return send_file(path, attachment_filename = "Attendance.xlsx")

if __name__ == "__main__":
    db.create_all()
    app.run(debug = True, port=5000)










# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///User.sqlite3'

	
# db = SQLAlchemy(app)

# class AddAttendance(db.Model):
# 	# Defines the Table Name user
# 	__tablename__ = "user"

# 	# Makes three columns into the table id, name, email
# 	_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
# 	date = db.Column(db.DateTime, nullable=False)
# 	numberOfHours = db.Column(db.Integer(100), nullable=False)
#     #attendance = db.Column(db.String(100))

# 	# A constructor function where we will pass the name and email of a user and it gets add as a new entry in the table.
# 	def __init__(self, date, hour,attendance):
# 		self.date = date
# 		self.hour = hour
#         #self.attendance = attendance