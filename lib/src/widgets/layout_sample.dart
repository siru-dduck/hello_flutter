/**
 * https://flutter-ko.dev/docs/development/ui/layout/tutorial 
 * 레이아웃 예제 만들기 연습
 */
import 'package:flutter/material.dart';

import 'package:hello_flutter/src/widgets/favorite_widget.dart';

class LayoutSample extends StatelessWidget {
  LayoutSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE')
      ],
    ));

    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('Somewhere Lake Campground',
                        style: TextStyle(fontWeight: FontWeight.bold)))
              ],
            )),
            FavoriteWidget()
          ],
        ));

    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
          softWrap: true,
        ));

    return MaterialApp(
        title: "Flutter Layout Sample",
        home: Scaffold(
            appBar: AppBar(title: const Text('Flutter Layout Sample!')),
            body: ListView(
              children: [
                Image.asset('assets/images/lake.jpeg',
                    width: 600, height: 240, fit: BoxFit.cover),
                titleSection,
                buttonSection,
                textSection
              ],
            )));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(label,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: color)))
      ],
    );
  }
}
