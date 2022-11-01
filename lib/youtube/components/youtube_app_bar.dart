import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tutorial/constants.dart';

class YoutubeAppBar extends StatelessWidget {
  const YoutubeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.fromLTRB(spacing1, spacing0, spacing1, spacing1),
      child: Row(
        children: const [
          YoutubeLogo(),
          YoutubeAppBarIcon(Icons.cast),
          YoutubeAppBarIcon(Icons.notifications_none_sharp),
          YoutubeAppBarIcon(Icons.search),
          YoutubeAppBarUserIcon(),
        ],
      ),
    );
  }
}

class YoutubeLogo extends StatelessWidget {
  const YoutubeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacingHalf),
              child: SizedBox(
                width: 30,
                height: 30,
                child: SvgPicture.asset('images/youtube_logo.svg'),
              ),
            ),
            const Text(
              'Youtube',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YoutubeAppBarIcon extends StatelessWidget {
  const YoutubeAppBarIcon(this._iconData, {super.key});

  final IconData _iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Icon(
        _iconData,
        color: Colors.white,
      ),
    );
  }
}

class YoutubeAppBarUserIcon extends StatelessWidget {
  const YoutubeAppBarUserIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: const [
          Icon(
            Icons.circle,
            color: Colors.deepPurpleAccent,
            size: 35,
          ),
          Text('K'),
        ],
      ),
    );
  }
}
