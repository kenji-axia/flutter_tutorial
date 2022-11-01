import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

class YoutubeCategoriesSection extends StatelessWidget {
  const YoutubeCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(28, 25, 30, 1),
      ),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(spacing2),
        crossAxisSpacing: spacing2,
        mainAxisSpacing: spacing1,
        crossAxisCount: 2,
        childAspectRatio: 4,
        children: const <Widget>[
          CategoryButton(
            '急上昇',
            Color.fromRGBO(122, 36, 55, 1),
            Icons.local_fire_department,
          ),
          CategoryButton(
            '音楽',
            Color.fromRGBO(82, 151, 136, 1),
            Icons.music_note,
          ),
          CategoryButton(
            'ゲーム',
            Color.fromRGBO(158, 114, 110, 1),
            Icons.sports_esports,
          ),
          CategoryButton(
            'ニュース',
            Color.fromRGBO(34, 74, 124, 1),
            Icons.newspaper,
          ),
          CategoryButton(
            '学び',
            Color.fromRGBO(57, 120, 83, 1),
            Icons.lightbulb,
          ),
          CategoryButton(
            'ライブ',
            Color.fromRGBO(211, 115, 67, 1),
            Icons.settings_input_antenna,
          ),
          CategoryButton(
            'スポーツ',
            Color.fromRGBO(52, 117, 142, 1),
            Icons.sports_soccer,
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton(
    this._categoryText,
    this._categoryColor,
    this._categoryIcon, {
    super.key,
  });

  final String _categoryText;
  final Color _categoryColor;
  final IconData _categoryIcon;

  double get _categoryIconSize => 26;
  double get _categoryTextSize => 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _categoryColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: spacing1),
      child: Row(
        children: [
          Icon(
            _categoryIcon,
            color: Colors.white,
            size: _categoryIconSize,
          ),
          const SizedBox(width: spacing1),
          Text(
            _categoryText,
            style: TextStyle(
              fontSize: _categoryTextSize,
            ),
          ),
        ],
      ),
    );
  }
}
