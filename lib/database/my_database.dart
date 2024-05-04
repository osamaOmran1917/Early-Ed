import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:early_ed/model/news_model.dart';
import 'package:early_ed/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

class MyDataBase {
  static CollectionReference<UserModel> getUsersCollection() {
    return firestore
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
            fromFirestore: (doc, _) => UserModel.fromFireStore(doc.data()!),
            toFirestore: (user, options) => user.toFireStore());
  }

  static Future<UserModel?> getUserById(String uid) async {
    var collection = getUsersCollection();
    var docRef = collection.doc(uid);
    var res = await docRef.get();
    return res.data();
  }

  static updateGrades(String userId, String grades, List<String> newGrades) {
    CollectionReference ref = getUsersCollection();
    ref.doc(userId).update({grades: newGrades});
  }
}