import 'package:crypto_bazar_application_clean/features/crypto/domain/entities/crypto.dart';

abstract class CryptoRepository {
  Future<List<Crypto>> getCryptos();
}
