import 'exception/custom_exception.dart';

class VersionManager {
  final String deviceValue;
  final String databaseValue;

  VersionManager({required this.deviceValue, required this.databaseValue});
  bool isNeedUpdate() {
    final deviceValueSplited = deviceValue.split('.').join();
    final databaseValueSplited = databaseValue.split('.').join();

    final deviceNumber = int.tryParse(deviceValueSplited);
    final databaseNumber = int.tryParse(databaseValueSplited);

    if (deviceNumber == null || databaseNumber == null) {
      throw VersionCustomException(
          '$deviceValue or $databaseValue is not valid parse');
    }

    return deviceNumber < databaseNumber;
  }
}
