import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullapp2/product/model/news.dart';
import 'package:fullapp2/product/model/tag.dart';
import 'package:fullapp2/product/utility/firebase/firebase_collections.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());

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
    }
  }

  Future<void> fetchAndLoad() async {
    state = state.copyWith(isLoading: true);
    await fetchNews();
    await fetchTag();
    state = state.copyWith(isLoading: false);
  }
}

class HomeState extends Equatable {
  const HomeState({this.tag, this.news, this.isLoading});
  //paging
  final List<Tag>? tag;
  final List<News>? news;
  final bool? isLoading;

  @override
  // TODO: implement props
  List<Object?> get props => [tag, news, isLoading];
  HomeState copyWith({
    List<News>? news,
    List<Tag>? tag,
    bool? isLoading,
  }) {
    return HomeState(
        tag: tag ?? this.tag,
        news: news ?? this.news,
        isLoading: isLoading ?? this.isLoading);
  }
}
