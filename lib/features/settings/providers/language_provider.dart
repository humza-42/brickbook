import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/storage/secure_storage.dart';

part 'language_provider.g.dart';

@riverpod
class Language extends _$Language {
  @override
  String build() {
    // Load saved language asynchronously on init
    _loadLanguage();
    return 'en'; // default while loading
  }

  Future<void> _loadLanguage() async {
    final storage = ref.read(secureStorageProvider);
    final saved   = await storage.getLanguage();
    state = saved ?? 'en';
  }

  Future<void> setLanguage(String lang) async {
    final storage = ref.read(secureStorageProvider);
    await storage.setLanguage(lang);
    state = lang;
  }

  bool get isUrdu => state == 'ur';
}
