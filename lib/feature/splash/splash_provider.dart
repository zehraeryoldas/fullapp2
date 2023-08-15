//burada birkaç işlemi kullabilmek için bunu yazıyoruz

// 'equatable' paketi, objelerin eşitlik karşılaştırmalarını kolaylaştırmak için kullanılır.
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullapp2/product/enum/platform_enum.dart';
import 'package:fullapp2/product/model/number_model.dart';
import 'package:fullapp2/product/utility/version_manager.dart';

import '../../product/utility/firebase/firebase_collections.dart';

class SplasProvider extends StateNotifier<SplashState> {
  SplasProvider() : super(const SplashState());

// // 'checkApplicationVersion' fonksiyonu, uygulama sürümünü kontrol eder.
  Future<void> checkApplicationVersion(String clientVersion) async {
    final databaseValue =
        await getVersionFromDatabase(); //veriyi veritabanından alıyoruz
    if (databaseValue == null || databaseValue.isEmpty) //eğer veri boş ise
    {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    } //eğer veri boş değilse
    final checkIsNeedForceUpdate = VersionManager(
        deviceValue: clientVersion, databaseValue: databaseValue);
    if (checkIsNeedForceUpdate.isNeedUpdate()) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }
    state = state.copyWith(isRedirectHome: true);
  }
}

Future<String?> getVersionFromDatabase() //veriyi veritabanından alıyoruz
async {
  if (kIsWeb) {
    //eğer web ise
    return null; //null döndür
  }

  final response = await FirebaseCollections.version.ref
      .withConverter<NumberModel>(
          //withConverter ile veriyi alıyoruz
          fromFirestore: (snapshot, options) => NumberModel()
              .fromFirebase(snapshot), //fromFirebase ile veriyi alıyoruz
          toFirestore: (value, options) {
            //value değerini alıyoruz
            return value.toJson(); //toJson ile jsona çeviriyoruz
          })
      .doc(PlatformEnum.versionName
          //
          // PlatformEnum.versionName,
          )
      .get();

  return response.data()?.number; //veriyi döndürüyoruz
  //FirebaseCollections.version.ref.doc();
  //return null;
}

//aynı stateler gelmeis ve koruması adına bunu equtable ile sarmalıyoruz.
//hem referans eşitliğini kurtarmış oluyoruz hem de referans kontrolü açısından
//
class SplashState extends Equatable {
  const SplashState({
    this.isRequiredForceUpdate,
    this.isRedirectHome,
  });

  final bool?
      isRequiredForceUpdate; // Zorunlu güncelleme gerektiren durumu belirtir.
  final bool? isRedirectHome; // Anasayfaya yönlendirme durumunu belirtir.

  @override
  //burada equatable'ları yazdık
  //bunlar birbirine eşit mi değil mi diye kontrol ediyor
  List<Object?> get props => [isRequiredForceUpdate, isRedirectHome];

//burada copy with ile değişiklikleri yapabiliyoruz
  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return SplashState(
      //burada bir state döndürüyoruz
      isRequiredForceUpdate: //
          isRequiredForceUpdate ?? this.isRequiredForceUpdate, //
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
