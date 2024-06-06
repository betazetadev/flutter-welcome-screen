import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final String image;
  final String text;
  final Gradient gradient;
  final VoidCallback? onPressed;

  const WelcomePage({
    super.key,
    required this.image,
    required this.text,
    required this.gradient,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, height: 200,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 24,
                    color: CupertinoColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          if(onPressed != null)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 200, // specify the width of the button
                  child: TextButton(
                    onPressed: onPressed,
                    style: TextButton.styleFrom(
                      backgroundColor: CupertinoColors.systemBlue,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: const Text('Get Started', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}