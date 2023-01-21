import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodv2/providers/actors_future_provider.dart';
import 'package:riverpodv2/ui/actor_detail.dart';
import 'package:riverpodv2/utils/base.dart';

class ActorsUI extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorsRef = ref.watch(popularActorsFutureProvider);
    final halfWidth = MediaQuery.of(context).size.width /2;
    return Scaffold(
      appBar: AppBar(title: Text("Actors"),
      actions: [
        IconButton(onPressed: (){
          showSearch(context: context, delegate: CustomActorSearch());
        }, icon: Icon(Icons.search))
      ],
      ),
      body: actorsRef.when(data: (actors) {
        return ListView.builder(
          itemBuilder: ((context, index) {
            return Card(
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: index % 2 == 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: SizedBox(
                            width: halfWidth,
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Text("${actors[index].name}",style: TextStyle(fontSize: 24),),
                              
                            ],
                          ),
                          )),
                          Flexible(
                              child: Container(
                            height: 200,
                            width: halfWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "$smallImageURL/${actors[index].profilePath}"))),
                          ))
                        ],
                      )
                    : Row(
                        children: [
                          Flexible(
                              child: Container(
                            height: 200,
                            width: halfWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "$smallImageURL/${actors[index].profilePath}"))),
                          )),
                          Flexible(child: SizedBox(
                            width: halfWidth,
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Text("${actors[index].name}",style: TextStyle(fontSize: 24),),
                              
                            ],
                          ),
                          )),
                        ],
                      ),
              ),
            );
          }),
          itemCount: actors.length,
        );
      }, error: (e, st) {
        return Center(
          child: Text("Oop!"),
        );
      }, loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}

class CustomActorSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
     return [
      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.clear)),
     ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
     
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Consumer(builder: (context, ref, child) {
        final size = MediaQuery.of(context).size;
        final searchRef = ref.watch(searchActorFutureProvider(query));
        final halfWidth = MediaQuery.of(context).size.width/2;
        return Container(
          child: searchRef.when(data: (actors) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  ActorDetailUI(actorID: actors[index].id))));
                    },
                    child: 
                    index % 2 == 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: SizedBox(
                            width: halfWidth,
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Text("${actors[index].name}",style: TextStyle(fontSize: 24),),
                              
                            ],
                          ),
                          )),
                          Flexible(
                              child: Container(
                            height: 200,
                            width: halfWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "$smallImageURL/${actors[index].profilePath}"))),
                          ))
                        ],
                      )
                    : Row(
                        children: [
                          Flexible(
                              child: Container(
                            height: 200,
                            width: halfWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "$smallImageURL/${actors[index].profilePath}"))),
                          )),
                          Flexible(child: SizedBox(
                            width: halfWidth,
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Text("${actors[index].name}",style: TextStyle(fontSize: 24),),
                              
                            ],
                          ),
                          )),
                        ],
                      ),
                    );
              },
              itemCount: actors.length,
            );
          }, error: (e, st) {
             print(e.toString());
             print(st.toString());
            return const Center(child: Text("Empty!"),);
          }, loading: () {
            return Center(child:const CircularProgressIndicator());
          }),
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return Container(
      child: Consumer(builder: (context, ref, child) {
        final size = MediaQuery.of(context).size;
        final searchRef = ref.watch(searchActorFutureProvider(query));
        final halfWidth = MediaQuery.of(context).size.width/2;
        return Container(
          child: searchRef.when(data: (actors) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () => GoRouter.of(context).go("/actors/${actors[index].id}"),
                    child: 
                    index % 2 == 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: SizedBox(
                            width: halfWidth,
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Text("${actors[index].name}",style: TextStyle(fontSize: 24),),
                              
                            ],
                          ),
                          )),
                          Flexible(
                              child: Container(
                            height: 200,
                            width: halfWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "$smallImageURL/${actors[index].profilePath}"))),
                          ))
                        ],
                      )
                    : Row(
                        children: [
                          Flexible(
                              child: Container(
                            height: 200,
                            width: halfWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "$smallImageURL/${actors[index].profilePath}"))),
                          )),
                          Flexible(child: SizedBox(
                            width: halfWidth,
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Text("${actors[index].name}",style: TextStyle(fontSize: 24),),
                              
                            ],
                          ),
                          )),
                        ],
                      ),
                    );
              },
              itemCount: actors.length,
            );
          }, error: (e, st) {
             //print(e.toString());
            // print(st.toString());
            return const Center(child: Text("Empty!"),);
          }, loading: () {
            return Center(child:const CircularProgressIndicator());
          }),
        );
      }),
    );
  }

}