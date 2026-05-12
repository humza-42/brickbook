import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_service.g.dart';

@riverpod
Stream<bool> isConnected(IsConnectedRef ref) {
  return Connectivity()
      .onConnectivityChanged
      .map((results) => results.any((r) => r != ConnectivityResult.none));
}

@riverpod
class ConnectivityNotifier extends _$ConnectivityNotifier {
  StreamSubscription? _sub;

  @override
  bool build() {
    _init();
    ref.onDispose(() => _sub?.cancel());
    return true;
  }

  Future<void> _init() async {
    final result = await Connectivity().checkConnectivity();
    state = result.any((r) => r != ConnectivityResult.none);

    _sub = Connectivity().onConnectivityChanged.listen((results) {
      state = results.any((r) => r != ConnectivityResult.none);
    });
  }

  bool get isOnline => state;
}
