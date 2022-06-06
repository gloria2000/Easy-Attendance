from distutils.log import debug
from email import message
from attendance import recogniseFace
from flask import Flask , request, jsonify
import werkzeug

app = Flask(__name__)

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

@app.route("/upload",methods = ["POST"])
def upload():
    if (request.method =="POST"):
        imagefile = request.files['image']
        filename = werkzeug.utils.secure_filename(imagefile.filename)
        imagefile.save("./uploaded/" + filename)
        present_students = recogniseFace("./uploaded/" + filename)  
    students = len(present_students)
    # new_data = AddAttendance(name, email)
    # db.session.add(new_data)
    # db.session.commit()
    return {
        'message' : str(students)
        }
        
if __name__ == "__main__":
    app.run(debug = True, port=5000)
