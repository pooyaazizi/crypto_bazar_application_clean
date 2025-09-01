import 'package:crypto_bazar_application_clean/features/crypto/domain/entities/crypto.dart';

abstract class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {
  final List<Crypto> cryptos;
  final bool isSearchLoadingVisible;
  CryptoListLoaded(
    this.cryptos, {
    this.isSearchLoadingVisible = false,
  });
}

class CryptoListError extends CryptoListState {
  final String message;
  CryptoListError(this.message);
}
