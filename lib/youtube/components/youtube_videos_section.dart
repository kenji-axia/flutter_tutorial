import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/youtube/youtube_client_state_notifier.dart';
import 'package:flutter_tutorial/youtube/model/movie_metadata.dart';

class YoutubeVideosSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(youtubeClientStateNotifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoutubeVideosSectionTitle(),
        for (MovieMetadata movieMetadata in state.movieMetadataList) ...{
          VideoThumbnail(
            imagePath: movieMetadata.imagePath!,
            iconPath: movieMetadata.iconPath!,
            title: movieMetadata.title!,
            channelName: movieMetadata.channelName!,
            numOfViews: movieMetadata.numOfViews!,
            yearsAgo: movieMetadata.yearsAgo!,
            duration: movieMetadata.duration!,
          ),
        },
        Visibility(
          visible: state.isLoading,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
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
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

class VideoThumbnail extends StatelessWidget {
  const VideoThumbnail(
      {required this.imagePath,
      required this.iconPath,
      required this.title,
      required this.channelName,
      required this.numOfViews,
      required this.yearsAgo,
      required this.duration,
      Key? key})
      : super(key: key);

  final String imagePath;
  final String iconPath;
  final String title;
  final String channelName;
  final int numOfViews;
  final int yearsAgo;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Image.asset(imagePath),
            Padding(
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
        Padding(
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
              sizedBoxW8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 17),
                    ),
                    sizedBoxH2,
                    Text(
                      '$channelName・$numOfViews万回視聴・$yearsAgo年前',
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
        ),
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
