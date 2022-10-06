import 'package:flutter/material.dart';

class YoutubeVideosSection extends StatelessWidget {
  const YoutubeVideosSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        VideoThumbnail(),
        VideoThumbnail(),
        VideoThumbnail(),
      ],
    );
  }
}

class VideoThumbnail extends StatelessWidget {
  const VideoThumbnail({Key? key}) : super(key: key);

  final _thumbnailPath = 'images/youtube_video_thumbnail.jpg';
  final _channelIconPath = 'images/youtube_channel_icon.jpg';
  final _duration = '0:56';
  final _videoTitle = '今週のウィジェットが登場！';
  final _videoInfo = 'Flutter・48万 回視聴・3年前';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Image.asset(_thumbnailPath),
            Container(
              padding: const EdgeInsets.only(right: 8, bottom: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const <Widget>[
                      PlayIndicatorPart(13),
                      PlayIndicatorPart(20),
                      PlayIndicatorPart(5)
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      _duration,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 35),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(_channelIconPath),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _videoTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      _videoInfo,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.more_vert,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PlayIndicatorPart extends StatelessWidget {
  const PlayIndicatorPart(
    this._height, {
    Key? key,
  }) : super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
      ),
      width: 8,
      height: _height,
    );
  }
}