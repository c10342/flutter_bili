import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blibli/utils/color.dart';
import 'package:flutter_blibli/utils/view_util.dart';
import 'package:flutter_blibli/widget/video_controls.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final String url;
  final String? cover;
  final bool autoPlay;
//  循环播放
  final bool looping;
//宽高比
  final double aspectRatio;
//  自定义浮层UI
  final Widget? overlayUI;

  const VideoView(
      {Key? key,
      required this.url,
      this.cover,
      this.autoPlay = false,
      this.looping = false,
      this.aspectRatio = 16 / 9,
      this.overlayUI})
      : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

//  封面
  get _placeholder {
    return widget.cover != null
        ? FractionallySizedBox(
            widthFactor: 1,
            child: cacheImage(widget.cover!),
          )
        : Container();
  }

  //进度条颜色配置
  get _progressColors => ChewieProgressColors(
      playedColor: primary,
      handleColor: primary,
      backgroundColor: Colors.grey,
      bufferedColor: primary.shade50);

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.url);
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: widget.autoPlay,
        looping: widget.looping,
        aspectRatio: widget.aspectRatio,
        allowMuting: false,
        showOptions: false,
        placeholder: _placeholder,
        materialProgressColors: _progressColors,
        customControls: VideoControls(
          showPlayButton: false,
          showLoadingOnInitialize: false,
          bottomGradient: blackLinearGradient(),
          overlayUI: widget.overlayUI,
        ));
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double playerHeight = screenWidth / widget.aspectRatio;
    return Container(
      width: screenWidth,
      height: playerHeight,
      color: Colors.grey,
      child: Chewie(
        controller: chewieController,
      ),
    );
  }
}
