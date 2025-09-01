

import 'package:crypto_bazar_application_clean/features/crypto/data/datasources/crypto_remote_datasource.dart';
import 'package:crypto_bazar_application_clean/features/crypto/domain/entities/crypto.dart';
import 'package:crypto_bazar_application_clean/features/crypto/domain/repository/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoRemoteDatasource remoteDataSource;

  CryptoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Crypto>> getCryptos() async {
     
    return await remoteDataSource.fetchCryptos();
  }
}