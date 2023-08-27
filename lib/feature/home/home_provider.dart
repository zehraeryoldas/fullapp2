import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullapp2/product/model/news.dart';
import 'package:fullapp2/product/model/recommended.dart';
import 'package:fullapp2/product/model/tag.dart';
import 'package:fullapp2/product/utility/firebase/firebase_collections.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());
  List<Tag> fullTagList = [];
  // ignore: recursive_getters

  //dataları çekelim
  Future<void> fetchNews() async {
    final newsCollectionRef = FirebaseCollections.news.ref;
    final response = await newsCollectionRef.withConverter(
        fromFirestore: (snapshot, options) {
      return const News().fromFirebase(snapshot);
    }, toFirestore: (value, options) {
      return value.toJson();
    }).get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(news: values);
    }
  }

  Future<void> fetchTag() async {
    final tagCollections = FirebaseCollections.tag.ref;
    final response = await tagCollections.withConverter<Tag>(
        fromFirestore: (snapshot, options) {
      return const Tag().fromFirebase(snapshot);
    }, toFirestore: (value, options) {
      return value.toJson();
    }).get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(tag: values);

      //datayı çektikten sonra eşitleme yapalım eğer data gelmemişse de [] bunu koyarım.
      fullTagList = values ?? [];
    }
  }

  Future<void> fetchRecommended() async {
    final recommendedCollections = FirebaseCollections.recommended.ref;
    final response = await recommendedCollections.withConverter(
      fromFirestore: (snapshot, options) {
        return Recommended().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final value = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(rec: value);
    }
  }

  Future<void> fetchAndLoad() async {
    state = state.copyWith(isLoading: true);
    // await fetchNews();
    // await fetchTag();
    // await fetchRecommended();
    //awaitleri bu şekilde gizledik future.waitde yerine kullandık yani
    //birden fazla future olduğunda kullanım avantajı sağlayalım
    Future.wait([fetchNews(), fetchTag(), fetchRecommended()]);
    state = state.copyWith(isLoading: false);
  }

  void updateSelectedTag(Tag? tag) {
    if (tag == null) return;
    state = state.copyWith(selectedTag: tag);
  }
}

class HomeState extends Equatable {
  const HomeState(
      {this.selectedTag, this.rec, this.tag, this.news, this.isLoading});
  //paging
  final List<Recommended>? rec;
  final List<Tag>? tag;
  final List<News>? news;

  final bool? isLoading;
  final Tag? selectedTag;

  @override
  // TODO: implement props
  List<Object?> get props => [rec, tag, news, isLoading, selectedTag];
  HomeState copyWith({
    List<Recommended>? rec,
    List<News>? news,
    List<Tag>? tag,
    bool? isLoading,
    Tag? selectedTag,
  }) {
    return HomeState(
        selectedTag: selectedTag ?? this.selectedTag,
        rec: rec ?? this.rec,
        tag: tag ?? this.tag,
        news: news ?? this.news,
        isLoading: isLoading ?? this.isLoading);
  }
}
