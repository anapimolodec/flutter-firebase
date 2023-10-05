import "package:cloud_firestore/cloud_firestore.dart";
import "package:ff/models/brew.dart";
import "package:ff/models/user.dart";

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection ref
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brew');
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.get('name') ?? '',
        sugars: doc.get('sugars') ?? '0',
        strength: doc.get('strength') ?? 0,
      );
    }).toList();
  }

  //user data from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.get('name'),
        sugars: snapshot.get('sugars'),
        strength: snapshot.get('strength'));
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userdata {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
