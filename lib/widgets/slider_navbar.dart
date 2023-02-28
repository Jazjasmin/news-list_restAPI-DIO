import 'package:flutter/material.dart';
import 'package:news_api/Favourite/screen_favourite.dart';
import 'package:news_api/widgets/main_page.dart';

class SliderNavbar extends StatelessWidget {
  const SliderNavbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Kawika.com'),
           accountEmail: Text('hr.kawika@gmail.com'),
           currentAccountPicture: CircleAvatar(
             child: ClipOval(
               child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS99tACtVLtrmUQm3Al3om31nFCAA-OiGVV5aCVV4pkPFldR_-a1o_lv769thCF2Eb3caI&usqp=CAU',
               width: 90,
               height: 90,
               fit: BoxFit.cover,
               
               ),
             ),
           ),
           decoration: const BoxDecoration(
             image: DecorationImage(
               image: NetworkImage(
                 'https://media.istockphoto.com/photos/blue-background-picture-id157571423?k=20&m=157571423&s=612x612&w=0&h=GxSD_uRBNlBtsvXo54kGstPong-zzqKR545fF1Y5Mws='),
                 fit: BoxFit.cover,
                 ),
    
           ),
           ),
           ListTile(
             leading: const Icon(Icons.home),
             title: const Text('Home'),
             onTap:(){
                Navigator.push(context,
               MaterialPageRoute(
                 builder: (context) => MainPage(),
                 )
                );
             },
           ),
           ListTile(
             leading: const Icon(Icons.category),
             title: const Text('Categories'),
             onTap:() =>
               Navigator.of(context).pushReplacement(
                 MaterialPageRoute(builder: (context)=> MainPage(),
                 )
                 ),
             
           ),
           ListTile(
             leading: const Icon(Icons.favorite),
             title: const Text('Favourite'),
             onTap:(){
                Navigator.push(context,
               MaterialPageRoute(
                 builder: (context) => const ScreenFavourites(),
                 )
                );
             },
           ),
        ],
      ),

    );
  }
}