import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unicons/unicons.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final color = Color(0xff171c22);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 26),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                ListTileWidget(
                  color: Colors.red,
                  icon: UniconsLine.clipboard,
                  isSelected: false,
                  label: '2',
                  title: 'All updates',
                ),
                ListTileWidget(
                  color: Colors.green,
                  icon: UniconsLine.mailbox,
                  isSelected: true,
                  label: '4',
                  title: 'Upcoming',
                ),
                ListTileWidget(
                  color: Colors.green,
                  icon: UniconsLine.users_alt,
                  isSelected: false,
                  title: 'Members',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.white.withOpacity(0.2), width: 1),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
            child: Row(
              children: [
                Icon(
                  UniconsLine.arrow_down,
                  color: Colors.white.withOpacity(0.4),
                  size: 14,
                ),
                SizedBox(width: 30),
                Text(
                  'Products',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4), fontSize: 14),
                ),
                Spacer(),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextButton(
                    onPressed: () => print('oasdasdasdasdasdasds'),
                    child: Icon(
                      UniconsLine.plus,
                      color: Colors.white.withOpacity(0.4),
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 26),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                ListViewListCheckbox(
                  isCircleCheckbox: false,
                  isNotify: true,
                  label: '2',
                  title: 'Fitness Pro',
                  colorCheckbox: Colors.red,
                ),
                ListViewListCheckbox(
                  isCircleCheckbox: false,
                  isNotify: false,
                  label: '5',
                  title: 'Solo Landing Kit',
                  colorCheckbox: Colors.yellow,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
            child: Row(
              children: [
                Icon(
                  UniconsLine.arrow_down,
                  color: Colors.white.withOpacity(0.4),
                  size: 14,
                ),
                SizedBox(width: 30),
                Text(
                  'Tags',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4), fontSize: 14),
                ),
                Spacer(),
                TextButton(
                  onPressed: () => print('oasdasdasdasdasdasds'),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Icon(
                      UniconsLine.plus,
                      color: Colors.white.withOpacity(0.4),
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 26),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                ListViewListCheckbox(
                  isCircleCheckbox: true,
                  isNotify: false,
                  label: '10',
                  title: 'Working in Progress',
                  colorCheckbox: Colors.purple,
                ),
                ListViewListCheckbox(
                  isCircleCheckbox: true,
                  isNotify: false,
                  label: '5',
                  title: 'Product Review',
                  colorCheckbox: Colors.greenAccent,
                ),
                ListTileWidget(
                  color: Colors.green,
                  icon: UniconsLine.circle_layer,
                  isSelected: false,
                  title: 'All tags',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewListCheckbox extends StatelessWidget {
  final String title;
  final Color? color;
  final Color colorCheckbox;
  final bool isCircleCheckbox;
  final bool isNotify;
  final String label;
  const ListViewListCheckbox({
    Key? key,
    required this.title,
    required this.colorCheckbox,
    this.color = Colors.grey,
    required this.isCircleCheckbox,
    required this.isNotify,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
        width: 17,
        height: 17,
        decoration: BoxDecoration(
          color: isCircleCheckbox ? colorCheckbox : null,
          borderRadius: isCircleCheckbox
              ? BorderRadius.circular(10)
              : BorderRadius.circular(3),
          border: Border.all(width: 2, color: colorCheckbox),
        ),
      ),
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(width: 20),
          if (isNotify)
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
        ],
      ),
      trailing: BadgeWidget(label: label, color: color),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String? label;
  final IconData icon;
  final bool isSelected;
  const ListTileWidget({
    Key? key,
    required this.title,
    required this.color,
    this.label,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          if (isSelected)
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
            ),
        ]),
        child: ListTile(
          onTap: () => print('press in'),
          selected: isSelected,
          selectedTileColor: Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onLongPress: () {},
          leading: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          trailing: label != null
              ? BadgeWidget(
                  label: label!,
                  color: color,
                )
              : null,
        ),
      ),
    );
  }
}

class BadgeWidget extends StatelessWidget {
  final Color? color;
  final String label;
  const BadgeWidget({
    Key? key,
    this.color = Colors.red,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 23,
      height: 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color?.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.white.withOpacity(0.2), width: 1)),
      ),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: outilineInputBorder(),
                enabledBorder: outilineInputBorder(),
                focusedBorder: outilineInputBorder(),
                hintText: 'Search...',
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5), fontSize: 14),
                suffixIcon:
                    Icon(UniconsLine.multiply, color: Colors.white, size: 16),
                prefixIcon: Icon(
                  UniconsLine.search,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: CupertinoButton(
              child: Icon(
                UniconsLine.estate,
                color: Colors.white,
                size: 18,
              ),
              onPressed: () {
                SystemSound.play(SystemSoundType.click);
              },
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder outilineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 2,
        color: Colors.white.withOpacity(0.3),
      ),
    );
  }
}
