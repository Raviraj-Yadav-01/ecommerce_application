import 'package:flutter/material.dart';
import 'bottom_nevigation/home_page.dart';

class DashBoard extends StatefulWidget{
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Widget> mPage = [
    HomeNavPage(),
    HomeNavPage(),
    HomeNavPage(),
    HomeNavPage(),
    HomeNavPage(),
  ];

  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //backgroundColor: Colors.black,
       body: mPage[selectedIndex],
      /* body:PageView.builder(
         itemCount:mPage.length,
         itemBuilder:(_, index){
           return mPage[index];
         }
       ),
*/
      bottomNavigationBar: BottomAppBar(
        shape:CircularNotchedRectangle(),
        notchMargin: 7,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[

            IconButton( onPressed: (){
              selectedIndex = 0;
              setState((){});
            },icon:Icon(Icons.menu_open_rounded,
                color: selectedIndex==0 ? Color(0xffFF650E).withAlpha(100) : Colors.black26)),

            IconButton( onPressed: (){
              selectedIndex = 1;
              setState((){});
            },icon:Icon(Icons.favorite_border_rounded,
                color: selectedIndex==1 ? Color(0xffFF650E).withAlpha(100) : Colors.black26)),

            SizedBox(width:60),

            IconButton( onPressed: (){
              selectedIndex = 3;
              setState((){});
            },icon:Icon(Icons.shopping_cart,
                color:selectedIndex ==3 ? Color(0xffFF650E).withAlpha(100) : Colors.black26)),

            IconButton( onPressed: (){
              selectedIndex = 4;
              setState((){});
            },icon:Icon(Icons.account_circle_outlined,
                color:selectedIndex==4 ? Color(0xffFF650E).withAlpha(100) : Colors.black26)),
          ]
        )
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        floatingActionButton: FloatingActionButton(
            backgroundColor:Color(0xffFF650E),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: (){
              selectedIndex = 0;
              setState((){});
            },child:Icon(Icons.home, color: Colors.white)),
    );
  }
}