import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullapp2/product/utility/firebase/firebase_collections.dart';
import 'package:kartal/kartal.dart';

import '../../../product/model/news.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    // CollectionReference news = FirebaseFirestore.instance.collection('news');
    //yukarıdakinin yerine
    final news = FirebaseCollections.news.ref;
    final response = news.withConverter(fromFirestore: ((snapshot, options) {
// final jsonBody=snapshot.data();
// if(jsonBody!=null){
//   return News.fromJson(jsonBody)..copyWith(id: snapshot.id);//copywith is used to copy the data from the jsonbody to the news model
// }

//ONEMLİ::::kodumuzu sadeleştirdik yani katmanlandırdık ui ui de busines businesta
      return const News().fromFirebase(snapshot);
    }), toFirestore: (value, options) {
      if (value == null) throw FirebaseException(plugin: '$value not null');
      return value.toJson();
    }).get();
    return FutureBuilder(
      future: response,
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot<News?>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Placeholder();
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const CircularProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasData) {
              final values = snapshot.data!.docs.map((e) => e.data()).toList();
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: values.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Image.network(
                            values[index]?.image ?? '',
                            height: 100,
                          ),
                          Text(
                            values[index]!.title ?? '',
                            style: context.textTheme.bodyLarge,
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return const SizedBox();
            }
        }
      },
    );
  }
}
