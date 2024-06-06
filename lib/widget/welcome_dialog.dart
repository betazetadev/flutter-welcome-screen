import 'package:flutter/material.dart';
import 'package:welcome_screen/widget/welcome_page.dart';

class WelcomeDialog extends StatefulWidget {
  @override
  _WelcomeDialogState createState() => _WelcomeDialogState();
}

class _WelcomeDialogState extends State<WelcomeDialog> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context){
    List<WelcomePage> _pages = [
      WelcomePage(
        image: 'assets/welcome.png',
        text: 'Welcome to Welcome Screen',
        gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
      ),
      WelcomePage(
        image: 'assets/welcome_intro.png',
        text: 'With Welcome Screen you can easily welcome anybody',
        gradient: LinearGradient(colors: [Colors.green, Colors.yellow]),
      ),
      WelcomePage(
        image: 'assets/welcome_main.png',
        text: 'Improve the User Experience with a Welcome Screen!',
        gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
        onPressed: _showSnackbar,
      ),
    ];
    return Dialog(
      backgroundColor: Colors.transparent,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (context, index){
          return AnimatedBuilder(animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if(_pageController.position.haveDimensions){
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              }
              return Center(
                child: SizedBox(
                  height: Curves.easeOut.transform(value) * 500,
                  width: Curves.easeOut.transform(value) * 400,
                  child: child
                ),
              );
            },
            child: _pages[index],
          );
        },
      ),
    );
  }

  void _showSnackbar(){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Welcome!!")));
  }
}