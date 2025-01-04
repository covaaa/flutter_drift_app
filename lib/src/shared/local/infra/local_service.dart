import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'local_service.g.dart';

@riverpod
LocalService localService(Ref ref) => const LocalService();

class LocalService {
  const LocalService();
  Future<Directory> fetchDirectory() => getApplicationSupportDirectory();
}
