import 'package:NudgeBuddy/utils/size_config.dart';
import 'package:flutter/material.dart';

// RowInfo class renders a row of text with a title and a subtitle
class RowInfo extends StatelessWidget {
  const RowInfo({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 1.5),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.textMultiplier * 1.7),
          ),
          const Spacer(),
          Text(
            subtitle,
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.textMultiplier * 1.6),
          )
        ],
      ),
    );
  }
}
