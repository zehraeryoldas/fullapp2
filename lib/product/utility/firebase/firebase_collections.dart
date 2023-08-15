import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  version;

  CollectionReference get ref => FirebaseFirestore.instance.collection(name);
}
