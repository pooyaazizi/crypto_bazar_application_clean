import 'package:crypto_bazar_application_clean/features/crypto/domain/entities/crypto.dart';
import 'package:crypto_bazar_application_clean/features/crypto/domain/usecases/get_cryptos.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_event.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListBloc
    extends Bloc<CryptoListEvent, CryptoListState> {
  final GetCryptos getCryptos;
  List<Crypto> _allCryptos = [];

  CryptoListBloc(this.getCryptos)
    : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      emit(CryptoListLoading());

      try {
        final cryptos = await getCryptos();
        _allCryptos = cryptos;

        emit(CryptoListLoaded(cryptos));
      } catch (e) {
        emit(CryptoListError(e.toString()));
      }
    });

    on<FilterCryptoList>((event, emit) async {
      final keyword = event.keyword.toLowerCase();

      if (_allCryptos.isEmpty) {
        emit(CryptoListLoaded([]));

        return;
      }

      emit(
        CryptoListLoaded(
          state is CryptoListLoaded
              ? (state as CryptoListLoaded).cryptos
              : [],
          isSearchLoadingVisible: true,
        ),
      );

      await Future.delayed(
        const Duration(milliseconds: 3000),
      );

      final filteredList = _allCryptos
          .where(
            (crypto) => crypto.name
                .toLowerCase()
                .contains(keyword),
          )
          .toList();
      emit(
        CryptoListLoaded(
          filteredList,
          isSearchLoadingVisible: false,
        ),
      );
    });
  }
}
