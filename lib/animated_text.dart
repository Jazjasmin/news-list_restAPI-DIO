import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:news_api/widgets/main_page.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({ Key? key }) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {

 @override
  void initState() {
    gotoSplashScreen();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 243, 211),
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
              RotateAnimatedText('Welcome',
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 86, 72, 150),
                fontSize: 45,
              ),
              ),
               RotateAnimatedText('To',
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 42, 100, 148),
                fontSize: 55,
                fontStyle: FontStyle.italic,
              ),
              ),
               RotateAnimatedText(
                 'Kawika Technology',
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 241, 101, 46),
                fontSize: 35,
              ),
              ),            
          ],
        )
     
      ),
    );
  }
   Future<void> gotoSplashScreen() async {
    await Future.delayed(Duration(seconds: 8));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => MainPage()));
  }
}