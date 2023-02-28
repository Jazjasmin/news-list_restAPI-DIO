import 'package:flutter/material.dart';
import 'package:news_api/const_value/const.dart';


ValueNotifier<int> IndexChangeNotifier = ValueNotifier(0);

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: IndexChangeNotifier,
      builder: (context, int newindex, _) {
        return BottomNavigationBar(
          currentIndex: newindex,
          onTap: (index) {
            IndexChangeNotifier.value = index;
          },
          elevation: 0,
          type: BottomNavigationBarType.fixed,
      backgroundColor: kblack,
      selectedItemColor: kwhite,
      selectedLabelStyle: const TextStyle(
        fontSize: 11,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 11,
      ),
      unselectedItemColor: kgrey,
      selectedIconTheme: const IconThemeData(
        color: kwhite,
      ),
      unselectedIconTheme: const IconThemeData(
        color: kgrey ,
      ),
      items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home'), 
        BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: 'Categories'),   
        BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favourates'),
      ],
        );
      },


        );
      }
      
}
  