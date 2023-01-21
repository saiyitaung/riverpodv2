
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class WatchListUI extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Watch list"),
        ),
      body: Center(child: Lottie.network("https://assets7.lottiefiles.com/packages/lf20_NeuXI2OPLG.json")),
      
      );
  }

}