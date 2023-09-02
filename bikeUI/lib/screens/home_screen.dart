import 'package:bikebyme/components/sidebar.dart';
import 'package:bikebyme/screens/detail_screen.dart';
import 'package:bikebyme/utils/text_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> featureList = [
    'assets/images/wheel.png',
    'assets/images/car-engine.png',
    'assets/images/steering-wheel.png'
  ];
  List<Container> getFeatures() {
    List<Container> getFeatureList = [];
    for (int i = 0; i < featureList.length; i++) {
      Container container = Container(
        margin: const EdgeInsets.only(left: 10.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: const Color(0xff708985),
            borderRadius: BorderRadius.circular(7),
            boxShadow: getBoxShadow()),
        width: 60,
        height: 60,
        child: Image.asset(
          featureList[i],
          color: Colors.white,
        ),
      );
      getFeatureList.add(container);
    }
    return getFeatureList;
  }

  List<BoxShadow> getBoxShadow() {
    List<BoxShadow> boxShadowList = [];
    BoxShadow myBoxShadow = const BoxShadow(
        color: Colors.black38, offset: Offset(20, 10), blurRadius: 10);
    boxShadowList.add(myBoxShadow);
    return boxShadowList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.apps,
              size: 30,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ]),
      body: Stack(children: [
        Row(
          children: [
            SideBarWidget(),
            Expanded(
                child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen();
                            },
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.all(15),
                            height: 320,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: getBoxShadow(),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    TextUtil(text: '4.5', weight: true),
                                    Spacer(),
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const TextUtil(
                                      text: 'JAWA BIKE\n\$5,560',
                                      weight: true,
                                      size: 16.0,
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: const Icon(
                                        Icons.lock_outline,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Hero(
                            tag: '0',
                            child: Image.asset('assets/images/bike.png'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: getFeatures(),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: SafeArea(
            child: TextUtil(
              text: 'BIKES\nCOLLECTION',
              weight: true,
              size: 40.0,
              color: Colors.tealAccent,
            ),
          ),
        )
      ]),
    );
  }
}
