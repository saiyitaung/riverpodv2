import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpodv2/services/actor_repo.dart';
import 'package:riverpodv2/utils/readconfig.dart';

void main(){
  test("Movie cast by person", () async{
    final actorRepo=ActorRepo(dio: Dio(),api: Config.getAPIConfig());
    final movieCasts =await actorRepo.moviesCastByPerson(1749);
     for(final b in movieCasts){
        print(b.backdropPath);
     }
  });
}