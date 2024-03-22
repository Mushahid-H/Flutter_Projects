import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  CollectionReference reference =
      FirebaseFirestore.instance.collection("note_collection");

  // adding new notes funtions
  Future<void> addNotes(String note) {
    return reference.add({"note": note, "created_at": DateTime.now()});
  }

  Stream<QuerySnapshot> showData() {
    return reference.orderBy("created_at", descending: true).snapshots();
  }

  Future<void> updateNotes(String updateNote, String docId) {
    return reference
        .doc(docId)
        .update({"note": updateNote, "created_at": DateTime.now()});
  }

  Future<void> deleteNotes(String docId) {
    return reference.doc(docId).delete();
  }
}
