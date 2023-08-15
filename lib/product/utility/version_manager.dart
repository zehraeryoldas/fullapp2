import 'exception/custom_exception.dart';

class VersionManager {
  final String deviceValue; //amaç versiyonu karşılaştırmak
  final String databaseValue; //amaç versiyonu karşılaştırmak

  VersionManager({required this.deviceValue, required this.databaseValue});
  bool isNeedUpdate() {
    final deviceValueSplited = deviceValue.split('.').join(); //neden split ile ayırıyoruz çünkü 1.2.3 şeklinde geliyor ve biz bunu 123 şeklinde almak istiyoruz 
    //neden 123 şeklinde almak istiyoruz çünkü 123 şeklinde alırsak bu sayıyı karşılaştırabiliriz. 
    //split ile ayırmadan karşılatırma yapıulır mı yapılır ama 1.2.3 ile 1.2.4 arasında karşılaştırma yapamayız. 
    //neden yapamayız çünkü 1.2.3 ile 1.2.4 arasında karşılaştırma yapmak için 123 ile 124 arasında karşılaştırma yapmamız gerekir.
    // split ile ayırıp join ile birleştirerek 123 şeklinde alıyoruz.
    final databaseValueSplited = databaseValue.split('.').join();

    final deviceNumber = int.tryParse(deviceValueSplited);
    final databaseNumber = int.tryParse(databaseValueSplited);

    if (deviceNumber == null || databaseNumber == null) { //eğer deviceNumber veya databaseNumber null ise
      throw VersionCustomException(
          '$deviceValue or $databaseValue is not valid parse'); //VersionCustomException hatası fırlat
    }

    return deviceNumber < databaseNumber; //eğer deviceNumber küçükse databaseNumber dan true döndür
  }
}
