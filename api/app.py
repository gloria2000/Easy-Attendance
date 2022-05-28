from distutils.log import debug
from email import message
from flask import Flask , request, jsonify
import werkzeug

app = Flask(__name__)

@app.route("/upload",methods = ["POST"])
def upload():
    if (request.method =="POST"):
        imagefile = request.files('image')
        filename = werkzueg.utils.secure_filename(imagefile.filename)
        imagefile.save("/uploaded"+filename)
        return jsonify(
            {
                "message" : "Image Uploaded"
            }
        )
if __name__ == "__main__":
    app.run(debug = True)
