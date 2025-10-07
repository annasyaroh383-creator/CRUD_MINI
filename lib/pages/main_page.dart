import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koen/pages/category_page.dart';
import 'package:koen/pages/home_page.dart';
import 'package:koen/pages/transaction_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), categoryPage()];
  int currenIndex = 0;

  void onTapTapped(int index) {
    setState(() {
      currenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currenIndex == 0)
          ? CalendarAppBar(
              accent: Colors.blueGrey,
              backButton: false,
              locale: 'id',
              onDateChanged: (value) => print(value),
              firstDate: DateTime.now().subtract(Duration(days: 140)),
              lastDate: DateTime.now(),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 36,
                    horizontal: 16,
                  ),
                  child: Text(
                    'Categories',
                    style: GoogleFonts.montserrat(fontSize: 20),
                  ),
                ),
              ),
            ),
      floatingActionButton: Visibility(
        visible: (currenIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(builder: (context) => TransactionPage()),
                )
                .then((value) {
                  setState(() {});
                });
          },
          backgroundColor: Colors.white,
          child: Icon(Icons.add),
        ),
      ),
      body: _children[currenIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                onTapTapped(0);
              },
              icon: Icon(Icons.home),
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {
                onTapTapped(1);
              },
              icon: Icon(Icons.list),
            ),
          ],
        ),
      ),
    );
  }
}
