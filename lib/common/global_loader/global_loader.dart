import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalLoader extends StateNotifier<bool> {
  GlobalLoader() : super(false);
  void setLoaderValue(bool value) {
    state = value;
  }
}
final globalLoaderNotifier  =  StateNotifierProvider<GlobalLoader, bool>((ref) => GlobalLoader());