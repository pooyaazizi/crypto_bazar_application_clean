import 'package:crypto_bazar_application_clean/features/crypto/domain/usecases/get_cryptos.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_event.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListBloc
    extends Bloc<CryptoListEvent, CryptoListState> {
  final GetCryptos getCryptos;
  CryptoListBloc(this.getCryptos)
    : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      emit(CryptoListLoading());
      try {
        final cryptos = await getCryptos();
        emit(CryptoListLoaded(cryptos));
      } catch (e) {
        emit(CryptoListError(e.toString()));
      }
    });
  }
}
