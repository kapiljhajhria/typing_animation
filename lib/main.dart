import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TypingDots()));

class TypingDots extends StatefulWidget {
  @override
  _TypingDotsState createState() => _TypingDotsState();
}

class _TypingDotsState extends State<TypingDots>
    with SingleTickerProviderStateMixin {
  double radius = 20.0;
  AnimationController typingAnimationController;
  @override
  void initState() {
    typingAnimationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    typingAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        typingAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        typingAnimationController.forward();
      }
    });
    typingAnimationController.addListener(() {
      setState(() {});
    });
    typingAnimationController.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(70.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Transform.scale(
                scale: Tween(begin: 1.0, end: 2.0)
                    .transform(typingAnimationController.value),
                child: Container(
                  width: radius,
                  height: radius,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Transform.scale(
                scale: Tween(begin: 1.0, end: 2.0)
                    .transform(typingAnimationController.value),
                child: Container(
                  width: radius,
                  height: radius,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Transform.scale(
                scale: Tween(begin: 1.0, end: 2.0)
                    .transform(typingAnimationController.value),
                child: Container(
                  width: radius,
                  height: radius,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
