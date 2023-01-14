import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpodv2/services/actor_repo.dart';
import 'package:riverpodv2/utils/readconfig.dart';

void main(){
  test("Get popular Actors", () async{
    final people = await ActorRepo(dio: Dio(),api: Config.getAPIConfig()).populars();
    for(final p in people){
      print("${p.name} - ${p.profilePath}");
    }
  });
}