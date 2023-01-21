
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/providers/network_state_notifier.dart';

final netwokStateNotifierProvider = StateNotifierProvider.autoDispose<NetworkStateNotifier,NetworkStatus>((ref) =>
  NetworkStateNotifier()
 );