//Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Pages
import 'package:invony/pages/products_page.dart';
import 'package:invony/pages/profile_page.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _HomepageState();
}

class _HomepageState extends State<HomePage> {

  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: PageView(
        children: <Widget>[
          ProductsPage(),
          ProfilePage(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_sharp),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

}
