import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

import 'package:flutter_tutorial/youtube/data_class/movie_info.dart';

class YoutubeVideosSection extends StatelessWidget {
  YoutubeVideosSection({Key? key}) : super(key: key);

  final List<MovieInfo> _dummyMovieInfo = [
    MovieInfo(
      imagePath: 'images/youtube_video_thumbnail.jpg',
      iconPath: 'images/youtube_channel_icon.jpg',
      title: '今週のウィジェットが登場！',
      subTitle: 'Flutter・48万 回視聴・3年前',
      duration: '0:56',
    ),
    MovieInfo(
      imagePath: 'images/youtube_video_thumbnail.jpg',
      iconPath: 'images/youtube_channel_icon.jpg',
      title: '今週のウィジェットが登場！',
      subTitle: 'Flutter・48万 回視聴・3年前',
      duration: '0:56',
    ),
    MovieInfo(
      imagePath: 'images/youtube_video_thumbnail.jpg',
      iconPath: 'images/youtube_channel_icon.jpg',
      title: '今週のウィジェットが登場！',
      subTitle: 'Flutter・48万 回視聴・3年前',
      duration: '0:56',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoutubeVideosSectionTitle(),
        for (MovieInfo movieInfo in _dummyMovieInfo) ...{
          VideoThumbnail(
            imagePath: movieInfo.imagePath,
            iconPath: movieInfo.iconPath,
            title: movieInfo.title,
            subTitle: movieInfo.subTitle,
            duration: movieInfo.duration,
          )
        }
      ],
    );
  }
}

class YoutubeVideosSectionTitle extends StatelessWidget {
  const YoutubeVideosSectionTitle({Key? key}) : super(key: key);

  final String title = '急上昇動画';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacing2),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}

class VideoThumbnail extends StatelessWidget {
  const VideoThumbnail(
      {required this.imagePath,
      required this.iconPath,
      required this.title,
      required this.subTitle,
      required this.duration,
      Key? key})
      : super(key: key);

  final String imagePath;
  final String iconPath;
  final String title;
  final String subTitle;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Image.asset(imagePath),
            Container(
              padding: const EdgeInsets.only(right: spacing1, bottom: spacing1),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const <Widget>[
                      PlayIndicatorPart(height: 13),
                      PlayIndicatorPart(height: 20),
                      PlayIndicatorPart(height: 5),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: spacing1),
                    padding: const EdgeInsets.all(spacingHalf),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(duration),
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
                    image: AssetImage(iconPath),
                  ),
                ),
              ),
              const SizedBox(
                width: spacing1,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: spacingMin,
                    ),
                    Text(
                      subTitle,
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
  const PlayIndicatorPart({
    required this.height,
    Key? key,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: spacingMin),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
      ),
      width: spacing1,
      height: height,
    );
  }
}
