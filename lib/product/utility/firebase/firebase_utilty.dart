import 'package:fullapp2/product/utility/base/base_model.dart';
import 'package:fullapp2/product/utility/firebase/firebase_collections.dart';

mixin FirebaseUtility {
  Future<List<T>?> fetchList<T extends IdModel, R extends BaseFirebaseModel<T>>(
    R data,
    FirebaseCollections collections,
  ) async {
    final newsCollectionRef = collections.ref;
    final response = await newsCollectionRef.withConverter<T>(
        fromFirestore: (snapshot, options) {
      return data.fromFirebase(snapshot);
    }, toFirestore: (value, options) {
      return {};
    }).get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      return values;
    }
    return null;
  }
}
