import cv2

# Load the cascade
face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
# Read the input image
image = "test.jpg"
def detectface(image):
    img = cv2.imread(image)
    # Convert into grayscale
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    # Detect faces
    faces = face_cascade.detectMultiScale(gray, 1.1, 4)
    # for (x, y, w, h) in faces:
    #     cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)
    faces_list = []
    for (x, y, w, h) in faces:
        faces_list.append(img[y:y + h, x:x + w])
    num = 0
    for i in faces_list:
        cv2.imshow("face", i )
        cv2.imwrite('face'+ str(num) +'.jpg', i)
        num+=1
    # Display the output
    cv2.waitKey()

detectface(image=image)