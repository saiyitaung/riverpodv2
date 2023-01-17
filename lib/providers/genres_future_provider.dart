
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/services/genre_repo.dart';
import 'package:riverpodv2/utils/readconfig.dart';

final genresFutureProvider = FutureProvider((ref){
  final genRef = ref.watch(genreProvider);

  return genRef.getAll(Config.getAPIConfig());
});