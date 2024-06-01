import 'package:flutter/material.dart';
import 'package:wolfcareapp/tabPages/activity_tab.dart';
import 'package:wolfcareapp/tabPages/home_tab.dart';
import 'package:wolfcareapp/tabPages/profile_tab.dart';
import 'package:wolfcareapp/tabPages/discounts_tab.dart';

class MainScreen extends StatefulWidget
{


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index)
  {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;

    });
  }

  @override
  void initState() {

    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: TabBarView(
       physics: NeverScrollableScrollPhysics(),
       controller: tabController,
       children: const [
         HomeTabPage(),
         ActivityTabPage(),
         DiscountTabPage(),
         ProfileTabPage(),
       ],
     ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: "Hoạt động",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: "Ưu đãi",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),

        ],

        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xffB81736),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
