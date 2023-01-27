
const admin = require('firebase-admin')
const serviceAccount = require("./firebaseServiceKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
})

const registrationToken = 'd1D5A5dUSJWrRmpweRBdfp:APA91bFsrk3FLsi-KDxPkgOisz6D3OOU2IC0dJl7p2yHe77rzR3eYsfhsONQAVXVZSE9F83QOmQKZeCb8orav7ezbgEYxX2Wj-N5fCdf3y922bQ-itlQyDlbKp1O__wbjEQkgXidXZoy';
const message = {
  data: {
    title: "Test title",
    body: "Time to eat paracetamaol",
  },
  token: registrationToken
};

const sendMsg = () => {
  admin.messaging().send(message)
    .then((response) => {
      console.log('Successfully sent message:', response);
    })
    .catch((error) => {
      console.log('Error sending message:', error);
    });

}
sendMsg()