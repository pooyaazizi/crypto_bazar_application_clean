import 'package:crypto_bazar_application_clean/features/crypto/domain/entities/crypto.dart';

class CryptoModel extends Crypto {
  CryptoModel({
    required super.id,
    required super.rank,
    required super.symbol,
    required super.name,
    required super.supply,
    required super.maxSupply,
    required super.marketCapUsd,
    required super.volumeUsd24Hr,
    required super.priceUsd,
    required super.changePercent24Hr,
    required super.explorer,
  });

  factory CryptoModel.fromMapJson(
    Map<String, dynamic> jsonMapObject,
  ) {
    return CryptoModel(
      id: jsonMapObject['id']?.toString() ?? 'N/A',
      rank:
          int.tryParse(
            jsonMapObject['rank']?.toString() ?? '',
          ) ??
          0,
      symbol:
          jsonMapObject['symbol']?.toString() ?? 'N/A',
      name: jsonMapObject['name']?.toString() ?? 'N/A',
      supply:
          double.tryParse(
            jsonMapObject['supply']?.toString() ?? '',
          ) ??
          0.0,
      maxSupply:
          double.tryParse(
            jsonMapObject['maxSupply']?.toString() ??
                '',
          ) ??
          0.0,
      marketCapUsd:
          double.tryParse(
            jsonMapObject['marketCapUsd']
                    ?.toString() ??
                '',
          ) ??
          0.0,
      volumeUsd24Hr:
          double.tryParse(
            jsonMapObject['volumeUsd24Hr']
                    ?.toString() ??
                '',
          ) ??
          0.0,
      priceUsd:
          double.tryParse(
            jsonMapObject['priceUsd']?.toString() ??
                '',
          ) ??
          0.0,
      changePercent24Hr:
          double.tryParse(
            jsonMapObject['changePercent24Hr']
                    ?.toString() ??
                '',
          ) ??
          0.0,
      explorer:
          jsonMapObject['explorer']?.toString() ??
          'N/A',
    );
  }

  
}
