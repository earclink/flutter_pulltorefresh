/*
 * Author: Jpeng
 * Email: peng8350@gmail.com
 * Time:  2019-06-24 17:21
 */
import 'package:flutter/material.dart';
import 'empty_view.dart';
import 'hidefooter_bycontent.dart';
import 'horizontal_refresh.dart';
import 'Nested.dart';
import 'refresh_animatedlist.dart';
import 'refresh_pageView.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<ExampleItem> items = [
      ExampleItem(
          title: "pageView+SmartRefresher",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: PageViewExample(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "手动隐藏footer",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: HideFooterManual(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "水平刷新",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: HorizontalRefresh(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "NestedScrollView下刷新",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: NestedRefresh(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "空白视图+刷新",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: RefreshWithEmptyView(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "animatedlist结合refresher",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: AnimatedListExample(),
                appBar: AppBar(),
              );
            }));
          }),
    ];
    return ListView(
      children: items,
      itemExtent: 100.0,
    );
  }
}

class ExampleItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExampleItemState();
  }

  final Function onClick;

  final String title;

  ExampleItem({this.title, this.onClick});
}

class _ExampleItemState extends State<ExampleItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onClick,
      child: Card(
        child: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}
