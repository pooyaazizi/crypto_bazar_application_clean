import 'package:crypto_bazar_application_clean/features/crypto/domain/entities/crypto.dart';

abstract class CryptoRemoteDatasource {
  Future<List<Crypto>> fetchCryptos();
}
