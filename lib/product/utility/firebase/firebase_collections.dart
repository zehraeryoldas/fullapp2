import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  news,
  tag,
  version,
  recommended;

  CollectionReference get ref => FirebaseFirestore.instance.collection(name);
}
