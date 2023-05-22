import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_shorts_clone/components/ActionButtonsInShortsComponent.dart';
import 'package:youtube_shorts_clone/components/shortDetails.dart';

import '../models/postModel.dart';

class ShortComponent extends StatefulWidget {
  const ShortComponent({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<ShortComponent> createState() => _ShortComponentState();
}

class _ShortComponentState extends State<ShortComponent> {

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.post.submission.mediaUrl);

    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {
        _controller.setLooping(true);
        if (_isVideoPlaying) {
          _controller.play();
        } else {
          _controller.pause();
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isVideoPlaying = true;
  bool _showPausePlayIcon = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                        _isVideoPlaying = false;
                      } else {
                        _controller.play();
                        _isVideoPlaying = true;
                      }
                      _showPausePlayIcon = true;
                      Timer(Duration(seconds: 1), () {
                        setState(() {
                          _showPausePlayIcon = false;
                        });
                      });
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: _showPausePlayIcon ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 300),
                        child: Icon(
                          _isVideoPlaying ? Icons.pause_circle : Icons.play_circle,
                          size: 60,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: ActionButtonsInShortsComponent(
              post: widget.post,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: ShortDetail(
              post: widget.post,
            ),
          ),
        ),
      ],
    );
  }
}
