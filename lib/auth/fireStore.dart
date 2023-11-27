import 'package:cloud_firestore/cloud_firestore.dart';

class FirStore{
  var fullName;
  var emailAddress;
  FirStore(this.fullName,this.emailAddress);

  fireStore() async{
  // Create a new user with a first and last name

final user = <String, dynamic>{
  "Name": fullName,
  "Email": emailAddress
};

// Add a new document with a generated ID
FirebaseFirestore.instance.collection("users").add(user).then((DocumentReference doc) =>
    print('DocumentSnapshot added with ID: ${doc.id}'));
}
}
 