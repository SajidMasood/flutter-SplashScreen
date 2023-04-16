import 'package:flutter/material.dart';

import '../model/allinonboardscreen.dart';
import '../utils/AppColors.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
        "assets/images/designf.jpg",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Prepard by exparts"),
    AllinOnboardModel(
        "assets/images/designs.jpg",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Delivery to your home"),
    AllinOnboardModel(
        "assets/images/designt.jpg",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Enjoy with everyone"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: AppColors.lightgreenshede,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Food Express",
          style: TextStyle(color: AppColors.primarygreen),
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: allinonboardlist.length,
              itemBuilder: (context, index) {
                return PageBuilderWidget(
                    title: allinonboardlist[index].titlestr,
                    description: allinonboardlist[index].description,
                    imgurl: allinonboardlist[index].imgStr);
              }),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                allinonboardlist.length,
                (index) => buildDot(index: index),
              ),
            ),
          ),
          //
          currentIndex < allinonboardlist.length - 1
              ? Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.width,
                  child: Container(),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     ElevatedButton(
                  //       onPressed: () {},
                  //       child: Text(
                  //         "Previous",
                  //         style: TextStyle(
                  //             fontSize: 18, color: AppColors.primarygreen),
                  //       ),
                  //       style: ElevatedButton.styleFrom(
                  //         primary: AppColors.lightgreenshede1,
                  //         shape: const RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.only(
                  //                 topRight: Radius.circular(20.0),
                  //                 bottomRight: Radius.circular(20.0))),
                  //       ),
                  //     ),
                  //     ElevatedButton(
                  //       onPressed: () {},
                  //       child: Text(
                  //         "Next",
                  //         style: TextStyle(
                  //             fontSize: 18, color: AppColors.primarygreen),
                  //       ),
                  //       style: ElevatedButton.styleFrom(
                  //         primary: AppColors.lightgreenshede1,
                  //         shape: const RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.only(
                  //                 topLeft: Radius.circular(20.0),
                  //                 bottomLeft: Radius.circular(20.0))),
                  //       ),
                  //     )
                  //   ],
                  // ),
                )
              : Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.01,
                  left: MediaQuery.of(context).size.width * 0.33,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('_________Sajid___________');
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 18, color: AppColors.primarygreen),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.lightgreenshede1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: AppColors.kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color:
            currentIndex == index ? AppColors.primarygreen : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;

  PageBuilderWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .5,
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset(imgurl),
          ),
          const SizedBox(
            height: 20,
          ),
          //Tite Text
          Text(title,
              style: TextStyle(
                  color: AppColors.primarygreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          //discription
          Text(description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: AppColors.primarygreen,
                fontSize: 14,
              ))
        ],
      ),
    );
  }
}
