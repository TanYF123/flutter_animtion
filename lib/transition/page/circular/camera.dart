import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> with TickerProviderStateMixin{

  bool backPressed = false;

  late AnimationController controllerToIncreasingCurve;

  late AnimationController controllerToDecreasingCurve;

  late Animation<double> animationToIncreasingCurve;

  late Animation<double> animationToDecreasingCurve;


  @override
  void initState() {
    controllerToIncreasingCurve = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    controllerToDecreasingCurve = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animationToIncreasingCurve = Tween<double>(begin: 500.0, end: 0.0)
        .animate(CurvedAnimation(parent: controllerToIncreasingCurve, curve: Curves.fastLinearToSlowEaseIn))
        ..addListener(() {
          setState(() {

          });
        });

    animationToDecreasingCurve = Tween<double>(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controllerToDecreasingCurve, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {

        });
      });

    controllerToIncreasingCurve.forward();
    super.initState();
  }

  @override
  void dispose() {
    controllerToIncreasingCurve.dispose();
    controllerToDecreasingCurve.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (v){
        backPressed = true;
        controllerToDecreasingCurve.forward();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
            backPressed == false
                ? animationToIncreasingCurve.value
                : animationToDecreasingCurve.value
        ),
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white,width: 2)
                    ),
                    child: const Icon(
                      CupertinoIcons.arrow_2_circlepath,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    height: 65,
                    width: 65,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white,width: 3)
                    ),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 2),
                      shape: BoxShape.circle,
                      color: Colors.white24
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
