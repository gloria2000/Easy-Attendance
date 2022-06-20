from distutils.log import debug
from email import message
from fileinput import filename
from attendance import recogniseFace
from flask import Flask , request, jsonify , current_app, send_from_directory,send_file
import werkzeug
import os

app = Flask(__name__)


@app.route("/upload",methods = ["POST"])
def upload():
    if (request.method =="POST"):
        imagefile = request.files['image']
        filename = werkzeug.utils.secure_filename(imagefile.filename)
        imagefile.save("./uploaded/" + filename)
        present_students = recogniseFace("./uploaded/" + filename)  
    students = len(present_students)

    return {
        'message' : str(students)
        }
        

@app.route('/download')
def downloadFile ():
    path = "AttendanceList.csv"
    return send_file(path, as_attachment=True)

if __name__ == "__main__":
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