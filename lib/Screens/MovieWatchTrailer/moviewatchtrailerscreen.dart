import 'package:flutter/material.dart';
import 'package:movieapp/res/assets.dart';
import 'package:movieapp/res/colors.dart';
import 'package:movieapp/res/res.dart';
import 'package:movieapp/widgets/common_widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieWatchTrailerScreen extends StatefulWidget {
  final dynamic trailerKey;

  const MovieWatchTrailerScreen({Key? key, required this.trailerKey})
      : super(key: key);

  @override
  State<MovieWatchTrailerScreen> createState() =>
      _MovieWatchTrailerScreenState();
}

class _MovieWatchTrailerScreenState extends State<MovieWatchTrailerScreen> {
  YoutubePlayerController? _controller;
  bool isVideoControllerInitialized = false;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    debugPrint("Trailer Key : ${widget.trailerKey}");
    _controller = YoutubePlayerController(
      initialVideoId: '${widget.trailerKey}',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        loop: false,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.transparentColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: YoutubePlayer(
            aspectRatio: 4 / 3,
            controlsTimeOut: Duration(seconds: 5),
            controller: _controller!,
            showVideoProgressIndicator: true,
            progressColors: ProgressBarColors(
              playedColor: AppColors.darkBlue,
              handleColor: AppColors.textColor,
            ),
            onEnded: (YoutubeMetaData youtubeMetaData) {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      floatingActionButton:
      Container(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          child: CommonWidgets.customText(
              text: "Done",
              lines: 2,
              fontWeight: FontWeight.bold,
              fontSize: getFontRatio() * 12,
              fontFamily: Assets.poppinsMedium,
              color: AppColors.whiteColor,
              alignment: TextAlign.center),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
