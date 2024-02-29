import 'package:anna_sakkoa/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // get instance of firestore & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // go thourgh each individua user
        final user = doc.data();

        // return user
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String receiverId, message) async {
    //get current user info

    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create new message
    Message newMessage = Message(
      senderID: currentUserEmail,
      senderEmail: currentUserID,
      receiverID: receiverId,
      message: message,
      timestamp: timestamp,
    );

    //consturct chat room ID for the two user (sorted to ensure uniqueness)
    List<String> ids = [currentUserID, receiverId];
    ids.sort(); //sort the ids (this ensures that the chat room id is unique)
    String chatRoomID = ids.join("_");
    // add new message to database
    await _firestore
        .collection("chatRooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  //get messages
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    //construct a chatoroom ID for the two users
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join("_");

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
