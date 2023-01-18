import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerView extends ConsumerStatefulWidget {
  final String videoId;
  TrailerView({required this.videoId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TrailerViewState(videoID: videoId);
  }
}

class _TrailerViewState extends ConsumerState {
  final String videoID;
  _TrailerViewState({required this.videoID});
  late YoutubePlayerController _controller; 
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoID,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        isLive: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }
}
