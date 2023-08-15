class FirebaseException implements Exception {
  final String description;

  FirebaseException(this.description);

  @override
  String toString() {
    // TODO: implement toString
    return '$this $description';
  }
}

class VersionCustomException implements Exception {
  final String description;

  VersionCustomException(this.description);

  @override
  String toString() {
    // TODO: implement toString
    return '$this $description';
  }
}
