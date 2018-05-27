import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyShop",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        platform: TargetPlatform.iOS,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var titleColor = Colors.black;
  var titleTabs = [
    "推荐",
    "新品",
    "众筹",
    "福利社",
    "限时购",
    "家居",
    "配件",
    "服装",
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: new TitleSearchBar(
          titleColor: titleColor,
          holderText: "搜索商品，共2350款好物",
        ),
        leading: new TitleButton(
          titleColor: titleColor,
          iconData: Icons.center_focus_weak,
          buttonText: "扫一扫",
        ),
        actions: <Widget>[
          new TitleButton(
            titleColor: titleColor,
            iconData: Icons.notifications_none,
            buttonText: "消息",
          ),
        ],
        bottom: new TabBar(
          controller: new TabController(length: titleTabs.length, vsync: this),
          isScrollable: true,
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          unselectedLabelColor: titleColor,
          tabs: titleTabs.map((text) {
            return new Tab(
              text: text,
            );
          }).toList(),
        ),
      ),
      body: new Center(
        child: new Text("Home"),
      ),
    );
  }
}

class TitleSearchBar extends StatelessWidget {
  final Color titleColor;
  final String holderText;

  TitleSearchBar({this.titleColor, this.holderText = "搜索商品"});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(5.0),
        color: Colors.grey[300],
      ),
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.search,
              color: titleColor,
              size: 20.0,
            ),
            new SizedBox(
              width: 8.0,
            ),
            new Text(
              holderText,
              style: new TextStyle(color: titleColor, fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleButton extends StatelessWidget {
  final Color titleColor;
  final IconData iconData;
  final String buttonText;

  TitleButton({this.titleColor, this.iconData, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {},
      child: new SizedBox(
        width: 50.0,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(iconData, color: titleColor),
            new Text(
              buttonText,
              style: new TextStyle(color: titleColor, fontSize: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}
