import 'package:crypto_bazar_application_clean/core/constants/app_constants.dart';
import 'package:crypto_bazar_application_clean/features/crypto/data/datasources/crypto_remote_datasource.dart';
import 'package:crypto_bazar_application_clean/features/crypto/data/models/crypto_models.dart';
import 'package:crypto_bazar_application_clean/features/crypto/domain/entities/crypto.dart';
import 'package:dio/dio.dart';

class CryptoRemoteDatasourceImpl
    implements CryptoRemoteDatasource {
  @override
  Future<List<Crypto>> fetchCryptos() async {
    Response response = await Dio().get(
      'https://rest.coincap.io/v3/assets?apiKey=798985fda2d2a64271fbbed649da2ea5c3e3e5bef2fcb41f53a234ba309812e6',
    );
    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>(
          (jsonMapObject) =>
              CryptoModel.fromMapJson(jsonMapObject),
        )
        .toList();
    return cryptoList;
  }
}
