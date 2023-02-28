import 'package:flutter/material.dart';
import 'package:news_api/Favourite/screen_favourite.dart';
import 'package:news_api/category/news_category.dart';
import 'package:news_api/const_value/const.dart';
import 'package:news_api/home/news_home.dart';
import 'package:news_api/widgets/bottom_navigation.dart';
import 'package:news_api/widgets/slider_navbar.dart';

class MainPage extends StatelessWidget {
   MainPage({ Key? key }) : super(key: key);


final pages =[
  const NewsHome(),
  const NewsList(),
  const ScreenFavourites(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      drawer: SliderNavbar(),
      appBar: AppBar(
        backgroundColor: kblack,
        title: const Text('Get News Details'),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: IndexChangeNotifier,
          builder: (context,int index, _) {
            return pages[index];
          }, 
          ),
      ),
      bottomNavigationBar: BottomNavWidget(),
    );
  
  }
}