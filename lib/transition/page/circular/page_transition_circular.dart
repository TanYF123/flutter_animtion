import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/transition/page/circular/camera.dart';
import 'package:flutter_animation/transition/page/circular/custom_page_transition_animation.dart';

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 7.0),
          child: Icon(
            CupertinoIcons.camera,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'circular',
          style: TextStyle(color: Colors.black,fontSize: 25),
        ),
        actions: const [
          Icon(
            CupertinoIcons.bolt_horizontal_circle,
            color: Colors.black,
          ),
          SizedBox(width: 17,)
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 2,
            padding: const EdgeInsets.all(17.0),
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()
            ),
            itemBuilder: (BuildContext context, int index) => Container(
              width: size.width,
              height: size.width,
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0,3)
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            child: Icon(
                              CupertinoIcons.person,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            'Gaurav Tantuway',
                            style: TextStyle(
                              color: Colors.black.withOpacity(.8),
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                      const Icon(
                        Icons.more_horiz_rounded
                      )
                    ],
                  ),
                  Container(
                    width: size.width,
                    height: size.width*.75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/v2-73e601f604e67471f220b819fd245d77_r.jpg'
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.pink,
                            size: 23,
                          ),
                          const SizedBox(width: 5,),
                          const Text(
                            '100',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Icon(
                            CupertinoIcons.bubble_right,
                            color: Colors.black.withOpacity(.7),
                            size: 23,
                          ),
                          const SizedBox(width: 5,),
                          const Text(
                            '3',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Icon(
                            CupertinoIcons.rocket,
                            color: Colors.black.withOpacity(.7),
                            size: 23,
                          )
                        ],
                      ),
                      Icon(
                        CupertinoIcons.bookmark,
                        color: Colors.black.withOpacity(.7),
                        size: 23,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(CupertinoIcons.house_alt_fill,size: 27,),
                      Icon(CupertinoIcons.search,size: 27,color: Colors.black54,),
                      SizedBox(),
                      Icon(CupertinoIcons.heart,size: 27,color: Colors.black54,),
                      Icon(CupertinoIcons.circle_filled,size: 27,color: Colors.black54,),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => Navigator.of(context).push(MyCustomPageTransitionAnimation(const CameraScreen())),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        border: Border.all(color: Colors.white,width: 3)
                      ),
                      child: const Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


