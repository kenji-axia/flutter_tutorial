import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class YoutubeAppBar extends StatelessWidget {
  const YoutubeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(7, 0, 7, 7),
      child: Row(
        children: const <Widget>[
          YoutubeLogo(),
          SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              Icons.cast,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              Icons.notifications_none_sharp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          YoutubeUerIcon(),
        ],
      ),
    );
  }
}

class YoutubeLogo extends StatelessWidget {
  const YoutubeLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
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

class YoutubeUerIcon extends StatelessWidget {
  const YoutubeUerIcon({Key? key}) : super(key: key);

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
          Text(
            'K',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
