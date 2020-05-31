import 'package:flutter/material.dart';
import '../page/home_page.dart';
import '../page/my_page.dart';
import '../page/balance_page.dart';
import '../page/fee_page.dart';
import '../page/rate_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          BalancePage(),
          RatePage(),
          FeePage(),
          MyPage(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items:
          [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: _defaultColor,),
                  activeIcon: Icon(Icons.home, color: _activeColor,),
                title: Text(
                    "Home",
                    style: TextStyle(
                      color: _currentIndex == 0 ? _activeColor :_defaultColor,
                    )
                ),
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet, color: _defaultColor,),
              activeIcon: Icon(Icons.account_balance_wallet, color: _activeColor,),
              title: Text(
                  "Balance",
                  style: TextStyle(
                    color: _currentIndex == 1 ? _activeColor :_defaultColor,
                  )
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rate_review, color: _defaultColor,),
              activeIcon: Icon(Icons.rate_review, color: _activeColor,),
              title: Text(
                  "Rate",
                  style: TextStyle(
                    color: _currentIndex == 2 ? _activeColor :_defaultColor,
                  )
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shuffle, color: _defaultColor,),
              activeIcon: Icon(Icons.shuffle, color: _activeColor,),
              title: Text(
                  "Fee",
                  style: TextStyle(
                    color: _currentIndex == 3 ? _activeColor :_defaultColor,
                  )
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: _defaultColor,),
              activeIcon: Icon(Icons.account_circle, color: _activeColor,),
              title: Text(
                  "Accout",
                  style: TextStyle(
                    color: _currentIndex == 4 ? _activeColor :_defaultColor,
                  )
              ),
            ),
          ],
      ),
    );
  }


}