import 'package:crypto_bazar_application_clean/features/crypto/domain/entities/crypto.dart';
import 'package:crypto_bazar_application_clean/features/crypto/domain/repository/crypto_repository.dart';

class GetCryptos {
  final CryptoRepository repository;
  GetCryptos(this.repository);
  Future<List<Crypto>> call() {
    return repository.getCryptos();
  }
}
