
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/services/actor_repo.dart';

final popularActorsFutureProvider = FutureProvider((ref){
  final actorRef = ref.watch(actorProvider);
  return actorRef.populars();
});

final moviesCastByActorFutureProvider = FutureProvider.family((ref,int actorId){
  final actorRef = ref.watch(actorProvider);
  return actorRef.moviesCastByPerson(actorId);
});

final actorDetailFutureProvider = FutureProvider.family((ref,int actorId){
   final actorRef = ref.watch(actorProvider);
  return actorRef.actorDetial(actorId);
});